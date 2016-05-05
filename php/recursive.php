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
        //以遞迴方式計算給定階層數
        function calc($step){
            if ($step == 0) return 1;
            else
            {
                return $step*=calc($step-1);//每次呼叫產生的$step變數都是不同的變數，只存在於函數當次呼叫的scope裡，互不影響
            }
        }
        echo calc(5);
        ?>
    </body>
</html>
