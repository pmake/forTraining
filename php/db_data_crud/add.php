<?php
    if(isset($_POST['cName'])) {
        require_once 'functions.php';
        $conn = dbConnector('localhost', 'root', '1qaz@wsx', 'class', '3306');
        $queryString = "insert into students (cName,cSex,cBirthday,cEmail,cPhone,cAddr) values (";
        $queryString .= "'" . $_POST['cName'] . "',";
        $queryString .= "'" . $_POST['cSex'] . "',";
        $queryString .= "'" . $_POST['cBirthday'] . "',";
        $queryString .= "'" . $_POST['cEmail'] . "',";
        $queryString .= "'" . $_POST['cPhone'] . "',";
        $queryString .= "'" . $_POST['cAddr'] . "'";
        $queryString .= ")";
        $conn->query($queryString);
        mysqli_close($conn);
        header('Location:main.php');
    }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <style>
            .container {
                text-align: center;
            }
            table, th, td {
                border:1px solid;
            }
            table {
                margin:25px auto;
                width:500px;
            }
            td:nth-child(2) {
                width:400px;
                text-align: left;
            }
            table input[type=text] {
                width:100%;
                box-sizing: border-box;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>學生資料管理系統 - 新增資料</h1>
            <a href="main.php">回主畫面</a>
            <form action="" method="post">
                <table>
                    <tr>
                        <th>欄位</th>
                        <th>資料</th>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td><input type="text" name='cName'></td>
                    </tr>
                    <tr>
                        <td>性別</td>
                        <td>
                            <input type="radio" name="cSex" value="M" checked>男&nbsp;
                            <input type="radio" name="cSex" value="F">女
                        </td>
                    </tr>
                    <tr>
                        <td>生日</td>
                        <td><input type="date" name='cBirthday'></td>
                    </tr>
                    <tr>
                        <td>電子郵件</td>
                        <td><input type="text" name='cEmail'></td>
                    </tr>
                    <tr>
                        <td>電話</td>
                        <td><input type="text" name='cPhone'></td>
                    </tr>
                    <tr>
                        <td>住址</td>
                        <td><input type="text" name='cAddr'></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="新增資料">
                            <input type="reset" value="重新填寫">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>