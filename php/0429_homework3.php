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
            $i=2;
            do{
                $j=1;
                do{
                    echo "$i * $j = " . $i*$j . '<br>';
                    $j++;
                }while($j<10);
                echo '<hr>';
                $i++;
            } while($i<10);
        ?>
    </body>
</html>
