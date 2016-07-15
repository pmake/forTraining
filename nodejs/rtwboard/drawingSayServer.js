//思考哪些事或是資料是不必透過server執行或是傳遞的，進一步減輕server負擔和流量，例如client輸入的聊天訊息，冠名的部分不需在server
//而是可以在傳遞新玩家登入訊息時就將暱稱紀錄在client端，後續聊天訊息server只傳遞訊息內容，冠名的動作在client端做，訊息的部分也可以
//使用資料量小的格式傳遞，例如先壓縮或是在client端建立一次性數據，後續以簡碼存取，省去重複內容的非必要傳輸

var express = require('express'),
    app = express(),
    http = require('http').Server(app),
    io = require('socket.io')(http),
    bodyParser = require('body-parser');

//建立一個rooms物件模擬關聯式陣列
var rooms = {}, roomsForLobby = {};

//建立room類別
function Room (maxPlayer, gameMode){
    //this.id = id;
    //this.players = {};
    this.drawer = {};
    this.answer = '';
    this.msgHistory = [];
    this.drawingHistory = [];
    this.msgNum = 0;
    this.pixelNum = 0;
    this.settings = {
        maxPlayer: maxPlayer,
        gameMode: gameMode
    };
}

function roomBuilder (roomName, maxPlayer, gameMode){
    rooms[roomName] = new Room (maxPlayer, gameMode);
    roomsForLobby[roomName] = {
        maxPlayers: rooms[roomName].settings.maxPlayer,
        Players: 1,
        gameMode: rooms[roomName].settings.gameMode
    };
}

/*
//室友登錄者，室友登錄在socket物件自身的屬性物件中，登錄室友是為了避免每次傳送圖點時的除外判斷，以新成員加入時的更新室友動作取代原本的每個圖點的數次判斷
function roommateRegister (room, newPlayer) {
    //先宣告物件給roommate屬性
    newPlayer.roommate = {};
    for(player in rooms[room].players){
        //更新既存成員室友指標清單
        rooms[room].players[player].roommate[newPlayer.playerName] = newPlayer;
        //更新新成員室友指標清單
        newPlayer.roommate[player] = rooms[room].players[player];
    }
}

//室友信使，無例外則exclusion可省略
function roomMessenger (event, message, room, exclusion){
    if (exclusion){
        for(player in exclusion.roommate) {
            exclusion.roommate[player].emit(event, message);
        }
    }else {
        for(player in rooms[room].players) {
            rooms[room].players[player].emit(event, message);
        }
    }
}
*/

//建立預設畫室test
roomBuilder('test', 12, 'Draw and guess');
//rooms['test'] = new Room (12, 'Draw and guess');
////更新Lobby用物件
//roomsForLobby['test'] = {
//    maxPlayers: rooms['test'].settings.maxPlayer,
//    Players: 1,
//    gameMode: rooms['test'].settings.gameMode
//};

//畫室屬性說明:
//drawingHistory[]=[switch,x or color,y or lineWidth,new_x or ex_color,new_y or ex_lineWidth]
//用pixelNum當做時間序列，紀錄各個動作的先後順序，包含設定變更，這樣就不用每筆都記錄設定選項值
//由首個元素判定是設定還是座標組

//experss的靜態檔案服務
app.use(express.static('static_files'));

// parse application/x-www-form-urlencoded 
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json 
//app.use(bodyParser.json())

//處理客戶端需求
app.get('/', function(req, res){
    res.sendFile(__dirname + '/main.html');
});

//更新畫室清單
app.get('/rooms', function(req, res){
    res.send(roomsForLobby);
});

//處理客戶端創建畫室需求
app.post('/createRoom', function(req, res){
    roomBuilder(req.body.name, req.body.maxPlayer, req.body.gameMode);
    res.send('success');
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
    //判斷進入哪一個畫室，歸屬畫室，此處先假設進入test畫室
    //--------------------------------------------
    //socket.join('test');

    //登入初始化，傳送歷史資料予客戶端
    //socket.emit('show history',rooms['test'].drawingHistory,rooms['test'].msgHistory);

    //設定來自此客戶端socket的各種自定義事件handler
    socket.on('login', function(data) { 
        //判斷進入哪一個畫室，歸屬畫室
        var roomName = data.roomName;
        this.join(roomName);
        //現存全部的room清單
        //console.log(socket.adapter.rooms);
        //room成員清單
        //console.log(socket.adapter.rooms['test']['sockets']);
        
        //test，中介變數或直接記入屬性
        this.roomName = roomName;



        //登入初始化，傳送歷史資料予客戶端
        this.emit('show history',rooms[roomName].drawingHistory,rooms[roomName].msgHistory);
        //伺服端訊息 
        console.log(data.playerName + " connected");
        //將在前端輸入的名稱記錄下來
        this.playerName = data.playerName;
        /*
        //更新所有成員的室友清單
        roommateRegister('test', this);
        //登錄玩家，玩家實際上是一個socket，以名稱做為屬性名稱儲存socket物件指標
        rooms['test'].players[data] = this;
        */
        //將自己上線訊息傳給自己以外的連線
        var temp = data.playerName + ' 上線了';
        //socket.broadcast.emit('user message', temp); 
        //roomMessenger('user message', temp, 'test', this);
        this.to(roomName).broadcast.emit('user message', temp);
        //紀錄訊息
        if(rooms[roomName].msgNum>24){
            rooms[roomName].msgHistory.shift();
            rooms[roomName].msgHistory[rooms[roomName].msgNum-1] = temp;
        }else{
            rooms[roomName].msgHistory[rooms[roomName].msgNum] = temp;
            rooms[roomName].msgNum+=1;
        }

        //登錄事件handler
        //接收畫布作業訊息，速度優先
        this.on('draw', function(data){ 
            //將畫布作業訊息傳給其他連線，即時影響力最大的作業，考慮不用function，以提速
            //socket.broadcast.emit('show', data);
            /*
        for(player in this.roommate) {
            this.roommate[player].emit('show', data)
        }
        */
            this.to(roomName).broadcast.emit('show', data);

            //紀錄繪圖軌跡
            rooms[roomName].drawingHistory[rooms[roomName].pixelNum] = ['d',data.x,data.y,data.new_x,data.new_y];
            rooms[roomName].pixelNum+=1;
        });
        this.on('clear canvas',function(settings){
            //this.broadcast.emit('clear canvas');
            //roomMessenger('clear canvas', '', 'test', this);
            this.to(roomName).broadcast.emit('clear canvas');
            //drawingHistory和pixelNum
            rooms[roomName].drawingHistory=[];
            rooms[roomName].pixelNum=0;
            //紀錄設定
            rooms[roomName].drawingHistory[rooms[roomName].pixelNum] = ['s',settings.color,settings.size];
            rooms[roomName].pixelNum+=1;
        });
        this.on('settings changed',function(settings){
            //this.broadcast.emit('settings changed',settings);
            //roomMessenger('settings changed', settings, 'test', this);
            this.to(roomName).broadcast.emit('settings changed', settings);
            //紀錄設定
            rooms[roomName].drawingHistory[rooms[roomName].pixelNum] = ['s', settings.color, settings.size, settings.ex_color, settings.ex_size];
            rooms[roomName].pixelNum+=1;
        });
        //離線 
        this.on('disconnect', function() {
            //確認Room是否還有玩家，若否，釋放Room
            console.log(this.playerName + ' disconnected');
            //通知其他人此socket已離線
            var temp = this.playerName + ' 已離開';
            //this.broadcast.emit('user message', temp);
            //roomMessenger('user message', temp, 'test', this);
            this.to(roomName).broadcast.emit('user message', temp);
            //紀錄訊息
            if(rooms[roomName].msgNum>24){
                rooms[roomName].msgHistory.shift();
                rooms[roomName].msgHistory[rooms[roomName].msgNum-1] = temp;
            }else{
                rooms[roomName].msgHistory[rooms[roomName].msgNum] = temp;
                rooms[roomName].msgNum+=1;
            }
        }); 
        //接收聊天訊息
        this.on('user message',function(msg){
            var temp = this.playerName + ' : ' + msg.content;
            //io.emit('user message',temp);
            //roomMessenger('user message', temp, 'test');
            io.to(roomName).emit('user message', temp);
            //記錄訊息
            if(rooms[roomName].msgNum>24){
                rooms[roomName].msgHistory.shift();
                rooms[roomName].msgHistory[rooms[roomName].msgNum-1] = temp;
            }else{
                rooms[roomName].msgHistory[rooms[roomName].msgNum] = temp;
                rooms[roomName].msgNum+=1;
            }
        });

    }); 
});