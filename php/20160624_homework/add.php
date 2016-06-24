<?php
require_once 'functions.php';
$conn = dbConnector('localhost', 'root', '1qaz@wsx', 'class', '3306');

if(isset($_GET['username'])){
    $userNmae = $_GET['username'];
    $passWord = $_GET['password'];
    $queryString = "insert into table1 (userName,passWord) values ('$userNmae', '$passWord');";
    echo $queryString;
    $conn->query($queryString);
}
mysqli_close($conn);
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
    </head>
    <body>
        <a href="add.php?username=bill&password=78">add</a>
    </body>
</html>