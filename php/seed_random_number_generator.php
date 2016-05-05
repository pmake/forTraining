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
        srand((double)microtime() * 100000);//給定亂數種子(種子必須>1),避免亂數有規則性
        $test = rand(1,6);
        echo $test;//依據種子實際產生亂數;
        ?>
    </body>
</html>
