<?php
session_start();

if (!isset($_SESSION['loginMember']) || $_SESSION['loginMember'] == '' ) header("Location: index.php");
if($_SESSION['memberLevel'] == 'member') header("Location:member_center.php");

if (isset($_GET['logout'])) {
    unset($_SESSION['loginMember']);
    unset($_SESSION['memberLevel']);
    header("Location: index.php");
}

//建立資料庫連線
require_once "connMysql.php";
$conn = dbConnector('localhost', 'root', '', 'test', 3306);

//post資料更新
$redirectURL = 'member_admin.php';
if(isset($_POST['m_passwd'])){
    $qsUpdate = 'update memberdata set ';
    if(($_POST['m_passwd']!='') && ($_POST['m_passwd'] == $_POST['m_passwdrecheck'])){
        $qsUpdate .= 'm_passwd = "' . md5($_POST['m_passwd']) . '", ';
        if($_POST['isAdmin'] == true ){
            unset($_SESSION['loginMember']);
            unset($_SESSION['memberLevel']);
            $redirectURL = 'index.php';
        }
    }
    $qsUpdate .= 'm_name = "' . $_POST['m_name'] . '", ';
    $qsUpdate .= 'm_sex = "' . $_POST['m_sex'] . '", ';
    $qsUpdate .= 'm_birthday = "' . $_POST['m_birthday'] . '", ';
    $qsUpdate .= 'm_email = "' . $_POST['m_email'] . '", ';
    $qsUpdate .= 'm_url = "' . $_POST['m_url'] . '", ';
    $qsUpdate .= 'm_phone = "' . $_POST['m_phone'] . '", ';
    $qsUpdate .= 'm_address = "' . $_POST['m_address'] . '" ';
    $qsUpdate .= 'where m_id = "' . $_POST['m_id'] . '";';

    $conn->query($qsUpdate);
    //關閉資料庫連線
    mysqli_close($conn);
    header("Location: $redirectURL");
}

//查詢頁面一般會員部份顯示需要的資料
if(isset($_GET['id'])) $qsMemberData = 'select * from memberdata where m_id ="' . $_GET['id'] . '";';
else $qsMemberData = 'select * from memberdata where m_id ="' . $_GET['adminid'] . '";';;
$result = $conn->query($qsMemberData);
//將原始查詢結果轉為以欄位名稱為索引的關聯式陣列並儲存起來
$resultAssocMember = mysqli_fetch_assoc($result);
//釋放原始查詢結果
mysqli_free_result($result);

//查詢頁面"會員系統"部份顯示需要的資料
$qsAdminData = 'select * from memberdata where m_id ="' . $_GET['adminid'] . '";';
$result = $conn->query($qsAdminData);
//將原始查詢結果轉為以欄位名稱為索引的關聯式陣列並儲存起來
$resultAssocAdmin = mysqli_fetch_assoc($result);
mysqli_free_result($result);



//關閉資料庫連線
mysqli_close($conn);
?>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>網站會員系統</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <script>

            function checkForm() {
                var formJoin = document.formJoin,
                    inpPW = formJoin.m_passwd,
                    inpCPW = formJoin.m_passwdrecheck,
                    inpValuePW = inpPW.value,
                    inpValueCPW = inpCPW.value,
                    inpName = formJoin.m_name,
                    inpBirthday = formJoin.m_birthday,
                    inpEmail = formJoin.m_email;

                if(inpValuePW != ''){
                    if(!checkPassword(inpValuePW, inpValueCPW)) {
                        inpPW.value = '';
                        inpCPW.value = '';
                        inpPW.focus();
                        return false;
                    }
                }

                if(inpName.value == ''){
                    alert('請填寫姓名。');
                    inpName.focus();
                    return false;
                }

                if(inpBirthday.value == ''){
                    alert('請填寫生日。');
                    inpBirthday.focus();
                    return false;
                }

                if(inpEmail.value == ''){
                    alert('請填寫電子郵件。');
                    inpEmail.focus();
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
                                <form action="" method="POST" name="formJoin" id="formJoin" onSubmit="return checkForm();">
                                    <div class="dataDiv">
                                        <hr size="1">
                                        <p class="heading">帳號資料</p>
                                        <p><strong>使用帳號：</strong>
                                            <?php echo $resultAssocMember['m_username'];?></p>
                                        <p><strong>使用密碼</strong> ：
                                            <input name="m_passwd" type="password" class="normalinput" id="m_passwd"><br>
                                        </p>
                                        <p><strong>確認密碼：</strong> 
                                            <input name="m_passwdrecheck" type="password" class="normalinput" id="m_passwdrecheck"><br>
                                            <span class="smalltext">若不修改密碼，請不要填寫。若要修改，請輸入密碼</span><span class="smalltext">二次。<br></span></p>
                                        <hr size="1">
                                        <p class="heading">個人資料</p>
                                        <p><strong>真實姓名</strong>：
                                            <input name="m_name" type="text" class="normalinput" id="m_name" value="<?php echo $resultAssocMember['m_name'];?>">
                                            <font color="#FF0000">*</font> 
                                        </p>
                                        <p><strong>性　　別：</strong>
                                            <input name="m_sex" type="radio" value="女" <?php if($resultAssocMember['m_sex']=='女') echo 'checked';?>>女
                                            <input name="m_sex" type="radio" value="男" <?php if($resultAssocMember['m_sex']=='男') echo 'checked';?>>男 
                                            <font color="#FF0000">*</font>
                                        </p>
                                        <p><strong>生　　日：</strong>
                                            <input name="m_birthday" type="text" class="normalinput" id="m_birthday" value="<?php echo $resultAssocMember['m_birthday'];?>">
                                            <font color="#FF0000">*</font><br>
                                            <span class="smalltext">為西元格式(YYYY-MM-DD)。 </span>
                                        </p>
                                        <p><strong>電子郵件：</strong>
                                            <input name="m_email" type="text" class="normalinput" id="m_email" value="<?php echo $resultAssocMember['m_email'];?>">
                                            <font color="#FF0000">*</font> </p>
                                        <p class="smalltext">請確定此電子郵件為可使用狀態，以方便未來系統使用，如補寄會員密碼信。</p>
                                        <p><strong>個人網頁</strong>：
                                            <input name="m_url" type="text" class="normalinput" id="m_url" value="<?php echo $resultAssocMember['m_url'];?>"><br>
                                            <span class="smalltext">請以「http://」 為開頭。</span> </p>
                                        <p><strong>電　　話</strong>：
                                            <input name="m_phone" type="text" class="normalinput" id="m_phone" value="<?php echo $resultAssocMember['m_phone'];?>">
                                        </p>
                                        <p><strong>住　　址</strong>：
                                            <input name="m_address" type="text" class="normalinput" id="m_address" value="<?php echo $resultAssocMember['m_address'];?>" size="40">
                                        </p>
                                        <p><font color="#FF0000">*</font> 表示為必填的欄位</p>
                                    </div>
                                    <hr size="1">
                                    <p align="center">
                                        <input name="m_id" type="hidden" id="m_id" value="<?php echo $resultAssocMember['m_id'];?>">
                                        <input name="action" type="hidden" id="action" value="update">
                                        <input type="submit" name="Submit2" value="修改資料">
                                        <input type="reset" name="Submit3" value="重設資料">
                                        <input type="button" name="Submit" value="回上一頁" onclick="window.history.back();">
                                        <input type="hidden" name="isAdmin" value="<?php if($resultAssocAdmin['m_id'] == $resultAssocMember['m_id']) echo true;?>">
                                    </p>
                                </form>
                            </td>
                            <td width="200">
                                <div class="boxtl"></div>
                                <div class="boxtr"></div>
                                <div class="regbox">
                                    <p class="heading"><strong>會員系統</strong></p>      
                                    <p><strong><?php echo $resultAssocAdmin['m_username'];?></strong> 您好。</p>
                                    <p>本次登入的時間為：<br>
                                        <?php echo $resultAssocAdmin['m_logintime'];?>
                                    </p>
                                    <p align="center"><a href="member_admin.php">會員管理</a> | <a href="?logout=true">登出系統</a></p>
                                </div>
                                <div class="boxbl"></div>
                                <div class="boxbr"></div></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" background="" class="trademark">© 2014 eHappy Studio All Rights Reserved.</td>
            </tr>
        </table>
    </body>
</html>