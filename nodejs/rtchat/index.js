//發射事件給所有人:io.emit(自定事件名稱，data)
//發射事件給除了特定socket以外的所有人:socket.broadcast.emit()，開頭的socket不會收到訊息
var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
    res.sendFile(__dirname + '/index.html');
});

//設定socket建立連線事件handler，連線事件為內建事件
io.on('connection', function(socket){
    console.log('a user connected');
    //在特定socket建立連線時，設定其斷線事件handler
    socket.on('disconnect',function(){
        console.log('user disconnected.');
    });
    //為此socket設定自訂的chat message事件handler(事件來源是由此socket的客戶端發射)
    socket.on('chat message',function(msg){
        io.emit('chat message',msg);
    });

});

http.listen(3000, function(){
    console.log('listening on *:3000');
});