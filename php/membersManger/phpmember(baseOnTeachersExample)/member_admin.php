<?php
session_start();
if (! isset($_SESSION['loginMember']) || $_SESSION['loginMember'] == '' ) header("Location: index.php");
if($_SESSION['memberLevel'] == 'member') header("Location:member_center.php");

if (isset($_GET['logout'])) {
    unset($_SESSION['loginMember']);
    unset($_SESSION['memberLevel']);
    header("Location: index.php");
}

require_once "connMysql.php";
$conn = dbConnector('localhost', 'root', '', 'test', 3306);

$qsFetchAdminData = 'select * from memberdata where m_username = "' . $_SESSION['loginMember'] . '";';
$result = $conn->query($qsFetchAdminData);
$resultAssoc = mysqli_fetch_assoc($result);


mysqli_free_result($result);

//刪除判斷
if(isset($_GET['action'])) {
    $qsDelMember = 'delete from memberdata where m_id = ' . $_GET['id'] . ';';
    $conn->query($qsDelMember);
}



//設定每頁筆數
$rowsPerPage = 3;
//所在頁
if (isset($_GET['page'])) $pageActive = $_GET['page'];
else $pageActive = 1;

//起始筆
$rowIndexStart = ($pageActive - 1) * $rowsPerPage;
//總筆數查詢字串
$queryStringTotal = 'select * from memberdata where m_level <> "admin" order by m_jointime desc;';
//查詢全部結果
$resultTotal = $conn->query($queryStringTotal); 
//總筆數
$rowsTotal = mysqli_num_rows($resultTotal);
//總頁數
$pages = ceil($rowsTotal / $rowsPerPage);
//顯示部分查詢字串
$queryStringPart = 'select * from memberdata where m_level <> "admin" order by m_jointime desc limit ' . $rowIndexStart . ',' . $rowsPerPage . ";";
//查詢部分結果
$resultPart = $conn->query($queryStringPart);


mysqli_close($conn);
?>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>網站會員系統</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <style>
            .pages{
                padding: 0 10px;
            }
            span{
                margin-right: 50px;
            }
        </style>
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
                                    <?php while($row = mysqli_fetch_assoc($resultPart)) { ?>
                                    <tr>
                                        <td width="10%" align="center" bgcolor="#FFFFFF"><p><a href="member_adminupdate.php?id=<?php echo $row['m_id'];?>&adminid=<?php echo $resultAssoc['m_id'];?>">修改</a><br>
                                            <a href="?action=delete&id=<?php echo $row['m_id'];?>" onClick="return confirm('are you sure?');">刪除</a></p></td>
                                        <td width="20%" align="center" bgcolor="#FFFFFF"><p><?php echo $row['m_name'];?></p></td>
                                        <td width="20%" align="center" bgcolor="#FFFFFF"><p><?php echo $row['m_username'];?></p></td>
                                        <td width="20%" align="center" bgcolor="#FFFFFF"><p><?php echo $row['m_jointime'];?></p></td>
                                        <td width="20%" align="center" bgcolor="#FFFFFF"><p><?php echo $row['m_logintime'];?></p></td>
                                        <td width="10%" align="center" bgcolor="#FFFFFF"><p><?php echo $row['m_login'];?></p></td>
                                    </tr>
                                    <?php } ?>	
                                </table>          

                                <hr size="1">
                                <table width="98%" border="0" align="center" cellpadding="4" cellspacing="0">
                                    <tr>
                                        <td valign="middle"><p>資料筆數：<?php echo $rowsTotal; ?></p></td>
                                        <td align="right">
                                            <p>
                                                <?php
                                                echo '<span>PAGE ';
                                                for($p=1;$p<$pages+1;$p++){
                                                    echo "<a class='pages' href='member_admin.php?page=$p'>$p</a>";
                                                }
                                                echo '</span>';
                                                if ($pageActive > 1) echo "<a href='member_admin.php?page=1'>第一頁</a> | <a href='member_admin.php?page=" . ($pageActive - 1) . "'>上一頁</a> | ";
                                                if ($pageActive != $pages) echo "<a href='member_admin.php?page=" . ($pageActive + 1) . "'>下一頁</a> | <a href='member_admin.php?page=$pages'>最末頁</a>";
                                                ?>
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
                                    <p><strong><?php echo $resultAssoc['m_username'];?></strong>您好。<br>
                                        本次登入的時間為：<br>
                                        <?php echo $resultAssoc['m_logintime'];?></p>
                                    <p align="center"><a href="member_adminupdate.php?adminid=<?php echo $resultAssoc['m_id'];?>">修改資料</a> | <a href="?logout=true">登出系統</a></p>
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