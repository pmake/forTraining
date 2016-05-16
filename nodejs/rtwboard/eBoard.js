var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
    res.sendFile(__dirname + '/eBoard.html');
});

http.listen(3000, function(){
    console.log('listening on *:3000');
});

io.on('connection', function(socket) {
        console.log('someone build a socket.');
        //登入初始化 
        socket.on('login', function(data) 
        { 
                //伺服端訊息 
                console.log(data + " connected"); 
                
                //將在前端輸入的名稱記錄下來 
                socket.name = data; 
                
                //將自己上線訊息傳給自己的網頁 
                io.emit('msg', data + ' 上線了'); 
        }); 
        
        //接受畫布作業訊息 
        socket.on('draw', function(data){ 
                //將畫布作業訊息傳給其他線上的人 
                socket.broadcast.emit('show', data); 
        });

        //離線 
        socket.on('disconnect', function() { 
                
                console.log(socket.name + ' disconnected');
                //通知其他人此socket已離線 
                socket.broadcast.emit('msg', socket.name + ' 已離開'); 
        }); 
        
});