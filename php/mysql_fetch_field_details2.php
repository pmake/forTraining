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

        //設定queryString編碼方式讓中文內容正常執行
        mysqli_query($conn, 'SET NAMES utf8');
        //取得查詢結果
        $queryString = "select * from price where category = '主機板';";
        $result = $conn->query($queryString);
        if ($result) {
            //呈現欄位資訊
            echo '<table><tr><td>欄位名稱</td><td>最大內容長度</td><tr>';
            //每呼叫一次 'mysqli_fetch_field($result)'就往下取得一筆欄資料，直到取完則傳回false
            $meta = mysqli_fetch_field($result);
            while ($meta) {
                echo '<tr><td>' . $meta->name . '</td><td>' . $meta->max_length . '</td></tr>';
                $meta = mysqli_fetch_field($result);
            }
            echo '</table>';
            //清除查詢結果物件內容，釋放記憶體
            mysqli_free_result($result);
        } else
            echo 'query failed.';

        //關閉與資料庫連線
        $conn->close();
        ?>
    </body>
</html>
