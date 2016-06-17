<?php
require_once 'functions.php';
$conn = dbConnector('localhost', 'root', '1qaz@wsx', 'class', '3306');

//刪除資料
if(isset($_GET['id'])) {
    $conn->query('delete from students where cID = ' . $_GET['id']);
}

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
            }
            table, tr, td, th {
                border:1px solid;
            }
            td, th {
                width:150px;
                height:60px;
            }
        </style>
    </head>
    <body>
        <h1>學生資料管理系統</h1>
        <?php
        $result = $conn->query("select cID as '學號', cName as '姓名', cSex as '性別', cBirthday as '生日', cEmail as 'Email', cPhone as '電話', cAddr as '住址' from students;");
        if ($result) {
            ?>
            <p>目前資料筆數:<?php echo mysqli_num_rows($result) . '&nbsp;&nbsp;&nbsp;'; ?><a href="add.php">新增學生資料</a></p>
            <div>
                <?php
                $rowData = mysqli_fetch_row($result);
                echo '<table><tr>';
                $end = count($rowData);
                for ($i = 0; $i < $end; $i++) {
                    echo "<th>" . mysqli_fetch_field($result)->name . "</th>";
                }
                echo '<th>功能</th></tr>';
                while ($rowData) {
                    echo '<tr>';
                    foreach ($rowData as $val) {
                        echo "<td> $val </td>";
                    }
                    echo "<td><a href='update.php?id=" . $rowData[0] . "'>修改</a>";
                    echo "&nbsp;&nbsp;<a onclick='return confirm(123)' href='main.php?id=" . $rowData[0] . "'>刪除</a></td></tr>";
                    $rowData = mysqli_fetch_row($result);
                }
                echo '</table></div>';
                //清除查詢結果物件內容，釋放記憶體
                mysqli_free_result($result);
                mysqli_close($conn);
            } else {
                echo 'query failed';
                mysqli_close($conn);
            }
            ?>
            <script>
                function checker(){
                    return confirm('are you sure?');
                }
            </script>
    </body>
</html>
