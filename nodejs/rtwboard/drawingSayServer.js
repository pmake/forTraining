//思考哪些事或是資料是不必透過server執行或是傳遞的，進一步減輕server負擔和流量，例如client輸入的聊天訊息，冠名的部分不需在server
//而是可以在傳遞新玩家登入訊息時就將暱稱紀錄在client端，後續聊天訊息server只傳遞訊息內容，冠名的動作在client端做，訊息的部分也可以
//使用資料量小的格式傳遞，例如先壓縮或是在client端建立一次性數據，後續以簡碼存取，省去重複內容的非必要傳輸

var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
//drawingHistory[]=[switch,x or color,y or lineWidth,new_x or ex_color,new_y or ex_lineWidth]
//用pixelNum當做時間序列，紀錄各個動作的先後順序，包含設定變更，這樣就不用每筆都記錄設定選項值
//由首個元素判定是設定還是座標組
var msgHistory = [], drawingHistory = [], msgNum=0, pixelNum=0;
//experss的靜態檔案服務
app.use(express.static('static_files'));

app.get('/', function(req, res){
    res.sendFile(__dirname + '/drawingSay.html');
});

http.listen(3000, function(){
    console.log('listening on *:3000');
});

//內建的connection事件在客戶端搭建socket連線時觸發
//每組socket連線都是獨立的個體，有各自的event和event handler

//記錄繪圖軌跡以及訊息的動作是程式執行期間即時且持續進行的，所以相關程式碼效率影響很大
//因此雖然同樣的程式碼多處重複，仍不以函數簡化，以提高運行效率
io.on('connection', function(socket) {
    console.log('someone build a socket.');
    //登入初始化，傳送歷史資料予客戶端
    socket.emit('show history',drawingHistory,msgHistory);

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
        if(msgNum>24){
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
        //紀錄繪圖軌跡
        drawingHistory[pixelNum] = ['d',data.x,data.y,data.new_x,data.new_y];
        pixelNum+=1;
    });
    socket.on('clear canvas',function(settings){
        socket.broadcast.emit('clear canvas');
        //重置drawingHistory和pixelNum
        drawingHistory=[];
        pixelNum=0;
        //紀錄設定
        drawingHistory[pixelNum] = ['s',settings.color,settings.size];
        pixelNum+=1;
    });
    socket.on('settings changed',function(settings){
        socket.broadcast.emit('settings changed',settings);
        //紀錄設定
        drawingHistory[pixelNum] = ['s', settings.color, settings.size, settings.ex_color, settings.ex_size];
        pixelNum+=1;
    });
    //離線 
    socket.on('disconnect', function() { 
        console.log(socket.name + ' disconnected');
        //通知其他人此socket已離線
        var temp = socket.name + ' 已離開';
        socket.broadcast.emit('msg', temp);
        //紀錄訊息
        if(msgNum>24){
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
        //記錄訊息
        if(msgNum>24){
            msgHistory.shift();
            msgHistory[msgNum-1] = temp;
        }else{
            msgHistory[msgNum] = temp;
            msgNum+=1;
        }
    });
});