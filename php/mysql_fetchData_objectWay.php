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
        $database = 'product';
        $port = '3306';

        //建立與資料庫連線
        $conn = new mysqli($host, $user, $password, $database, $port);

        $errMsg = $conn->connect_error;
        if ($errMsg)
            echo 'Connecting failed with: ' . $errMsg;
        else
            echo 'Connecting success';

        echo '<br>';

        //取得查詢結果
        $queryString = 'select DATABASE();';
        $result = $conn->query($queryString);
        if ($result) {
            $row = mysqli_fetch_row($result);
            echo $row[0];
            
            //清除查詢結果物件內容，釋放記憶體
            mysqli_free_result($result);
        } else
            echo 'query failed.';

        //關閉與資料庫連線
        $conn->close();
        ?>
    </body>
</html>
