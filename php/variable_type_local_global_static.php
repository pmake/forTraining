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
        $msg = "這是全域變數<br>";
        echo $msg;

        function test1() {
            $msg = '這是區域變數';
            //與JS不同，php變數宣告方式之一是定義名稱+給予初始值，例如$msg = 'abc'，此方法在同一個scope內只有在名稱首次出現時才認定為scope定義;所以外面雖然已定義全域變數$msg，裡面再次給予值時等同重定義，此時它就已不是全域變數
            //另一種變數宣告方式是指定變數屬性關鍵字再定義名稱，此種方式不能給予初始值，例如static $msg;
            echo $msg . '<br>';
        }

        test1();
        echo $msg;

        function test2() {
            global $msg;
            $msg = "這還是區域變數?";
            //與JS不同，JS在函數內只要不加var關鍵字即代表宣告變數為全域，php則是需要加上global屬性關鍵字
            echo $msg . '<br>';
        }
        test2();
        echo $msg;
        //屬性關鍵字宣告初始值驗證
        function test3 (){
            global $verify;
            echo $verify;
            //初始值驗證
            if ($verify===0) echo "type is number";
            if ($verify==="0") echo "type is string";
            if ($verify==0) echo "type is strange";
            echo "<br>";
            if (($verify+2) == 2) echo "but can do math";
            echo "<br>";
        }
        test3();
        //static 屬性關鍵字用途是讓區域變數在函數執行完後不會消滅
        function test4 (){
            static $persist;
            $persist+=2;
            echo $persist . "<br>";
        }
        test4();
        test4();
        ?>
    </body>
</html>
