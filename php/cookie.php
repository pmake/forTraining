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
        
        //檢查cookie key是否已存在，不存在才新增
        if(isset($_COOKIE['test1'])) echo 'test1已存在,值為: ' . $_COOKIE['test1'] . '<br>';
        else $result1 = setcookie("test1",'test1');
        if(isset($_COOKIE['test2']['name'])) echo 'test2name已存在,值為: ' . $_COOKIE['test2']['name'] . '<br>';
        else echo $result2 = setcookie("test2[name]",'ryu');
        if(isset($_COOKIE['test2']['skill'])) echo 'test2skill已存在,值為: ' . $_COOKIE['test2']['skill'] . '<br>';
        else echo $result3 = setcookie("test2[skill]",'horyuken');
        
        //cookie建立後是在網頁讀取完畢才進行寫入的動作，因此建立後未重新載入前是讀取不到值的
        if (isset($result1)){
            if(isset($_COOKIE['test1'])) echo 'test1值為: ' . $_COOKIE['test1'] . '<br>';
            else echo 'cookie test1建立成功，請重新整理顯示<br>';
        }
        if (isset($result2)){
            if(isset($_COOKIE['test2']['name'])) echo 'name值為: ' . $_COOKIE['test2']['name'] .'<br>';
            else echo 'cookie test2name建立成功，請重新整理顯示<br>';
        }
        if (isset($result3)){
            if(isset($_COOKIE['test2']['skill'])) echo 'skill值為: ' . $_COOKIE['test2']['skill'] . '<br>';
            else echo 'cookie test2skill建立成功，請重新整理顯示<br>';
        }
        
        //刪除cookie方法為將期存在時間設為過去時間即可，刪除與建立相同，一樣是在網頁讀取完畢才執行
        //setcookie("test1",'',strtotime('-20 seconds'));
        
        
        ?>
    </body>
</html>
