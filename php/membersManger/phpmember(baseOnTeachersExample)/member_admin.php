<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>網站會員系統</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="780" border="0" align="center" cellpadding="4" cellspacing="0">
<tr><td class="tdbline"><img src="images/mlogo.png" alt="會員系統" width="164" height="67"></td></tr>
<tr>
<td class="tdbline">
    <table width="100%" border="0" cellspacing="0" cellpadding="10">
    <tr valign="top">
    <td class="tdrline">
        <p class="title">會員資料列表 </p>
        <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#F0F0F0">
        <tr>
        <th width="10%" bgcolor="#CCCCCC">&nbsp;</th>
        <th width="20%" bgcolor="#CCCCCC"><p>姓名</p></th>
        <th width="20%" bgcolor="#CCCCCC"><p>帳號</p></th>
        <th width="20%" bgcolor="#CCCCCC"><p>加入時間</p></th>
        <th width="20%" bgcolor="#CCCCCC"><p>上次登入</p></th>
        <th width="10%" bgcolor="#CCCCCC"><p>登入</p></th>
        </tr>
			
        <tr>
        <td width="10%" align="center" bgcolor="#FFFFFF"><p><a href="member_adminupdate.php?id=<?php echo $row_RecMember["m_id"];?>">修改</a><br>
        <a href="?action=delete&id=1" onClick="">刪除</a></p></td>
        <td width="20%" align="center" bgcolor="#FFFFFF"><p>NAME</p></td>
        <td width="20%" align="center" bgcolor="#FFFFFF"><p>USERNAME</p></td>
        <td width="20%" align="center" bgcolor="#FFFFFF"><p>JOINTTIME</p></td>
        <td width="20%" align="center" bgcolor="#FFFFFF"><p>LOGINTIME</p></td>
        <td width="10%" align="center" bgcolor="#FFFFFF"><p>LOGIN</p></td>
        </tr>	
        </table>          
         
        <hr size="1">
        <table width="98%" border="0" align="center" cellpadding="4" cellspacing="0">
        <tr>
        <td valign="middle"><p>資料筆數：XX</p></td>
        <td align="right">
        <p>
        <a href="">第一頁</a> | <a href="">上一頁</a> |
        <a href="">下一頁</a> | <a href="">最末頁</a>
        </p>
        </td>
        </tr>
        </table>          
        <p>&nbsp;</p>
    </td>

    <td width="200">
        <div class="boxtl"></div>
        <div class="boxtr"></div>
        <div class="regbox">
        <p class="heading"><strong>會員系統</strong></p> 
        <p><strong>XXXX</strong>您好。<br>
        本次登入的時間為：<br>
        XXXX</p>
        <p align="center"><a href="">修改資料</a> | <a href="?logout=true">登出系統</a></p>
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
