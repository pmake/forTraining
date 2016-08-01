<?php

function dbConnector($host, $user, $password, $database, $port) {
    //建立與資料庫連線
    $conn = new mysqli($host, $user, $password, $database, $port);

    $errMsg = $conn->connect_error;
    if ($errMsg)
        echo 'Connecting failed with: ' . $errMsg;

    //設定queryString編碼方式讓中文內容正常執行
    mysqli_query($conn, 'SET NAMES utf8');
    return $conn;
}