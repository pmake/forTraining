<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.

-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        echo '你的帳號是:<br>';
        //post方法是透過HTTP Request方式傳遞資料
        //並透過html標籤的'name'屬性識別資料
        echo $_POST['ac'];
        echo '<br>你的密碼是:<br>';
        echo $_POST['pw'] . '<br>';
        
        $verify = ($_POST['ac']=='chi' && $_POST['pw']=='awsome')? '登入成功':'登入失敗';
        echo $verify;
        ?>
    </body>
</html>
