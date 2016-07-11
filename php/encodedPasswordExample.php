<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
    </head>
    <body>
        <?php

        //crypt方式
        /*if (isset($_POST['password'])) {
            $encodedPW = crypt('abcd1234', 'abcd1234');
            $PW = $_POST['password'];
            if (crypt($PW, $encodedPW) == $encodedPW) {
                echo '密碼正確';
                echo '<a href="javascript:window.history.back();">上一頁</a>';
            }else{
                echo '密碼錯誤';
                echo '<a href="javascript:window.history.back();">上一頁</a>';
            }
        }*/
        //md5方式
        if (isset($_POST['password'])) {
            $encodedPW = md5('abcd1234');
            $PW = $_POST['password'];
            if (md5($PW) == $encodedPW) {
                echo '密碼正確';
                echo '<a href="javascript:window.history.back();">上一頁</a>';
            }else{
                echo '密碼錯誤';
                echo '<a href="javascript:window.history.back();">上一頁</a>';
            }
        }


        /**
 * Created by PhpStorm.
 * User: Vera
 * Date: 2016/7/11
 * Time: 下午 02:27
 */
        ?>

        <form action="encodedPasswordExample.php" method="post">
            <label for="'password">密碼</label>
            <input type="password" name="password" id="'password">
            <input type="submit" value="驗證">
        </form>


    </body>
</html>
