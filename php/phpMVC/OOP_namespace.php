<?php
//namespace是用來區隔識別id，例如變數、函數、類別名稱
//namespace是以' \ ' 模擬階層概念
//預設的namespac是' \ '，所有其他自定義namespace都是歸在其底下，可以省略，
//所以未使用自定義namespace的一般php檔案，識別名稱都不需要加' \ '，但要加也行
//要注意開頭未加上' \ ' 表示相對namespace位置，有加' \ '表示絕對namespace位置
//首個自定義namespcae必須是php檔案的第一列有效程式碼
//關鍵字 'use' 可替過長的命名空間中的類別 (class) 取別名 (alias)，例如 use a\b\c\Cat as nsCat
//namespace參考資料 : http://pydoing.blogspot.tw/2013/03/PHP-namespace.html

//使用外部檔案以include或require引入(等同在指定位置貼上該檔案程式碼片段)，namespace運作規則不變
//include與require差異參考資料: http://syunguo.blogspot.tw/2013/04/phpinclude-require.html

//當類別庫愈來愈完整，需要引入的檔案就愈多，一個一個引入太沒效率，這時可使用autoload功能
//autoload功能參考資料: http://justericgg.logdown.com/posts/196891-php-series-autoload

//以下namespace使用簡例

//定義namespace
namespace a\b\c;
//於其中定義識別名稱，此處以常數為例
const Demo = 2;

//定義另一個namespace
namespace a\b;
const Demo = 1;

//存取常數內容

//相對namespace位置，以最近的namespace為所在位置指定識別名稱，類似 '目前資料夾' 概念
echo Demo;
echo c\Demo;
//絕對namespace位置，以完整namespace階層指定識別名稱，類似 '資料夾絕對路徑' 概念
echo \a\b\Demo;
echo \a\b\c\Demo;
?>