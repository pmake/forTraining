<?php


if (isset($_POST["action"])) {
    //echo 'ok';
    require_once 'connMysql.php';
    $conn = dbConnector('localhost', 'root', '', 'test', 3306);
    $queryStringCheckUser = 'select m_username from memberdata where m_username = "' . $_POST['m_username'] . '"';
    $queryResultCheckUser = $conn->query($queryStringCheckUser);

    if (mysqli_num_rows($queryResultCheckUser)) {
        mysqli_free_result($queryResultCheckUser);
        mysqli_close($conn);
        header("Location: member_join.php?errMsg=1&username=" . $_POST['m_username']);
    } else {
        $queryStringInsert = "insert into memberdata (m_name,m_username,m_passwd,m_sex,m_birthday,m_email,m_url,m_phone,m_address,m_jointime) values (";
        $queryStringInsert .= "'" . $_POST['m_name'] . "',";
        $queryStringInsert .= "'" . $_POST['m_username'] . "',";
        $queryStringInsert .= "'" . md5($_POST['m_passwd']) . "',";
        $queryStringInsert .= "'" . $_POST['m_sex'] . "',";
        $queryStringInsert .= "'" . $_POST['m_birthday'] . "',";
        $queryStringInsert .= "'" . $_POST['m_email'] . "',";
        $queryStringInsert .= "'" . $_POST['m_url'] . "',";
        $queryStringInsert .= "'" . $_POST['m_phone'] . "',";
        $queryStringInsert .= "'" . $_POST['m_address'] . "',";
        $queryStringInsert .= "'" . date("Y/m/d/h/i/s") . "');";
        $conn = dbConnector('localhost', 'root', '', 'test', 3306);
        $conn->query($queryStringInsert);
        mysqli_free_result($queryResultCheckUser);
        mysqli_close($conn);
        header("Location: member_join.php?loginStatus=1");
    }

}

?>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>網站會員系統</title>
    <link href="style.css" rel="stylesheet" type="text/css">

</head>
<body>
<?php
if (isset($_GET['loginStatus'])) {
    ?>

    <script>
        alert("帳戶新增成功，請使用新帳戶登入。");
        window.location.href = "index.php";
    </script>

<?php } ?>

<table width="780" border="0" align="center" cellpadding="4" cellspacing="0">
    <tr>
        <td class="tdbline"><img src="images/mlogo.png" alt="會員系統" width="164" height="67"></td>
    </tr>
    <tr>
        <td class="tdbline">
            <table width="100%" border="0" cellspacing="0" cellpadding="10">
                <tr valign="top">
                    <td class="tdrline">
                        <form action="" method="POST" name="formJoin" id="formJoin" onSubmit="return checkForm();">
                            <p class="title">加入會員</p>
                            <?php
                            if (isset($_GET['errMsg'])) echo '<div class="errDiv">帳號' . $_GET["username"] . '已經有人使用！</div>';
                            ?>
                            <div class="dataDiv">
                                <hr size="1">
                                <p class="heading">帳號資料</p>
                                <p><strong>使用帳號</strong>：
                                    <input name="m_username" type="text" class="normalinput" id="m_username">
                                    <font color="#FF0000">*</font><br>
                                    <span class="smalltext">請填入5~12個字元以內的小寫英文字母、數字、以及_ 符號。</span>
                                </p>

                                <p>
                                    <strong>使用密碼</strong>：
                                    <input name="m_passwd" type="password" class="normalinput" id="m_passwd">
                                    <font color="#FF0000">*</font><br>
                                    <span class="smalltext">請填入5~10個字元以內的英文字母、數字、以及各種符號組合，</span>
                                </p>

                                <p><strong>確認密碼</strong>：
                                    <input name="m_passwdrecheck" type="password" class="normalinput"
                                           id="m_passwdrecheck">
                                    <font color="#FF0000">*</font> <br>
                                    <span class="smalltext">再輸入一次密碼</span>
                                </p>
                                <hr size="1">
                                <p class="heading">個人資料</p>
                                <p><strong>真實姓名</strong>：
                                    <input name="m_name" type="text" class="normalinput" id="m_name">
                                    <font color="#FF0000">*</font>
                                </p>

                                <p>
                                    <strong>性　　別</strong>：
                                    <input name="m_sex" type="radio" value="女" checked>女
                                    <input name="m_sex" type="radio" value="男">男
                                    <font color="#FF0000">*</font>
                                </p>

                                <p><strong>生　　日</strong>：
                                    <input name="m_birthday" type="text" class="normalinput" id="m_birthday">
                                    <font color="#FF0000">*</font> <br>
                                    <span class="smalltext">為西元格式(YYYY-MM-DD)。</span>
                                </p>

                                <p><strong>電子郵件</strong>：
                                    <input name="m_email" type="text" class="normalinput" id="m_email">
                                    <font color="#FF0000">*</font>
                                </p>

                                <p class="smalltext">請確定此電子郵件為可使用狀態，以方便未來系統使用，如補寄會員密碼信。</p>
                                <p><strong>個人網頁</strong>：
                                    <input name="m_url" type="text" class="normalinput" id="m_url">
                                    <br>
                                    <span class="smalltext">請以「http://」 為開頭。</span>
                                </p>

                                <p><strong>電　　話</strong>：
                                    <input name="m_phone" type="text" class="normalinput" id="m_phone">
                                </p>
                                <p><strong>住　　址</strong>：
                                    <input name="m_address" type="text" class="normalinput" id="m_address" size="40">
                                </p>

                                <p><font color="#FF0000">*</font> 表示為必填的欄位</p>
                            </div>

                            <hr size="1">
                            <p align="center">
                                <input name="action" type="hidden" id="action" value="join">
                                <input type="submit" name="Submit2" value="送出申請">
                                <input type="reset" name="Submit3" value="重設資料">
                                <input type="button" name="Submit" value="回上一頁">
                            </p>
                        </form>
                    </td>

                    <td width="200">
                        <div class="boxtl"></div>
                        <div class="boxtr"></div>
                        <div class="regbox">
                            <p class="heading"><strong>填寫資料注意事項：</strong></p>
                            <ol>
                                <li> 請提供您本人正確、最新及完整的資料。</li>
                                <li> 在欄位後方出現「*」符號表示為必填的欄位。</li>
                                <li>填寫時請您遵守各個欄位後方的補助說明。</li>
                                <li>關於您的會員註冊以及其他特定資料，本系統不會向任何人出售或出借你所填寫的個人資料。</li>
                                <li>在註冊成功後，除了「使用帳號」外您可以在會員專區內修改您所填寫的個人資料。</li>
                            </ol>
                        </div>
                        <div class="boxbl"></div>
                        <div class="boxbr"></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" background="" class="trademark">2014 eHappy Studio All Rights Reserved.</td>
    </tr>
</table>
<script>
function checkForm() {
    //將查詢結果儲存到變數中，避免多餘的查詢
    var inpM_username = document.formJoin.m_username;
    if (inpM_username.value == '') {
        alert('請輸入帳號!');
        inpM_username.focus();
        return false;
    } else {
        //將id字串長度計算結果儲存到變數中，避免重複計算，尤其是在for迴圈判斷結束點時
        var uid = inpM_username.value,
            uidLength = uid.length;
        if (uidLength < 5 || uidLength > 12) {
            alert('帳號長度需介於5~12個字元');
            inpM_username.focus();
            return false;
        } else {
            //字元的比較會自動轉為ascii碼比大小
            //以local變數做為for迴圈的累加運算變數，而不是global變數(未使用var或let宣告的變數就是global變數)
            for (var i = 0; i < uidLength; i++) {
                //將取得特定索引位置字元的結果儲存到變數，避免重複運算
                var uidIndexWord = uid.charAt(i);
                if (uidIndexWord >= 'A' && uidIndexWord <= 'Z') {
                    alert('帳號不可以含有大寫字元');
                    inpM_username.focus();
                    return false;
                }
                if (!((uidIndexWord >= 'a' && uidIndexWord <= 'z') || (uidIndexWord >= '0' && uidIndexWord <= '9') || uidIndexWord == '_')) {
                    alert('帳號只能數字，英文字母及「_」');
                    inpM_username.focus();
                    return false;
                }
                if (uidIndexWord == "_" && uid.charAt(i - 1) == "_") {
                    alert('「_」符號不可以相連');
                    inpM_username.focus();
                    return false;
                }
            }
        }
    }
    //將查詢結果儲存到變數中，避免多餘的查詢
    var inpM_passwd = document.formJoin.m_passwd,
        pw1 = inpM_passwd.value,
        inpM_passwdrecheck = document.formJoin.m_passwdrecheck,
        pw2 = inpM_passwdrecheck.value;
    if (!checkPassword(pw1, pw2)) {
        inpM_username.focus();
        return false;
    }
}
function checkPassword(pw1, pw2) {
    //以下順序代表著效率的優化

    //先簡單確認是否為空白
    if (pw1 == '') {
        alert('密碼不可以空白');
        return false;
    }
    //先儲存長度再執行for迴圈避免重複計算長度
    var pwLength = pw1.length;
    //既然已取得長度，就先比長度是否符合限制，因為速度快，且寫在for外面也是避免無意義的重複
    if (pwLength < 5 || pwLength > 12) {
        alert('密碼需介於5~12個字元');
        return false;
    }
    //再來執行for迴圈 word by word比對，只要一個不符合即return結束，也是很快
    for (var i = 0; i < pwLength; i++) {
        var pwIndexWord = pw1.charAt(i);
        if (pwIndexWord == ' ' || pwIndexWord == '\"') {
            alert('密碼不可以包含空格或雙引號');
            return false;
        }
    }
    //最後才是字串的比對，寫在for外面避免無意義的重複比對
    if (pw1 != pw2) {
        alert('密碼確認不一致，請修正');
        return false;
    }
    return true;
}
</script>
</body>
</html>
