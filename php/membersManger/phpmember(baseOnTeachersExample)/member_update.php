<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        <form action="" method="POST" name="formJoin" id="formJoin" onSubmit="return checkForm();">
            <p class="title">修改資料</p>
            <div class="dataDiv">
            <hr size="1">
            <p class="heading">帳號資料</p>
            <p><strong>使用帳號：</strong>
            XXXX</p>
            <p><strong>使用密碼：</strong>
            <input name="m_passwd" type="password" class="normalinput" id="m_passwd">
            <br>
            </p>
            <p>
            <strong>確認密碼：</strong>
            <input name="m_passwdrecheck" type="password" class="normalinput" id="m_passwdrecheck">
            <br>
            <span class="smalltext">若不修改密碼，請不要填寫。若要修改，請輸入密碼</span>
            <span class="smalltext">二次。<br>
             若修改密碼，系統會自動登出，請用新密碼登入。
            </span>
            </p>
            
            <hr size="1">
            <p class="heading">個人資料</p>
            <p>
                <strong>真實姓名：</strong>
                <input name="m_name" type="text" class="normalinput" id="m_name" value="XXXX">
                <font color="#FF0000">*</font> 
            </p>
            <p>
                <strong>性　　別：</strong>
                <input name="m_sex" type="radio" value="女">
                女
                <input name="m_sex" type="radio" value="男">
                男 
                <font color="#FF0000">*</font>
            </p>
            
            <p>
                <strong>生　　日</strong>：
                <input name="m_birthday" type="text" class="normalinput" id="m_birthday" value="">
                <font color="#FF0000">*</font> <br>
                <span class="smalltext">為西元格式(YYYY-MM-DD)。 </span>
            </p>
            
            <p>
                <strong>電子郵件</strong>：
                <input name="m_email" type="text" class="normalinput" id="m_email" value="">
                <font color="#FF0000">*</font> 
            </p>
            
            <p class="smalltext">請確定此電子郵件為可使用狀態，以方便未來系統使用，如補寄會員密碼信。</p>
            <p>
                <strong>個人網頁</strong>：
                <input name="m_url" type="text" class="normalinput" id="m_url" value="">
                <br>
                <span class="smalltext">請以「http://」 為開頭。</span> 
            </p>
            <p>
                <strong>電　　話</strong>：
                <input name="m_phone" type="text" class="normalinput" id="m_phone" value="">
            </p>
            <p>
                <strong>住　　址</strong>：
                <input name="m_address" type="text" class="normalinput" id="m_address" value="" size="40">
            </p>
            <p> <font color="#FF0000">*</font> 表示為必填的欄位</p>
        </div>
        <hr size="1" />
        <p align="center">
        <input name="m_id" type="hidden" id="m_id" value="">
        <input name="action" type="hidden" id="action" value="update">
        <input type="submit" name="Submit2" value="修改資料">
        <input type="reset" name="Submit3" value="重設資料">
        <input type="button" name="Submit" value="回上一頁" onClick="window.history.back();">
        </p>
        
     </form>
    </td>
        
    <td width="200">
        <div class="boxtl"></div>
        <div class="boxtr"></div>
        <div class="regbox">
            <p class="heading"><strong>會員系統</strong></p>
            <p><strong>XXX</strong> 您好。</p>
            <p>您總共登入了 XXX 次。<br>
            本次登入的時間為：<br>
            XXX</p>
            <p align="center">
                <a href="">會員中心</a> | <a href="">登出系統</a>
            </p>
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
</body>
</html>
