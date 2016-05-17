var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

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
    //登入初始化，要求歷史資料
    //取得連線中socket id清單
    var socketIds = Object.keys(io.sockets.sockets);
    console.log(socketIds);
    //若已存在別的連線則向最早連線的socket要求歷史資料
//    if(socketIds[0] !== socket.id) {
//        io.sockets.sockets[socketIds[0]].emit('history request','test');
//        console.log('in');
//    }
//    socket.on('response history',function(data){
//        var socketIds = Object.keys(io.sockets.sockets);
//        io.sockets.sockets[socketIds[0]].emit('response history',data);
//    });
    socket.on('response history',function(data){
        console.log('123');
        io.emit('www',data);
    });
    //設定來自此客戶端socket的各種自定義事件handler
    socket.on('login', function(data) { 
        //伺服端訊息 
        console.log(data + " connected"); 

        //將在前端輸入的名稱記錄下來 
        socket.name = data; 

        //將自己上線訊息傳給自己以外的連線 
        socket.broadcast.emit('msg', data + ' 上線了'); 
    }); 

    //接收畫布作業訊息 
    socket.on('draw', function(data){ 
        //將畫布作業訊息傳給其他連線 
        socket.broadcast.emit('show', data);
    });
    socket.on('clear canvas',function(){
        socket.broadcast.emit('clear canvas');
    });
    socket.on('settings changed',function(settings){
        socket.broadcast.emit('settings changed',settings);
    });
    //離線 
    socket.on('disconnect', function() { 
        console.log(socket.name + ' disconnected');
        //通知其他人此socket已離線 
        socket.broadcast.emit('msg', socket.name + ' 已離開'); 
    }); 
    //接收聊天訊息
    socket.on('chat message',function(msg){
        io.emit('chat message',socket.name + ' : ' + msg);
    });

});