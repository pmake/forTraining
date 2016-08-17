//思考哪些事或是資料是不必透過server執行或是傳遞的，進一步減輕server負擔和流量，例如client輸入的聊天訊息，冠名的部分不需在server
//而是可以在傳遞新玩家登入訊息時就將暱稱紀錄在client端，後續聊天訊息server只傳遞訊息內容，冠名的動作在client端做，訊息的部分也可以
//使用資料量小的格式傳遞，例如先壓縮或是在client端建立一次性數據，後續以簡碼存取，省去重複內容的非必要傳輸

var express = require('express'),
    app = express(),
    http = require('http').Server(app),
    io = require('socket.io')(http),
    bodyParser = require('body-parser'),
    mongoose = require('mongoose'),
    answerSchema = mongoose.Schema({
        _id: Number,
        answer: String,
        category: String,
        difficulty: String
    }),
    recordSchema = mongoose.Schema({
        _id: Number,
        pixels: Array
    });

app.set('port', (process.env.PORT || 5000));

//建立一個rooms物件模擬關聯式陣列
var rooms = {}, roomsForLobby = {};

//建立room類別
function Room (maxPlayers, gameMode){
    this.orderedPlayers = [];
    this.drawerIndex = -1;
    this.answer = '';
    this.qID = 0;
    this.remainingWords = [];
    this.msgHistory = [];
    this.drawingHistory = [];
    this.numMsgs = 0;
    this.numPixels = 0;
    this.settings = {
        maxPlayers: maxPlayers,
        gameMode: gameMode
    };
}

function roomBuilder (roomName, maxPlayers, gameMode){
    rooms[roomName] = new Room (maxPlayers, gameMode);
    roomsForLobby[roomName] = {
        maxPlayers: maxPlayers,
        numPlayers: 0,
        gameMode: gameMode
    };
}

function msgRecorder (roomName, msg){
    if(rooms[roomName].numMsgs>24){
        rooms[roomName].msgHistory.shift();
        rooms[roomName].msgHistory[rooms[roomName].numMsgs-1] = msg;
    }else{
        rooms[roomName].msgHistory[rooms[roomName].numMsgs] = msg;
        rooms[roomName].numMsgs+=1;
    }
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

//建立兩個預設畫室，
roomBuilder('你畫我猜', 12, 'Draw and guess');
roomBuilder('猜猜猜', 12, 'Guess guess guess');
//rooms['test'] = new Room (12, 'Draw and guess');
////更新Lobby用物件
//roomsForLobby['test'] = {
//    maxPlayers: rooms['test'].settings.maxPlayers,
//    Players: 1,
//    gameMode: rooms['test'].settings.gameMode
//};

//畫室屬性說明:
//drawingHistory[]=[switch,x or color,y or lineWidth,new_x or ex_color,new_y or ex_lineWidth]
//用numPixels當做時間序列，紀錄各個動作的先後順序，包含設定變更，這樣就不用每筆都記錄設定選項值
//由首個元素判定是設定還是座標組

//experss的靜態檔案服務
app.use(express.static('static_files'));

// parse application/x-www-form-urlencoded 
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json 
app.use(bodyParser.json());

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
    roomBuilder(req.body.name, req.body.maxPlayers, req.body.gameMode);
    res.send('success');
});

//處理畫室存在確認需求
app.post('/roomCheck', function(req, res){
    //rooms[req.body.name];以讀取屬性的方式判斷是否存在
    if (rooms[req.body.name]) res.send("yes");
    else res.send("no");
});

//處理邀請朋友需求
app.get('/invite', function(req,res){
    //畫室中玩家頭像區域顯示線上玩家，在還有空位的前提下於下一個頭像位置顯示一個邀請圖像連結
    //點擊連結產生以光箱效果呈現的文字框，內容為"一起玩你畫我猜吧! http://....包含roomName的queryString" 以及點擊複製連結按鈕，
    //點擊複製鈕後光箱效果消失，回到正常畫室畫面，之後將複製內容貼上給朋友即可
    //朋友點擊連結，會進入這個需求處理，此處從queryString取得roomName做後續處理
});


http.listen(app.get('port'), function(){
    console.log('The server is listening on port:', app.get('port'));
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
        socket.join(roomName);
        rooms[roomName].orderedPlayers.push(socket.id);
        socket.posInRoom = rooms[roomName].orderedPlayers.length - 1;
        roomsForLobby[roomName].numPlayers++;

        console.log("id is" + socket.id);

        //設定畫者，在離線或回合結束時轉換
        if (rooms[roomName].drawerIndex == -1){
            rooms[roomName].drawerIndex = 0;
            //資料庫取題目
            rooms[roomName].answer = '你畫我猜';
            rooms[roomName].qID++;
            var end = rooms[roomName].answer.length;
            //轉餘字陣列
            for(var i=0;i<end;i++){
                rooms[roomName].remainingWords[i]= rooms[roomName].answer[i];
            }
            var roleInfo = [socket.id, rooms[roomName].answer, rooms[roomName].qID];
            socket.emit('role', roleInfo);
        }else {
            var roleInfo = ['guesser', rooms[roomName].answer, rooms[roomName].remainingWords, rooms[roomName].qID];
            socket.emit('role',roleInfo);
        }

        //現存全部的room清單
        //console.log(socket.adapter.rooms);
        //room成員清單
        //console.log(socket.adapter.rooms[roomName]['sockets'][socket.id]);
        console.log(io.sockets.connected[socket.Id]);


        //登入初始化，傳送歷史資料予客戶端
        socket.emit('show history',rooms[roomName].drawingHistory,rooms[roomName].msgHistory);
        //伺服端訊息 
        console.log(data.playerName + " connected");
        //將在前端輸入的名稱記錄下來
        socket.playerName = data.playerName;
        /*
        //更新所有成員的室友清單
        roommateRegister('test', this);
        //登錄玩家，玩家實際上是一個socket，以名稱做為屬性名稱儲存socket物件指標
        rooms['test'].players[data] = this;
        */
        //將自己上線訊息傳給自己以外的連線
        var temp = [data.playerName + ' 上線了'];
        //socket.broadcast.emit('user message', temp); 
        //roomMessenger('user message', temp, 'test', this);
        socket.to(roomName).broadcast.emit('user message', temp);
        //紀錄訊息
        msgRecorder(roomName, temp[0]);

        //登錄事件handler
        //接收畫布作業訊息，速度優先
        socket.on('draw', function(data){
            //將畫布作業訊息傳給其他連線，即時影響力最大的作業，考慮不用function，以提速
            //socket.broadcast.emit('show', data);
            /*
        for(player in this.roommate) {
            this.roommate[player].emit('show', data)
        }
        */
            //視需要增加畫者判斷
            socket.to(roomName).broadcast.emit('show', data);

            //紀錄繪圖軌跡
            rooms[roomName].drawingHistory[rooms[roomName].numPixels] = ['d',data.x,data.y,data.new_x,data.new_y];
            rooms[roomName].numPixels+=1;
        });
        socket.on('clear canvas',function(settings){
            //this.broadcast.emit('clear canvas');
            //roomMessenger('clear canvas', '', 'test', this);
            socket.to(roomName).broadcast.emit('clear canvas');
            //drawingHistory和numPixels
            rooms[roomName].drawingHistory=[];
            rooms[roomName].numPixels=0;
            //紀錄設定
            rooms[roomName].drawingHistory[0] = ['s',settings.color,settings.size];
            rooms[roomName].numPixels+=1;
        });
        socket.on('settings changed',function(settings){
            //this.broadcast.emit('settings changed',settings);
            //roomMessenger('settings changed', settings, 'test', this);
            socket.to(roomName).broadcast.emit('settings changed', settings);
            //紀錄設定
            rooms[roomName].drawingHistory[rooms[roomName].numPixels] = ['s', settings.color, settings.size, settings.ex_color, settings.ex_size];
            rooms[roomName].numPixels+=1;
        });
        //離線 
        socket.on('disconnect', function() {
            console.log(socket.playerName + ' disconnected');
            //確認是否仍有玩家，若無則釋放自定room物件
            //當socket room中已無socket，會自動釋放socket room，自定room物件要自己釋放
            if (socket.adapter.rooms[roomName]) {
                //通知其他人此socket已離線
                var temp = [socket.playerName + ' 已離開'];
                roomsForLobby[roomName].numPlayers--;
                //this.broadcast.emit('user message', temp);
                //roomMessenger('user message', temp, 'test', this);
                socket.to(roomName).broadcast.emit('user message', temp);
                //紀錄訊息
                msgRecorder(roomName, temp[0]);
                //如果是畫者，更換畫者
                if(socket.id == rooms[roomName].orderedPlayers[rooms[roomName].drawerIndex]){
                    //清除離線者之畫者登錄
                    rooms[roomName].orderedPlayers[socket.posInRoom] = '';
                    //尋找下一個畫者
                    rooms[roomName].drawerIndex++;
                    var len = rooms[roomName].orderedPlayers.length;
                    do {
                        if (rooms[roomName].drawerIndex < len){
                            if(rooms[roomName].orderedPlayers[rooms[roomName].drawerIndex] != ''){
                                //next answer
                                rooms[roomName].answer = '你畫我猜';
                                rooms[roomName].qid++;
                                //初始化
                                rooms[roomName].remainingWords = [];
                                //轉餘字陣列
                                var stop = rooms[roomName].answer.length;
                                for(var i=0;i<stop;i++){
                                    rooms[roomName].remainingWords[i]= rooms[roomName].answer[i];
                                }
                                //畫者斷線重置，不需傳輸remainingWords，減少傳輸量
                                socket.to(roomName).broadcast.emit('role',[rooms[roomName].orderedPlayers[rooms[roomName].drawerIndex], rooms[roomName].answer, rooms[roomName].qID, 'dc']);
                                break;
                            }else{
                                rooms[roomName].drawerIndex++;
                            }
                        }else rooms[roomName].drawerIndex = 0;
                    } while(true);
                }else rooms[roomName].orderedPlayers[socket.posInRoom] = '';
            }else {
                //預設畫室不可刪除
                if (roomName == '你畫我猜' || roomName == '猜猜猜'){
                    roomsForLobby[roomName].numPlayers--;
                    var temp = socket.playerName + ' 已離開';
                    //紀錄訊息
                    msgRecorder(roomName, temp);
                    //清空畫布
                    rooms[roomName].drawingHistory=[];
                    rooms[roomName].numPixels=0;
                    //畫者狀態初始化
                    rooms[roomName].drawerIndex = -1;
                    rooms[roomName].orderedPlayers = [];
                    rooms[roomName].remainingWords = [];
                    rooms[roomName].qID = 0;
                }else {
                    //當有效率問題時，此處可測試改成null而不用delete
                    //有篇文章提到v8對常用物件有優化，delete會改變物件結構而影響優化
                    delete rooms[roomName];
                    delete roomsForLobby[roomName];
                }
            }
        }); 
        //接收聊天訊息
        socket.on('user message',function(msg){
            if(msg.roleConfirm){
                if(socket.id == rooms[roomName].orderedPlayers[rooms[roomName].drawerIndex]) socket.emit('role', [socket.id, rooms[roomName].answer, rooms[roomName].qID, 'rc', rooms[roomName].remainingWords]);
                else socket.emit('role', ['guesser', rooms[roomName].answer, rooms[roomName].remainingWords, rooms[roomName].qID]);
                return;
            }

            var temp = [socket.playerName + ' : ' + msg.content];
            //io.emit('user message',temp);
            //roomMessenger('user message', temp, 'test');
            //視需要增加非畫者判斷

            //有猜對的處理，以qID做進度控制，避免時間差導致成員進度錯亂
            if(msg.correctWords && msg.qID == rooms[roomName].qID){
                var end = msg.correctWords.length,
                    correctWords = msg.correctWords,
                    remainingWords = rooms[roomName].remainingWords,
                    wordsToAll = [];

                for(var i=0;i<end;i++){
                    if(remainingWords[correctWords[i]]) {
                        //記錄答對字的位置
                        wordsToAll.push(correctWords[i]);
                        remainingWords[correctWords[i]] = undefined;
                    }
                }
                if(wordsToAll[0] != undefined ) {
                    temp[1] = wordsToAll;
                    //軌跡記錄在這要停止，避免答對後的亂畫也被記錄
                    if (msg.isFinish == 'yes') {
                        temp[2] = 'yes';
                        rooms[roomName].drawerIndex++;
                        var len = rooms[roomName].orderedPlayers.length;
                        do {
                            if (rooms[roomName].drawerIndex < len){
                                if(rooms[roomName].orderedPlayers[rooms[roomName].drawerIndex] != ''){
                                    //next answer
                                    rooms[roomName].answer = '你畫我猜';
                                    rooms[roomName].qID++;
                                    //初始化
                                    rooms[roomName].remainingWords = [];
                                    //轉餘字陣列
                                    var stop = rooms[roomName].answer.length;
                                    for(var i=0;i<stop;i++){
                                        rooms[roomName].remainingWords[i]= rooms[roomName].answer[i];
                                    }
                                    break;
                                }else{
                                    rooms[roomName].drawerIndex++;
                                }
                            }else rooms[roomName].drawerIndex = 0;
                        } while(true);
                    }
                }
            }
            io.to(roomName).emit('user message', temp);
            //if (msg.isFinish == 'yes') {
            //    角色轉換
            //    軌跡記錄在這要停止，避免答對後的亂畫也被記錄
            //}

            //記錄訊息，和繪圖一樣是主要的即時處理程序，效率優先，不調用函數
            if(rooms[roomName].numMsgs>24){
                rooms[roomName].msgHistory.shift();
                rooms[roomName].msgHistory[rooms[roomName].numMsgs-1] = temp[0];
            }else{
                rooms[roomName].msgHistory[rooms[roomName].numMsgs] = temp[0];
                rooms[roomName].numMsgs+=1;
            }
        });
    }); 
});