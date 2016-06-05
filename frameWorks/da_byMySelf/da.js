//design assistant v0.2
//使用方式:賦予目標元素da class代表啟用，再指定想要的服務class，例如spt class就是在console展示目標元素的全部CSS屬性
//以assistant類別當做進入點(避免重複搜尋CSS目標的動作)，再依子類別判定套用哪一個功能
//預定新增服務:
//暫時沒有時間新增了…

var da = {};
da.users = {};
da.services= {};

//指定物件方法不是宣告，不會hoist，所以要先定義
//置中
da.services.middlize = function (user){
    //user需為容器
    //容器中有多個block子元素時，使最上與最底的子元素與容器間距相同, 一般使用情境是設定一個給定高度的div，定義此div類別為middlize，即可使其內部子元素置中
    //容器未給定高度的情境不適用，此部份視需求決定是否加入自動置中

    //容器padding-top+height+padding-bottom為視覺高度
    //上下元素間若有margin交錯，取大者生效
    //首元素margin-top不影響，除非容器有padding-top或是容器本身有float
    //initialize
    var eleTtlHeight=0, conTtlHeight=0, firChiTop=0, styleEle={}, styleCon={}, firChiEle={}, conPadTop=0, firPadTop=0, marginArr=[], modifyVol=0, isFloat=0;

    //開始運算
    //    properViewer(user);
    styleCon = window.getComputedStyle(user);
    //容器是否float
    if (styleCon.getPropertyValue('float')!='none'){isFloat=1;}
    //console.log('isFloat:' + isFloat);
    //計算容器視覺高度
    conPadTop=parseFloat(styleCon.getPropertyValue('padding-top'));
    conTtlHeight=conPadTop;
    conTtlHeight+=parseFloat(styleCon.getPropertyValue('height'));
    conTtlHeight+=parseFloat(styleCon.getPropertyValue('padding-bottom'));
    //取得容器子元素
    var eles = user.children;
    //統計子元素高度
    for(var i=0;i<eles.length;i++){
        //取得計算後的css屬性值
        styleEle = window.getComputedStyle(eles[i]);
        if(i==0){
            firChiEle=eles[i];
            //計算首元素內容上方高度firChiTop與至尾元素height為止的高度
            if(conPadTop!=0 || isFloat==1) {
                firChiTop+=parseFloat(styleEle.getPropertyValue('margin-top'));
            }
            firChiTop+=parseFloat(styleEle.getPropertyValue('border-top-width'));
            firPadTop=parseFloat(styleEle.getPropertyValue('padding-top'));
            firChiTop+=firPadTop;
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('height'));
            if(i!=eles.length-1){
                eleTtlHeight+=parseFloat(styleEle.getPropertyValue('padding-bottom'));
                eleTtlHeight+=parseFloat(styleEle.getPropertyValue('border-bottom-width'));
            }
        }else if(i!=eles.length-1){
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('border-top-width'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('padding-top'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('height'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('padding-bottom'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('border-bottom-width'));
        }else if(i==eles.length-1){
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('border-top-width'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('padding-top'));
            eleTtlHeight+=parseFloat(styleEle.getPropertyValue('height'));
        }
        //margin用max另外處理
        marginArr[i]= [parseFloat(styleEle.getPropertyValue('margin-top')),parseFloat(styleEle.getPropertyValue('margin-bottom'))];
        if(i!=0){
            eleTtlHeight+=Math.max(marginArr[i-1][1],marginArr[i][0]);
        }
    }
    //上部高conPadTop+firChiTop
    //底部餘高conTtlHeight-conPadTop-firChiTop-eleTtlHeight
    //首元素padding調整值，(conTtlHeight-eleTtlHeight)/2=上下留空距離
    modifyVol = (conTtlHeight-eleTtlHeight)/2 - firChiTop - conPadTop;
    //調整後的padding-top值
    firPadTop+=modifyVol;
    firChiEle.style.paddingTop = firPadTop + 'px';
    console.log('=======================================');
    console.log('You should set padding-top of first child to [ ' + firPadTop + ' ] px for middlize.');
    //debug用
    //    console.log('middlizer result');
    //    console.log('=======================================');
    //    console.log('conTtlHeight: ' + conTtlHeight);
    //    console.log('eleTtlHeight: ' + eleTtlHeight);
    //    console.log('distance: ' + (conTtlHeight-eleTtlHeight)/2);
    //    console.log('firChiTop: ' + firChiTop);
    //    console.log('ori_firPadTop: ' + (firPadTop+modifyVol));
    //    console.log('modifyVol: ' + modifyVol);
    //    console.log('mod_firPadTop: ' + firPadTop);
    //    properViewer(user);
}

//揭露元素CSS屬性
da.services.showProperty = function (user){
    var userPpt = window.getComputedStyle(user), showAll = 0, pptIdSet = [14,15,16,38,21,30,33,46,48,49,52,54,55,,57,59,62,63,66,67,68,69,70,71,75,72,73,74,76,77,78,79,86,92,93,94,98,95,96,97,100,101,102,103,105,106,107,108,109,112,113,114,115,116,117,118,119,121,125,127,128,129,130,131,208,209,210,219,220,221,222,234,233,232,245,248,249,250,251];
    //全秀or只秀自選屬性
    if (showAll) {
        console.log('=======================================\ntotal: [ ' + userPpt.length + ' ] properties.');
        for(var i=0;i<userPpt.length;i++){
            console.log(userPpt[i] + ': ' + userPpt.getPropertyValue(userPpt[i]));
        }
    }else {
        console.log('=======================================\nshow [ ' + pptIdSet.length + ' ] choosen properties.');
        for(var i=0;i<pptIdSet.length;i++){
            console.log(userPpt[pptIdSet[i]] + ': ' + userPpt.getPropertyValue(userPpt[pptIdSet[i]]));
        }
    }
}

//取得使用assistant入口類別的元素清單
da.users = document.getElementsByClassName('da');

//判斷使用什麼服務
//mdl => middlize
//spt => showProperty
if (da.users.length!=0){
    for(var e=0;e<da.users.length;e++){
        da.users[e].demands = da.users[e].classList;
        for(var c=0;c<da.users[e].demands.length;c++){
            switch (da.users[e].demands[c]) {
                case 'mdl':
                    da.services.middlize(da.users[e]);
                    break;
                case 'spt':
                    da.services.showProperty(da.users[e]);
                    break;
            }
        }
    }
}

//debug function for middlize function
function properViewer(user){
    var eles = user.children, computedStyle={};
    //show容器屬性
    computedStyle = window.getComputedStyle(user);
    console.log('container properties');
    console.log('=======================================');
    console.log('margin-top: ' + computedStyle.getPropertyValue('margin-top'));
    console.log('border-top-width: ' + computedStyle.getPropertyValue('border-top-width'));
    console.log('padding-top: ' + computedStyle.getPropertyValue('padding-top'));
    console.log('height: ' + computedStyle.getPropertyValue('height'));
    console.log('padding-bottom: ' + computedStyle.getPropertyValue('padding-bottom'));
    console.log('border-bottom-width: ' + computedStyle.getPropertyValue('border-bottom-width'));
    console.log('margin-bottom: ' + computedStyle.getPropertyValue('margin-bottom'));
    //子元素屬性
    for(var i=0;i<eles.length;i++){
        computedStyle = window.getComputedStyle(eles[i]);
        console.log('child ' + i + ' properties');
        console.log('=======================================');
        console.log('margin-top: ' + computedStyle.getPropertyValue('margin-top'));
        console.log('border-top-width: ' + computedStyle.getPropertyValue('border-top-width'));
        console.log('padding-top: ' + computedStyle.getPropertyValue('padding-top'));
        console.log('height: ' + computedStyle.getPropertyValue('height'));
        console.log('padding-bottom: ' + computedStyle.getPropertyValue('padding-bottom'));
        console.log('border-bottom-width: ' + computedStyle.getPropertyValue('border-bottom-width'));
        console.log('margin-bottom: ' + computedStyle.getPropertyValue('margin-bottom'));
    }
}

//list of CSS properties
//0: animation-delay
//1: animation-direction
//2: animation-duration
//3: animation-fill-mode
//4: animation-iteration-count
//5: animation-name
//6: animation-play-state
//7: animation-timing-function
//8: background-attachment
//9: background-blend-mode
//10: background-clip
//11: background-color
//12: background-image
//13: background-origin
//14: background-position
//15: background-repeat
//16: background-size
//17: border-bottom-color
//18: border-bottom-left-radius
//19: border-bottom-right-radius
//20: border-bottom-style
//21: border-bottom-width
//22: border-collapse
//23: border-image-outset
//24: border-image-repeat
//25: border-image-slice
//26: border-image-source
//27: border-image-width
//28: border-left-color
//29: border-left-style
//30: border-left-width
//31: border-right-color
//32: border-right-style
//33: border-right-width
//34: border-top-color
//35: border-top-left-radius
//36: border-top-right-radius
//37: border-top-style
//38: border-top-width
//39: bottom
//40: box-shadow
//41: box-sizing
//42: break-after
//43: break-before
//44: break-inside
//45: caption-side
//46: clear
//47: clip
//48: color
//49: content
//50: cursor
//51: direction
//52: display
//53: empty-cells
//54: float
//55: font-family
//56: font-kerning
//57: font-size
//58: font-stretch
//59: font-style
//60: font-variant
//61: font-variant-ligatures
//62: font-weight
//63: height
//64: image-rendering
//65: isolation
//66: left
//67: letter-spacing
//68: line-height
//69: list-style-image
//70: list-style-position
//71: list-style-type
//72: margin-bottom
//73: margin-left
//74: margin-right
//75: margin-top
//76: max-height
//77: max-width
//78: min-height
//79: min-width
//80: mix-blend-mode
//81: motion-offset
//82: motion-path
//83: motion-rotation
//84: object-fit
//85: object-position
//86: opacity
//87: orphans
//88: outline-color
//89: outline-offset
//90: outline-style
//91: outline-width
//92: overflow-wrap
//93: overflow-x
//94: overflow-y
//95: padding-bottom
//96: padding-left
//97: padding-right
//98: padding-top
//99: pointer-events
//100: position
//101: resize
//102: right
//103: speak
//104: table-layout
//105: tab-size
//106: text-align
//107: text-align-last
//108: text-decoration
//109: text-indent
//110: text-rendering
//111: text-shadow
//112: text-overflow
//113: text-transform
//114: top
//115: touch-action
//116: transition-delay
//117: transition-duration
//118: transition-property
//119: transition-timing-function
//120: unicode-bidi
//121: vertical-align
//122: visibility
//123: white-space
//124: widows
//125: width
//126: will-change
//127: word-break
//128: word-spacing
//129: word-wrap
//130: z-index
//131: zoom
//132: -webkit-appearance
//133: backface-visibility
//134: -webkit-background-clip
//135: -webkit-background-composite
//136: -webkit-background-origin
//137: -webkit-border-horizontal-spacing
//138: -webkit-border-image
//139: -webkit-border-vertical-spacing
//140: -webkit-box-align
//141: -webkit-box-decoration-break
//142: -webkit-box-direction
//143: -webkit-box-flex
//144: -webkit-box-flex-group
//145: -webkit-box-lines
//146: -webkit-box-ordinal-group
//147: -webkit-box-orient
//148: -webkit-box-pack
//149: -webkit-box-reflect
//150: -webkit-clip-path
//151: column-count
//152: column-gap
//153: column-rule-color
//154: column-rule-style
//155: column-rule-width
//156: column-span
//157: column-width
//158: -webkit-filter
//159: align-content
//160: align-items
//161: align-self
//162: flex-basis
//163: flex-grow
//164: flex-shrink
//165: flex-direction
//166: flex-wrap
//167: justify-content
//168: -webkit-font-smoothing
//169: -webkit-highlight
//170: -webkit-hyphenate-character
//171: -webkit-line-break
//172: -webkit-line-clamp
//173: -webkit-locale
//174: -webkit-margin-before-collapse
//175: -webkit-margin-after-collapse
//176: -webkit-mask-box-image
//177: -webkit-mask-box-image-outset
//178: -webkit-mask-box-image-repeat
//179: -webkit-mask-box-image-slice
//180: -webkit-mask-box-image-source
//181: -webkit-mask-box-image-width
//182: -webkit-mask-clip
//183: -webkit-mask-composite
//184: -webkit-mask-image
//185: -webkit-mask-origin
//186: -webkit-mask-position
//187: -webkit-mask-repeat
//188: -webkit-mask-size
//189: order
//190: perspective
//191: perspective-origin
//192: -webkit-print-color-adjust
//193: -webkit-rtl-ordering
//194: shape-outside
//195: shape-image-threshold
//196: shape-margin
//197: -webkit-tap-highlight-color
//198: -webkit-text-combine
//199: -webkit-text-decorations-in-effect
//200: -webkit-text-emphasis-color
//201: -webkit-text-emphasis-position
//202: -webkit-text-emphasis-style
//203: -webkit-text-fill-color
//204: -webkit-text-orientation
//205: -webkit-text-security
//206: -webkit-text-stroke-color
//207: -webkit-text-stroke-width
//208: transform
//209: transform-origin
//210: transform-style
//211: -webkit-user-drag
//212: -webkit-user-modify
//213: -webkit-user-select
//214: -webkit-writing-mode
//215: -webkit-app-region
//216: buffered-rendering
//217: clip-path
//218: clip-rule
//219: mask
//220: filter
//221: flood-color
//222: flood-opacity
//223: lighting-color
//224: stop-color
//225: stop-opacity
//226: color-interpolation
//227: color-interpolation-filters
//228: color-rendering
//229: fill
//230: fill-opacity
//231: fill-rule
//232: marker-end
//233: marker-mid
//234: marker-start
//235: mask-type
//236: shape-rendering
//237: stroke
//238: stroke-dasharray
//239: stroke-dashoffset
//240: stroke-linecap
//241: stroke-linejoin
//242: stroke-miterlimit
//243: stroke-opacity
//244: stroke-width
//245: alignment-baseline
//246: baseline-shift
//247: dominant-baseline
//248: text-anchor
//249: writing-mode
//250: vector-effect
//251: paint-order
//252: cx
//253: cy
//254: x
//255: y
//256: r
//257: rx
//258: ry