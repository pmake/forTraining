<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.

-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        //關聯式陣列指定索引鍵名稱和值格式:'keyname' => value
        //未指定索引鍵名稱的值預設會從0開始編索引，如同一般陣列
        $aArray = array('color'=>'black','name'=>'Ryu','height'=>185,100);
        if(!isset($aArray['skill']))
        {
            $aArray['skill'] = 'php';
            echo '新增成功 <br>';
        }
        unset($aArray['color']);
        $aArray['color'] = 'blue';
        //foreach列示順序是以新增順序為之
        //foreach列示關聯式陣列格式如下，指定索引鍵名稱和其值兩個變數依序列示
        foreach($aArray as $key=>$value)
        {
            echo "$key => $value <br>";//雙引號內的變數名稱識別為變數而非文字
        }
        echo '<hr>';
        //列示陣列索引鍵名稱以及其值函數
        print_r($aArray);
        ?>
    </body>
</html>
