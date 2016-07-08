<?php
session_start();
//判斷是否從首頁進入，否則導向至首頁
if(!isset($_SESSION['usrName'])) header('Location:01.php');

if (isset($_GET['level'])){
    if($_GET['level']==6){
        setcookie('progress', '', -10);
        //清空隨機排序
        for($i=0;$i<5;$i++){
            setcookie('q' . ($i+1),'',-10);
        }
    }
}
//for($i=0;$i<5;$i++){
//    setcookie('q' . ($i+1),'',-10);
//}
$counter = 1;

if (isset($_COOKIE['times'])) {
    $counter = $_COOKIE['times'];
    if (isset($_SESSION['setCounter']) && $_SESSION['setCounter'] == True) {
        $counter+=1;
        setcookie('times', $counter, time() + 30 * 24 * 3600);
    }
} elseif (!isset($_COOKIE['times']))
    setcookie('times', $counter, time() + 30 * 24 * 3600);

if (isset($_SESSION['setCounter']))
    $_SESSION['setCounter'] = False;
?>

<!DOCTYPE html>
<html>
    <head><meta charset="UTF-8"><title>會員專區</title></head>
    <body>
        <p>歡迎 <?php echo $_SESSION['usrName']; ?>, 
            這是您第 <?php echo $counter; ?> 次登入  <br>
            以下是本站提供的會員服務  <hr>
        <a href="03.php">機智問答</a>
        <br><br>
        <div><a href="01.php?logout=1">登出</a></div>
    </body>
</html>
