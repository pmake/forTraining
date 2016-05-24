<?php
session_start();
//登出
if(isset($_GET['logout'])){session_destroy();}

$valid = array('usrName' => 'Ryu', 'usrPass' => 'horyuken');


if (isset($_SESSION['usrName'])) {
    header("Location:02.php");
} else {
    
    if (isset($_POST['usrName']) && isset($_POST['usrPass'])) {
        if ($_POST['usrName'] == $valid['usrName'] && $_POST['usrPass'] == $valid['usrPass']) {
            $_SESSION['usrName'] = $valid['usrName'];
            $_SESSION['setCounter'] = True;
            header("Location:02.php");
            exit();
        } else header("Location:01.php");
    }
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>使用者登入</title>
    </head>
    <body>
        <p>歡迎來到機智問答</p>
        <hr>
        <form action="" method="post">
            帳號：<input type="text" name="usrName" 
                      value="Ryu" required><br>
            密碼：<input type="password" name="usrPass" 
                      value="horyuken" required>
            <input type="submit" value="送出">
        </form>
    </body>
</html>