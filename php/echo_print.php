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
        $name1 = "Chris";
        $name2 = "Rio";
        //echo用法
        echo $name1;
        echo "<br>";
        echo ($name1);
        echo "<br>";
        echo $name1,$name2;
        echo "<br>";
        echo $name1.$name2;
        echo $name1.$name2;
        echo "<br>";
        //定義字串可用雙引號""或單引號''，差別在於用雙引號會將裡面的變數名稱視為變數，用單引號則將變數名稱視為一般字串
        echo "$name1$name2";
        echo "<br>";
        echo $name1." ".$name2;
        echo "<br>";
        echo "$name1 $name2";
        //echo未完...彈性太大了
        //print函數和echo的差別只在於不適用以","分隔輸出內容格式
        print "<hr>";
        print $name1;
        print "<br>";
        print ($name1);
        print "<br>";
        //print $name1,$name2;不適用
        print "<br>";
        print $name1.$name2;
        print $name1.$name2;
        print "<br>";
        print "$name1$name2";
        print "<br>";
        print $name1." ".$name2;
        print "<br>";
        print "$name1 $name2";
        ?>
    </body>
</html>
