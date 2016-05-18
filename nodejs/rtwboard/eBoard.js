var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
//drawHistory[]=[switch,x or lineWidth,y or color,new_x,new_y]
//用pixelNum當做時間序列紀錄各個動作的先後順序，包含設定變更，這樣就不用每筆都記錄設定選項值
//由首個元素判定是設定還是座標組
var msgHistory = [], drawHistory = [], msgNum=0, pixelNum=0;

app.get('/', function(req, res){
    res.sendFile(__dirname + '/eBoard.html');
});

http.listen(3000, function(){
    console.log('listening on *:3000');
});
//內建的connection事件在客戶端搭建socket連線時觸發
//每組socket連線都是獨立的個體，有各自的event和event handler
io.on('connection', function(socket) {
    console.log('someone build a socket.');
    //登入初始化，傳送歷史資料予客戶端
    socket.emit('transport history',drawHistory,msgHistory);

    //設定來自此客戶端socket的各種自定義事件handler
    socket.on('login', function(data) { 
        //伺服端訊息 
        console.log(data + " connected"); 

        //將在前端輸入的名稱記錄下來 
        socket.name = data; 

        //將自己上線訊息傳給自己以外的連線
        var temp = data + ' 上線了';
        socket.broadcast.emit('msg', temp); 
        //紀錄訊息
        if(msgNum>32){
            msgHistory.shift();
            msgHistory[msgNum-1] = temp;
        }else{
            msgHistory[msgNum] = temp;
            msgNum+=1;
        }
    }); 

    //接收畫布作業訊息 
    socket.on('draw', function(data){ 
        //將畫布作業訊息傳給其他連線 
        socket.broadcast.emit('show', data);
        //紀錄歷史
        drawHistory[pixelNum] = ['d',data.x,data.y,data.new_x,data.new_y];
        pixelNum+=1;
    });
    socket.on('clear canvas',function(){
        socket.broadcast.emit('clear canvas');
        //重置drawHistory和pixelNum
        drawHistory=[];
        pixelNum=0;
    });
    socket.on('settings changed',function(settings){
        socket.broadcast.emit('settings changed',settings);
        //紀錄歷史
        drawHistory[pixelNum] = ['s',settings.size,settings.color];
        pixelNum+=1;
    });
    //離線 
    socket.on('disconnect', function() { 
        console.log(socket.name + ' disconnected');
        //通知其他人此socket已離線
        var temp = socket.name + ' 已離開';
        socket.broadcast.emit('msg', temp);
        //紀錄訊息
        if(msgNum>32){
            msgHistory.shift();
            msgHistory[msgNum-1] = temp;
        }else{
            msgHistory[msgNum] = temp;
            msgNum+=1;
        }
    }); 
    //接收聊天訊息
    socket.on('chat message',function(msg){
        var temp = socket.name + ' : ' + msg;
        io.emit('chat message',temp);
        //記錄聊天訊息
        if(msgNum>32){
            msgHistory.shift();
            msgHistory[msgNum-1] = temp;
        }else{
            msgHistory[msgNum] = temp;
            msgNum+=1;
        }
    });
});