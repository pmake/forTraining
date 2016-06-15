//答題模式input依題目字數秀等數格子，已答對部分秀字
var userName = prompt('請輸入暱稱'); //socket連線建立後使用prompt會額外建立socket，所以要在連線建立之前使用

var msgNum = 0,
    drawingColor = '#fff',
    eraserColor = 'rgb(51,51,51)',
    jqBtnDrawMode = $('#btnDrawMode'),
    jqBtnSayMode = $('#btnSayMode'),
    jqIDrawModeIcon = $('#iDrawModeIcon'),
    jqISayModeIcon = $('#iSayModeIcon'),
    jqALineWidthGroup = $('ul.lineWidthGroup li a'),
    divLineWidthShow = document.getElementById('divLineWidthShow'),
    inpUserInp = document.getElementById('inpUserInp'),
    jqUlMsgList = $('#ulMsgList'),
    jqCvDrawingArea = $('#cvDrawingArea'),
    jqBtnCleaner = $('#btnCleaner');

jqBtnDrawMode.click(function () {
    jqIDrawModeIcon.toggleClass('fa-pencil fa-eraser');
});
jqBtnSayMode.click(function () {
    jqISayModeIcon.toggleClass('fa-comments fa-key');
    if (jqISayModeIcon.hasClass('fa-key')) {
        inpUserInp.setAttribute('placeholder', '猜題模式(按鈕切換)');
    } else {
        inpUserInp.setAttribute('placeholder', '聊天模式(按鈕切換)');
    }
});
jqALineWidthGroup.click(function () {
    divLineWidthShow.style.height = this.firstChild.style.height;
});

function msgShow(msg){
    if (msgNum > 32) {
        $('li:first-child').remove();
        //jqUlMsgList.append($('<li>').text(msg))也可以，邏輯不明，<li>是選擇什麼待解;
        jqUlMsgList.append('<li>' + msg + '</li>');
    }else {
        jqUlMsgList.append('<li>' + msg + '</li>');
        //jqUlMsgList.append($('<li>').text(msg));
        msgNum+=1;
    }
}

//建立socket連線 
var socket = io();

//將輸入名稱傳到後端 node.js server 來通知其他人您已上線的訊息 
socket.emit('login', userName); 

//接收歷史資料並載入
socket.on('transport history',function(data1,data2){
    //載入既存圖畫
    data1.forEach(function(value){
        if(value[0]==='s'){
            (value[1]=='#ffffff')?$('#era').prop('checked',true):$('#draw').prop('checked',true);
            $('#size').val(value[2]);
            ctx.strokeStyle = value[1];
            ctx.lineWidth = value[2];
        }else if(value[0]==='d'){
            ctx.beginPath();  
            ctx.moveTo(value[1], value[2]);  
            ctx.lineTo(value[3],value[4]);  
            ctx.closePath();  
            ctx.stroke();
        }
    })
    //載入既存聊天訊息
    data2.forEach(function(value){
        jqUlMsgList.append('<li>' + value + '</li>');
        //$('#ulMsgList').append($('<li>').text(value));
        msgNum+=1;
    })
});

//上線通知 
socket.on('msg', function(data){ 
    msgShow(data);
}); 

//別人畫布上的動作，呈現在我們自己的頁面上 
socket.on('show', function(data){ 
    //繪圖 
    ctx.beginPath();  
    ctx.moveTo(data.x, data.y);  
    ctx.lineTo(data.new_x, data.new_y);  
    ctx.closePath();  
    ctx.stroke(); 
}); 

/* 繪圖相關設定 */ 
//宣告 canvas 元素 
var c = document.getElementById('cvDrawingArea'); 

//設定 canvas 寬與高 
c.width  = 653; 
c.height = 531; 

//判斷畫布是否有動作的布林變數 
var drawing = false; 

//canvas 元素本身沒有畫作能力，僅為圖形容器，需用 javascript 來操作畫布 
//必須透過 getContext() 來取得一個提供在 canvas 上畫圖的方法與屬性之「物件」 
var ctx = c.getContext('2d'); 

//繪圖物件初始設定 
ctx.lineCap = 'round'; 
ctx.lineJoin = 'round'; 
ctx.strokeStyle = '#fff'; 
ctx.lineWidth = 1; 

//座標相關變數 
var offset={}, x=0, y=0, new_x=0, new_y=0;
//取得畫布相對位置
offset = jqCvDrawingArea.offset();
$(window).resize(function (){
    offset = jqCvDrawingArea.offset();
});

//滑鼠在畫布按下、移動、釋放時的事件處理，on方法可一次指定多事件，多handler
jqCvDrawingArea.on({
    mousedown: function(e){
        e.preventDefault();//關閉滑鼠左鍵按下時預設的拖曳選取功能

        //打開可供畫圖的機制 
        drawing = true; 

        //計算相對座標 
        x = e.pageX - offset.left;  
        y = e.pageY - offset.top; 
        draw(x, y, x-1, y-1); 
    }
});
//on方法對本身及子元素，既存和未來新增的元素都會產生效果，理論上效率應會較差，因此此處採用一般方法掛載handler
jqCvDrawingArea.mousemove(function(e){ 
    e.preventDefault();//關閉滑鼠左鍵按下移動時預設的遊標變化功能

    //是否開啟畫圖機制 
    if( drawing ) 
    { 
        //計算移動後的新座標，再進行畫圖作業 
        new_x = e.pageX - offset.left; 
        new_y = e.pageY - offset.top; 
        draw(x, y, new_x, new_y);
        x = new_x; 
        y = new_y; 
    }
});

$(document).mouseup(function(e){ 
    e.preventDefault(); 

    //關閉繪圖機制，即使不是在畫布上釋放按鍵 
    drawing = false; 
}); 

//設定變更處理，用js做的變更不會觸發change事件
$('#settings').on('change',function(){
    //改變之前先記錄原設定
    var settings = {};
    settings.ex_color = ctx.strokeStyle;
    settings.ex_size = ctx.lineWidth;
    //套用變更
    ctx.lineWidth = $('#size').val();
    ($('#draw').prop('checked'))? ctx.strokeStyle='#000000':ctx.strokeStyle='#ffffff';
    settings.color = ctx.strokeStyle;
    settings.size = ctx.lineWidth;
    socket.emit('settings changed',settings);
});

socket.on('settings changed',function(settings){
    ctx.strokeStyle = settings.color;
    (settings.color=='#ffffff')?$('#era').prop('checked',true):$('#draw').prop('checked',true);
    $('#size').val(settings.size);
    ctx.lineWidth = settings.size;
});

//畫圖，並將繪畫座標傳給網頁上的其他使用者 
function draw(x, y, new_x, new_y) 
{  
    //繪圖 
    ctx.beginPath();  
    ctx.moveTo(x, y);  
    ctx.lineTo(new_x, new_y);  
    ctx.closePath();  
    ctx.stroke();

    //將繪畫座標透過 node.js 傳給使用者 
    var obj = {}; 
    obj.x = x; 
    obj.y = y; 
    obj.new_x = new_x; 
    obj.new_y = new_y; 
    socket.emit('draw', obj); 
}

//聊天功能
$('#btnSend').click(function(){
    if ($('#inpUserInp').val() !=='') socket.emit('chat message', $('#inpUserInp').val());
    $('#inpUserInp').val('');
});

$('#inpUserInp').focus();

//清除畫布
jqBtnCleaner.click(function(){
    ctx.clearRect(0,0,c.width,c.height);
    //清除完自動設定成繪圖模式
    ctx.strokeStyle = drawingColor;
    if (jqIDrawModeIcon.hasClass('fa-eraser')) jqIDrawModeIcon.toggleClass('fa-pencil fa-eraser');
    var settings = {};
    settings.color = ctx.strokeStyle;
    settings.size = ctx.lineWidth;
    socket.emit('clear canvas',settings);
});

socket.on('clear canvas', function(){
    ctx.clearRect(0,0,c.width,c.height);
    ctx.strokeStyle = drawingColor;
    if (jqIDrawModeIcon.hasClass('fa-eraser')) jqIDrawModeIcon.toggleClass('fa-pencil fa-eraser');
});

socket.on('chat message',function(msg){
    msgShow(msg);
});








