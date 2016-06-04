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
        $host = 'localhost';
        $user = 'root';
        $password = '1qaz@wsx';
        $database = 'class';
        $port = '3306';

        //建立與資料庫連線
        $conn = new mysqli($host, $user, $password, $database, $port);

        $errMsg = $conn->connect_error;
        if ($errMsg)
            echo 'Connecting failed with: ' . $errMsg;
        else
            echo 'Connecting successed';
        
        echo '<br>';
        
        //切換資料庫
        if ($conn->select_db('product'))
            echo 'DB change successed.';
        else
            echo 'DB change failed.';

        //關閉與資料庫連線
        $conn->close();
        ?>
    </body>
</html>
