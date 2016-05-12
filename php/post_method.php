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
        <!--post方法是透過HTTP Request方式傳遞資料-->
        <!--post方法是透過'name'屬性識別資料-->
        <form method='post' action="post_accessdata.php">
            帳號:<input type='text' name='ac'>
            <br>
            密碼:<input type='text' name='pw'>
            <br><br>
            <input type='submit' value='送出資料'>
        </form>
    </body>
</html>
