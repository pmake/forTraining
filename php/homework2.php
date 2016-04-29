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
        
        $score =79;
        if($score>=80) print "學生成績80分以上";
        elseif($score>=70) print "學生成績70分以上，但低於80";
        elseif($score>=60) print "學生成績60分以上，但低於70";
        else print "學生成績低於60，不及格";
        ?>
    </body>
</html>
