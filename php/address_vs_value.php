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
                echo '參數傳遞值inside: ' . $para;
            }
            func_pass_value($x1);
            echo '<br>';
            echo '參數傳遞值outside: ' . $x1;
            //參數傳遞記憶體位置的函數，方法是在定義參數時在'$'之前加上一個'&'符號
            function func_pass_address(&$para){
                $para*=2;
                echo '參數傳遞記憶體位置inside: ' . $para;
            }
            echo '<br>';
            func_pass_address($x1);//此時傳入的是$x1變數的記憶體位置，這會讓函數裡的區域變數指定到同一個位置，對該變數指定值會讓$x1的值也改變
            echo '<br>';
            echo '參數傳遞記憶體位置outside: ' . $x1;
        ?>
    </body>
</html>
