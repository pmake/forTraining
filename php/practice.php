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

            $age=18;
            $sex="female";
            $type = ($age>17)?(($sex==="male")?"man":"woman"):"kid";
            echo $type;
        
        ?>
    </body>
</html>
