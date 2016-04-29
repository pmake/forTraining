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
        $hour=22;
        $str="";
        if($hour>=12) {
            $str="PM";
            $hour-=12;
        }
        else {
            $str="AM";
        }
        print "<br>目前時間為:".$hour.$str;
        ?>
    </body>
</html>
