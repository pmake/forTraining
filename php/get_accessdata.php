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
        echo '你輸入的姓名是:<br>';
        //get方法是透過URL傳遞資料，接收端的網址後方會加入特定規則呈現的一連串文字，這些文字就是傳遞的內容，所以也可以手動修改網址給定參數值
        //並透過html標籤的'name'屬性識別資料
        echo $_GET['username'];
        ?>
    </body>
</html>
