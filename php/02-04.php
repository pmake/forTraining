<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <?php
    define("PI",3.14159);
    define("AREA","面積");
   
    echo "圓半徑12的".AREA."為".PI*12*12 ."<br>";//字串連結時數字形態前後需加空格
    echo "圓半徑14的".AREA."為".PI*14*14 ."<br>";
    //內建常數
    echo PHP_VERSION;
    //內建函數
    echo phpinfo();
    
    
    
    /* 
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
     */
    ?>
</body>
</html>