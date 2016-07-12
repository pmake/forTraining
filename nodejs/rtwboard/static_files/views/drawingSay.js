//答題模式input依題目字數秀等數格子，已答對部分秀字
//socket連線建立後使用prompt會額外建立socket，所以要在連線建立之前使用
var loginData = {
    playerName: prompt('請輸入暱稱'),
    roomName: $('body').attr('id')
};

//initial
var jqBtnDrawMode = $('#btnDrawMode'),
    jqBtnSayMode = $('#btnSayMode'),
    jqIDrawModeIcon = $('#iDrawModeIcon'),
    jqISayModeIcon = $('#iSayModeIcon'),
    jqALineWidthGroup = $('ul.lineWidthGroup li a'),
    divLineWidthShow = document.getElementById('divLineWidthShow'),
    computedStyleDivLWS = window.getComputedStyle(divLineWidthShow),
    drawingColor = colorToHex(computedStyleDivLWS.getPropertyValue('background-color')),
    defaultLineWidth = parseInt(computedStyleDivLWS.getPropertyValue('height')),
    eraserColor = colorToHex($('#divCanvasArea .jumbotron').css('background-color')),
    inpUserInp = document.getElementById('inpUserInp'),
    jqUlMsgList = $('#ulMsgList'),
    jqCvDrawingArea = $('#cvDrawingArea'),
    jqBtnCleaner = $('#btnCleaner'),
    jqBtnSend = $('#btnSend');

function colorToHex(color) {
    if (color.substr(0, 1) === "#") {
        return color;
    }
    var nums = /(.*?)rgb\((\d+),\s*(\d+),\s*(\d+)\)/i.exec(color),
        r = parseInt(nums[2], 10).toString(16),
        g = parseInt(nums[3], 10).toString(16),
        b = parseInt(nums[4], 10).toString(16);
    return "#"+ (
        (r.length == 1 ? "0"+ r : r) +
        (g.length == 1 ? "0"+ g : g) +
        (b.length == 1 ? "0"+ b : b)
    );
}

function msgShow(content){
    jqUlMsgList.append('<li>' + content + '</li>');
    //下列方式也可新增，邏輯待解明
    //$('#ulMsgList').append($('<li>').text(value));

    //高限是516，用526是給一點誤差buffer
    while((parseFloat(jqUlMsgList.css('height')) - 526) > 0) {
        jqUlMsgList[0].removeChild(jqUlMsgList[0].firstElementChild);
    }
}

jqBtnDrawMode.click(function () {
    //改變之前先記錄原設定
    var settings = {};
    settings.ex_color = ctx.strokeStyle;
    settings.ex_size = ctx.lineWidth;
    //套用變更
    jqIDrawModeIcon.toggleClass('fa-pencil fa-eraser');
    (jqIDrawModeIcon.hasClass('fa-pencil'))? ctx.strokeStyle = drawingColor : ctx.strokeStyle = eraserColor;
    settings.color = ctx.strokeStyle;
    settings.size = ctx.lineWidth;
    socket.emit('settings changed',settings);
});

jqALineWidthGroup.click(function () {
    var settings = {};
    settings.ex_color = ctx.strokeStyle;
    settings.ex_size = ctx.lineWidth;

    divLineWidthShow.style.height = this.firstElementChild.style.height;
    ctx.lineWidth = parseInt(this.firstElementChild.style.height);
    settings.color = ctx.strokeStyle;
    settings.size = ctx.lineWidth;
    socket.emit('settings changed',settings);
});

jqBtnSayMode.click(function () {
    jqISayModeIcon.toggleClass('fa-comments fa-key');
    if (jqISayModeIcon.hasClass('fa-key')) {
        inpUserInp.setAttribute('placeholder', '猜題模式(左側按鈕切換)');
    } else {
        inpUserInp.setAttribute('placeholder', '聊天模式(左側按鈕切換)');
    }
});

//建立socket連線 
var socket = io();

//將輸入名稱傳到後端 node.js server 來通知其他人您已上線的訊息 
socket.emit('login', loginData); 

//接收歷史資料並載入
socket.on('show history',function(drawingHistory,msgHistory){
    //載入既存圖畫
    drawingHistory.forEach(function(value){
        if(value[0]==='s'){
            if ((value[1] == drawingColor && jqIDrawModeIcon.hasClass('fa-eraser')) || (value[1] == eraserColor && jqIDrawModeIcon.hasClass('fa-pencil'))) jqIDrawModeIcon.toggleClass('fa-pencil fa-eraser');

            divLineWidthShow.style.height = value[2] + 'px';

            ctx.strokeStyle = value[1];
            ctx.lineWidth = value[2];
        }else if(value[0]==='d'){
            ctx.beginPath();  
            ctx.moveTo(value[1], value[2]);  
            ctx.lineTo(value[3], value[4]);  
            ctx.closePath();  
            ctx.stroke();
        }
    })
    //載入既存聊天訊息
    msgHistory.forEach(function(content){
        msgShow(content);
    })
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
ctx.strokeStyle = drawingColor; 
ctx.lineWidth = defaultLineWidth; 

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

socket.on('settings changed',function(settings){
    //套用設定
    ctx.strokeStyle = settings.color;
    ctx.lineWidth = settings.size;
    console.log(settings.color);
    //顯示改變
    if ((settings.color == drawingColor && jqIDrawModeIcon.hasClass('fa-eraser')) || (settings.color == eraserColor && jqIDrawModeIcon.hasClass('fa-pencil'))) {
        jqIDrawModeIcon.toggleClass('fa-pencil fa-eraser');
    }

    divLineWidthShow.style.height = settings.size + 'px';
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
inpUserInp.focus();

function msgEmiter () {
    if (inpUserInp.value !=='') {
        var msg = {};
        if (jqISayModeIcon.hasClass('fa-key')) msg.type = 'guess';
        else msg.type = 'chat';
        msg.content = inpUserInp.value;
        socket.emit('user message', msg);
        inpUserInp.value = '';
    }
}

jqBtnSend.click(function(){
    msgEmiter();
    inpUserInp.focus();
});

inpUserInp.onkeydown = function (e) {
    if (e.keyCode === 13) msgEmiter();
};

socket.on('user message',function(content){
    msgShow(content);
});

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










