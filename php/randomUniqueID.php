<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
    </head>
    <body>
       
        <?php
        
        //產生隨機id，經過多個打亂的過程，但有必要這樣嗎?
        echo uniqid() . '<br>';
        echo uniqid(rand()) . '<br>';
        echo md5(uniqid(rand())) . '<br>';
        echo substr(md5(uniqid(rand())),rand(0,32-8),8) . '<br>';
        
        //參數指定值是未傳入參數時的預設值
        function idGenerator($idLength=8){
            return substr(md5(uniqid(rand())),rand(0,32-$idLength),$idLength);
        }
        echo idGenerator(3);
        
        ?>

    </body>
</html>
