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
        $season =date('n');
        if ($season<4) echo "現在是".$season."月，是春季";
        elseif ($season<7) echo "現在是".$season."月，是夏季";
        elseif ($season<10) echo "現在是".$season."月，是秋季";
        else echo "現在是".$season."月，是冬季";
        ?>
    </body>
</html>
