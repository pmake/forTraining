<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<?php

$str = 'this is ok.';

//strtok函數，分段處理，一次處理一個分割
//第一次使用時需指定目標字串，再次使用時不需再次指定即會繼續取得下一個分割，如下例(若要更新目標字串，再次指定即可)

$div = strtok($str,' ');

echo $div . '<br>';

$div = strtok(' ');
echo $div . '<br>';
$div = strtok(' ');
echo $div . '<br>';

//explode函數，一次處理

$divs = explode(' ',$str);
foreach($divs as $temp){
    echo $temp . '<br>';
}

//strstr函數，在指定字串中搜尋指定字元目標，傳回字元位置之後的子字串
//substgr函數，傳回指定字串從指定位置開始的子字串
$filesName = array('123.jpg', '456.txt', '789.xls');
$formats = array('.jpg' => '圖片檔', '.txt' => '文字檔', '.xls' => '試算表檔');
foreach ($filesName as $fileName) {
    $sfn = strstr($fileName, '.');
    foreach ($formats as $key => $value){
        if ($sfn == $key) {
            echo "$fileName 是 $value 副檔名是 " . substr($key,1) . "<br>";
            break;
        }
    }
}


/**
 * Created by PhpStorm.
 * User: Vera
 * Date: 2016/7/11
 * Time: 上午 11:27
 */

?>
</body>
</html>
