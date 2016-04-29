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
            //以'='號設定函數參數預設值
            function test($length,$width=2,$height=3){
                return $length * $width * $height;
            }
            echo '給寬高' . test(1,1,1);
            echo '<br>';
            echo '未給寬高套預設值' . test(1);
        ?>
    </body>
</html>
