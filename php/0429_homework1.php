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
            for($i=2;$i<10;$i++){
                for($j=1;$j<10;$j++){
                    echo "$i * $j = " . $i*$j . '<br>';
                }
                echo '<hr>';
            }
        ?>
    </body>
</html>
