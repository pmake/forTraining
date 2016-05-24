<?php
session_start();
if(!isset($_SESSION['usrName'])) header('Location:01.php');

require "03.inc.php";

$level = 1;
$iserr = 0;
if (isset($_COOKIE['progress']))
    $level = $_COOKIE['progress'];
//是否有按送出
if (isset($_POST['answer'])) {
    if ($_POST['answer'] == $Q[$level]['answer']) {
        $level+=1;
        setcookie('progress', $level, time() + 30 * 24 * 3600);
        $iserr = 0;
    } else {
        $iserr = 1;
    }
}
if (isset($_GET['level'])){
    if($_GET['level']==1){
        setcookie('progress','', -10);
        $level=1;
    }
}
?>

<!DOCTYPE html>
<html>
    <head><meta charset="UTF-8"><title>機智問答區</title>
        <style>
            div {text-align:center;border:2px solid navy;margin:3px}
            #frame {width:360px}
        </style></head>
    <body>
        <div id="frame">
            <?php if ($level < 6) { ?>
                <form action="03.php" method="post">
                    <div>親愛的 <?php echo $_SESSION['usrName']; ?></div>
                    <div><?php echo $Q[$level][$iserr]; ?></div>
                    <div>第 <?php echo $level; ?> 關</div>
                    <div><b><?php echo $Q[$level]['question']; ?></b></div>
                    <div><input name="answer" type="text"></div>
                    <div><input type="submit" value="送出答案">
                        <input type="reset" value="改寫答案"></div>
                </form> 
            <?php } else { ?>
                <div><?php echo $Q[$level]; ?></div>
            <?php } ?>
            <div><a href="03.php?level=1">重頭開始</a></div>
            <div><a href="02.php?level=<?php echo $level; ?>">回會員專區</a></div>
             <a href="01.php?logout=1">登出</a>
        </div></body>
</html>