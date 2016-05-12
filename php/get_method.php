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
        <!--get方法是透過URL傳遞資料，接收端的網址後方會加入特定規則呈現的一連串文字，這些文字就是傳遞的內容，所以也可以手動修改網址給定參數值-->
        <!--get方法是透過'name'屬性識別資料-->
        <form method='get' action="get_accessdata.php">
            請輸入姓名:<input type='text' name='username'>
            <br><br>
            <input type='submit' value='送出資料'>
        </form>
        <br>
        
    </body>
</html>
