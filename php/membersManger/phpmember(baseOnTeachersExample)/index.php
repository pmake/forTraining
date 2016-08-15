<?php
require_once "connMysql.php";
session_start();

if (isset($_SESSION['loginMember'])) {
    if ($_SESSION['memberLevel'] == "member") header("Location: member_center.php");
    else header("Location: member_admin.php");
}

if (isset($_POST['username'])) {
    $conn = dbConnector('localhost', 'root', '', 'test', 3306);

    $qsUserCheck = 'select * from memberdata where m_username ="' . $_POST["username"] . '";';
    $result = $conn->query($qsUserCheck);
    $resultAssoc = mysqli_fetch_assoc($result);
    $userName = $resultAssoc['m_username'];
    $userPassword = $resultAssoc['m_passwd'];
    $userLevel = $resultAssoc['m_level'];


    if (md5($_POST['passwd']) == $userPassword) {
        $qsUpdate = 'update memberdata set m_login = m_login + 1, m_logintime = "' . date("Y/m/d/h/i/s") . '" where m_username = "' . $_POST['username'] . '";';
        $conn->query($qsUpdate);

        $_SESSION['loginMember'] = $userName;
        $_SESSION['memberLevel'] = $userLevel;

        //有check才會post過來
        if (isset($_POST['rememberme'])) {
            setcookie('remUser', $userName, time() + 365 * 24 * 60);
            setcookie('remPWD', $_POST['passwd'], time() + 365 * 24 * 60);
        } else {
            if (isset($_COOKIE['remUser'])) {
                setcookie('remUser', $userName, time() - 100);
                setcookie('remPWD', $_POST['passwd'], time() - 100);
            }
        }


        if ($_SESSION['memberLevel'] == "member") header("Location: member_center.php");
        else header("Location: member_admin.php");
    } else {
        header("Location: index.php?errMsg=1");
    }

    mysqli_free_result($result);
    mysqli_close($conn);
}


?>


<!DOCTYPE html><!-- 宣告文件類型 -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>網站會員系統</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="780" border="0" align="center" cellpadding="4" cellspacing="0">
    <tr>
        <td class="tdbline"><img src="images/mlogo.png" alt="會員系統" width="164" height="67"></td>
    </tr>

    <tr>
        <td class="tdbline">
            <table width="100%" border="0" cellspacing="0" cellpadding="10">
                <tr valign="top">
                    <td class="tdrline">
                        <p class="title">歡迎光臨網站會員系統</p>
                        <p>感謝各位來到會員系統， 所有的會員功能都必須經由登入後才能使用，請您在右方視窗中執行登入動作。</p>
                        <p class="heading"> 本會員系統擁有以下的功能：</p>
                        <ol>
                            <li>免費加入會員 。</li>
                            <li>每個會員可修改本身資料。</li>
                            <li>若是遺忘密碼，會員可由系統發出電子信函通知。</li>
                            <li>管理者可以修改、刪除會員的資料。</li>
                        </ol>
                        <p class="heading">請各位會員遵守以下規則： </p>
                        <ol>
                            <li> 遵守政府的各項有關法律法規。</li>
                            <li> 不得在發佈任何色情非法， 以及危害國家安全的言論。</li>
                            <li>嚴禁連結有關政治， 色情， 宗教， 迷信等違法訊息。</li>
                            <li> 承擔一切因您的行為而直接或間接導致的民事或刑事法律責任。</li>
                            <li> 互相尊重， 遵守互聯網絡道德；嚴禁互相惡意攻擊， 漫罵。</li>
                            <li> 管理員擁有一切管理權力。</li>
                        </ol>
                    </td>

                    <td width="200">
                        <div class="boxtl"></div>
                        <div class="boxtr"></div>
                        <div class="regbox">
                            <?php if (isset($_GET['errMsg'])) { ?>
                                <div class="errDiv"> 登入帳號或密碼錯誤！</div>
                            <?php } ?>
                            <p class="heading">登入會員系統</p>
                            <form name="form1" method="post" action="">
                                <?php
                                if (isset($_COOKIE['remUser'])) {
                                    $userNameValue = $_COOKIE['remUser'];
                                    $userPasswordValue = $_COOKIE['remPWD'];
                                } else {
                                    $userNameValue = '';
                                    $userPasswordValue = '';
                                }
                                ?>
                                <p>帳號：
                                    <br>

                                    <input name="username" type="text" autocomplete="off" class="logintextbox" id="username"
                                           value="<?php echo $userNameValue ?>">
                                </p>
                                <p>密碼：<br>
                                    <input name="passwd" type="password" class="logintextbox" id="passwd"
                                           value="<?php echo $userPasswordValue ?>">
                                </p>

                                <p>
                                    <input name="rememberme" type="checkbox" id="rememberme" value="true" checked>
                                    記住我的帳號密碼。
                                </p>

                                <p align="center">
                                    <input type="submit" name="button" id="button" value="登入系統">
                                </p>
                            </form>
                            <p align="center"><a href="">忘記密碼，補寄密碼信。</a></p>
                            <hr size="1">
                            <p class="heading">還沒有會員帳號?</p>
                            <p>註冊帳號免費又容易</p>
                            <p align="right"><a href="member_join.php">馬上申請會員</a></p>

                        </div>
                        <div class="boxbl"></div>
                        <div class="boxbr"></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" background="" class="trademark">
            2014 eHappy Studio All Rights Reserved.
        </td>
    </tr>
</table>
</body>
</html>