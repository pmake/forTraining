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
            $x1=3;
            //參數傳遞值的函數
            function func_pass_value($para){
                $para*=2;
                echo 'inside: ' . $para . '<br>';
            }
            func_pass_value($x1);
            echo 'outside: ' . $x1;
            
            //參數傳遞記憶體位置的函數
            function func_pass_address($para){
                $para*=2;
                echo 'inside: ' . $para . '<br>';
            }
            func_pass_address($x1);
            echo 'outside: ' . $x1;
        ?>
    </body>
</html>
