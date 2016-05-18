<?php
$color = 'black';
//判斷是否是按了submit之後重新連線至本頁
if (isset($_POST['color'])) {
    setcookie('color', $_POST['color']);
    $color = $_POST['color'];
} else if (isset($_COOKIE['color'])) {
    $color = $_COOKIE['color'];
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <style>
            div {float:left;   /* 讓區塊與下個區塊由左至右排列 */
                 margin:10px}   
            p {text-align:center;color:<?php echo $color ?>}
            .author {text-align:right}
        </style>
    </head>
    <body>
        <h2>登樂遊原</h2>
        <div>
            <p>向晚意不適，驅車登古原。<br>
                夕陽無限好，只是近黃昏。</p>
            <p class="author">－李商隱</p>
        </div>

        <div>
            <form method="post" action="">
                選擇文字顏色：
                <select name="color">
                    <option value="red">紅</option>
                    <option value="green">綠</option>  
                    <option value="blue">藍</option>
                </select>       
                <input type="submit" value="儲存">
            </form>
        </div>
    </body>
</html>
