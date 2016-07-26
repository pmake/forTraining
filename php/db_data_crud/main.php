<?php
require_once 'functions.php';
$conn = dbConnector('localhost', 'root', '', 'class', '3306');
?>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.

-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>學生資料管理系統</title>
        <style>
            h1, p, table{
                text-align: center;
            }
            table {
                margin-left:auto;
                margin-right:auto;
                margin-top: 30px;
                margin-bottom: 20px;
            }
            table, tr, td, th {
                border:1px solid;
            }
            td, th {
                width:150px;
                height:60px;
            }
            #divPagesContainer {
                text-align: center;
            }
            .pages {
                margin-left:5px;
            }
        </style>
    </head>
    <body>
        <h1>學生資料管理系統</h1>
        <?php
        //刪除資料
        if(isset($_GET['id'])) {
            $conn->query('delete from students where cID = ' . $_GET['id']);
        }
        
        //設定每頁筆數
        $rowsPerPage = 3;
        //所在頁
        if (isset($_GET['page'])) $pageActive = $_GET['page'];
        else $pageActive = 1;
        
        //起始筆
        $rowIndexStart = ($pageActive - 1) * $rowsPerPage;
        //總筆數查詢字串
        $queryStringTotal = "select cID as '學號', cName as '姓名', cSex as '性別', cBirthday as '生日', cEmail as 'Email', cPhone as '電話', cAddr as '住址' from students;";
        //查詢全部結果
        $resultTotal = $conn->query($queryStringTotal); 
        //總筆數
        $rowsTotal = mysqli_num_rows($resultTotal);
        //總頁數
        $pages = ceil($rowsTotal / $rowsPerPage);
        //顯示部分查詢字串
        $queryStringPart = "select cID as '學號', cName as '姓名', cSex as '性別', cBirthday as '生日', cEmail as 'Email', cPhone as '電話', cAddr as '住址' from students limit " . $rowIndexStart . ',' . $rowsPerPage . ";";
        //查詢部分結果
        $resultPart = $conn->query($queryStringPart);

        if ($resultPart) {
            echo "<p>總資料筆數:" . $rowsTotal . "&nbsp;&nbsp;&nbsp;<a href='add.php'>新增學生資料</a></p>";

            $rowData = mysqli_fetch_row($resultPart);
            echo '<table><tr>';
            $end = count($rowData);
            for ($i = 0; $i < $end; $i++) {
                echo "<th>" . mysqli_fetch_field($resultPart)->name . "</th>";
            }
            echo '<th>功能</th></tr>';
            while ($rowData) {
                echo '<tr>';
                foreach ($rowData as $val) {
                    echo "<td> $val </td>";
                }
                echo "<td><a href='update.php?id=" . $rowData[0] . "'>修改</a>";
                echo "&nbsp;&nbsp;<a onclick='return confirm(\"are you sure?\")' href='main.php?id=$rowData[0]'>刪除</a></td></tr>";
                $rowData = mysqli_fetch_row($resultPart);
            }
            echo '</table></div>';
            //清除查詢結果物件內容，釋放記憶體
            mysqli_free_result($resultPart);
            mysqli_close($conn);
        } else {
            echo 'query failed';
            mysqli_close($conn);
        }
        echo "<div id='divPagesContainer'>";
        if ($pageActive > 1) echo "<a class='pages' href='main.php?page=1'>最前頁</a><a class='pages' href='main.php?page=" . ($pageActive - 1) . "'>上一頁</a>";
        if ($pageActive != $pages) echo "<a class='pages' href='main.php?page=" . ($pageActive + 1) . "'>下一頁</a><a class='pages' href='main.php?page=$pages'>最末頁</a>";
        for($p=1;$p<$pages+1;$p++){
            echo "<a class='pages' href='main.php?page=$p'>$p</a>";
        }
        echo "</div>";
        ?>
    </body>
</html>
