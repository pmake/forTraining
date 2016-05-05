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
        //多種陣列宣告方式
        $array1[] = "Joy";
        $array1[] = "Mary";
        
        $array2[0] = "Ken";
        $array2[1] = "Chunli";
        
        $array3 = array("Tom","Ryu");
        
        function arrayReader($array){
            for($i=0;$i<count($array);$i++){
                echo $array[$i] . "<br>";
            }
        }
        
        arrayReader($array1);
        arrayReader($array2);
        arrayReader($array3);
        
        /*
        foreach功能為依序讀取陣列元素值存入自定義變數中，用法如下
        foreach(陣列名稱 as 自定義儲存元素值變數){
            需求程式碼;
        }
        */
        
        foreach($array1 as $eleValue){
            echo $eleValue . "<br>";
        }
        
        //二維陣列宣告方法
        //1、直接賦值
        $array2D1[0][0]="00";
        $array2D1[0][1]="01";
        $array2D1[1][0]="10";
        $array2D1[1][1]="11";
        
        //2、array建構子嵌套
        $row1 = array("00","01");
        $row2 = array("10","11");
        $container = array($row1,$row2);
        
        function arrayReader2D($array2D){
            for($i=0;$i<count($array2D);$i++){
                for($j=0;$j<count($array2D[$i]);$j++){
                    echo $array2D[$i][$j] . "<br>";
                }
            }
        }
        
        arrayReader2D($array2D1);
        arrayReader2D($container);
        
        ?>
    </body>
</html>
