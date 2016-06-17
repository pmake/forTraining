<?php
require_once 'functions.php';
$conn = dbConnector('localhost', 'root', '1qaz@wsx', 'class', '3306');
//讀取資料
$queryString = "select cName,cSex,cBirthday,cEmail,cPhone,cAddr from students where cID =" . $_GET['id'];
$result = $conn->query($queryString);
$row = mysqli_fetch_assoc($result);

//修改資料
if(isset($_POST['cName'])) {
    $queryString = "update students set ";
    $queryString .= 'cName=' . "'" . $_POST['cName'] . "',";
    $queryString .= 'cSex=' . "'" . $_POST['cSex'] . "',";
    $queryString .= 'cBirthday=' . "'" . $_POST['cBirthday'] . "',";
    $queryString .= 'cEmail=' . "'" . $_POST['cEmail'] . "',";
    $queryString .= 'cPhone=' . "'" . $_POST['cPhone'] . "',";
    $queryString .= 'cAddr=' . "'" . $_POST['cAddr'] . "' ";
    $queryString .= 'where cID=' . $_GET['id'];

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
            <h1>學生資料管理系統 - 修改資料</h1>
            <a href="main.php">回主畫面</a>
            <form action="" method="post">
                <table>
                    <tr>
                        <th>欄位</th>
                        <th>資料</th>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td><input class="reset" type="text" name='cName' value=<?php echo $row['cName']?>></td>
                    </tr>
                    <tr>
                        <td>性別</td>
                        <td>
                            <input type="radio" name="cSex" value="M" <?php if ($row['cSex']=='M') echo 'checked';?>>男&nbsp;
                            <input type="radio" name="cSex" value="F" <?php if ($row['cSex']=='F') echo 'checked';?>>女
                        </td>
                    </tr>
                    <tr>
                        <td>生日</td>
                        <td><input class="reset" type="date" name='cBirthday' value=<?php echo $row['cBirthday']?>></td>
                    </tr>
                    <tr>
                        <td>電子郵件</td>
                        <td><input class="reset" type="text" name='cEmail' value=<?php echo $row['cEmail']?>></td>
                    </tr>
                    <tr>
                        <td>電話</td>
                        <td><input class="reset" type="text" name='cPhone' value=<?php echo $row['cPhone']?>></td>
                    </tr>
                    <tr>
                        <td>住址</td>
                        <td><input class="reset" type="text" name='cAddr' value=<?php echo $row['cAddr']?>></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="更新資料">
                            <input onclick="cleaner()" type="reset" value="重新填寫">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <script>
            <?php
            echo "
            function cleaner(){
                var eles = document.getElementsByClassName('reset');
                for(var i=0;i<eles.length;i++){
                    eles[i].setAttribute('value','');
                }
            }
            ";
            ?>
        </script>
    </body>
</html>