<?php
//session利用cookie來記錄server分配的SessionID
//預設是當瀏覽器關閉，就清除本地端session紀錄
//cookie在未設定有效時間的情況下，預設在瀏覽器關閉時消失，但瀏覽器的cookie設定可能造成不同影響
//例如google chrome 的cookie設定若設為"允許網站儲存本機資料"則cookie不會在瀏覽器關閉時消失
//這會導致瀏覽器關閉後，sessionid仍記錄在本地端，在server未重啟情況下下次再開瀏覽器，仍會有紀錄
//將瀏覽器設定改為"將本機資料保留到您關閉瀏覽器為止即可符合預設值

//啟用session對話
session_start();
//unset($_SESSION['username']);
if (!isset($_SESSION['username'])) {
    if (isset($_POST['username']) && isset($_POST['passwd'])) {
        if ($_POST['username'] == 'admin' && $_POST['passwd'] == '1234') {
            $_SESSION['username'] = $_POST['username'];
        }
    }
}
//判斷是否登出
if (isset($_GET['logout']) && $_GET['logout']==true){
    unset($_SESSION['username']);
    header('Location:session_user_verify.php');
}
?>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=big5" />
        <title>網站會員系統</title>
    </head>
    <body>
        <!--可以PHP判斷條件，再決定是否展示HTML內容-->
        <?php if (!isset($_SESSION['username'])) { ?>
            <form id="form1" name="form1" method="post" action="">
                <table width="300" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
                    <tr>
                        <td colspan="2" align="center" bgcolor="#CCCCCC"><font color="#FFFFFF">會員系統</font></td>
                    </tr>
                    <tr>
                        <td width="80" align="center" valign="baseline">帳號</td>
                        <td valign="baseline"><input type="text" name="username" id="username" /></td>
                    </tr>
                    <tr>
                        <td width="80" align="center" valign="baseline">密碼</td>
                        <td valign="baseline"><input type="password" name="passwd" id="passwd" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" bgcolor="#CCCCCC"><input type="submit" name="button" id="button" value="登入" />
                            <input type="reset" name="button2" id="button2" value="重設" /></td>
                    </tr>
                </table>
            </form>
        <?php } else { ?>

            <table width="300" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
                <tr>
                    <td align="center" bgcolor="#CCCCCC"><font color="#FFFFFF">會員系統</font></td>
                </tr>
                <tr>
                    <td align="center" valign="baseline"><?php echo $_POST['username'] . ''; ?>您好，登入成功！</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#CCCCCC"><a href="session_user_verify.php?logout=true">登出系統</a></td>
                </tr>
            </table>

        <?php } ?>

    </body>
</html>