<?php
//題目順序隨機，只有在全部答完之後才會再次產生一組新的隨機順序
//原資料第五題沒有答對的comment內容，當它不是被排在最後一題時，答對後會缺少相對應的內容展示，所以要手動新增
//因答題正確的回饋訊息是跟著原生順序走的，所以隨機產生順序後，答對題目要顯示的comment應為原生排序的下一個元素的0索引
session_start();
if(!isset($_SESSION['usrName'])) header('Location:01.php');

require "03.inc.php";

$level = 1;
$iserr = 0;
$regen=0;
if (isset($_COOKIE['progress']))
    $level = $_COOKIE['progress'];



//是否有按送出
if (isset($_POST['answer'])) {
    if ($_POST['answer'] == $Q[$_COOKIE['q' . $level]]['answer']) {
        $level+=1;
        setcookie('progress', $level, time() + 30 * 24 * 3600);
        $iserr = 0;
    } else {
        $iserr = 1;
    }
}
if (isset($_GET['level'])){
    if($_GET['level']==1){
        if($level ==6){
            //清空隨機排序
            for($i=0;$i<5;$i++){
                setcookie('q' . ($i+1),'',-10);
            }
            $regen = 1;
        }
        setcookie('progress','', -10);
        $level=1;
    }
}

//產生隨機排序
if (!isset($_COOKIE['q1']) || $regen==1){
    echo 'no';
    $pool = array(1,2,3,4,5);
    $randomized = array_rand($pool, 5);
    shuffle($randomized);
    for($i=0;$i<5;$i++){
        setcookie('q' . ($i+1),$pool[$randomized[$i]],time() + 30 * 24 * 3600);
    }
    $qIndex = $pool[$randomized[0]];
}elseif ($level<6) $qIndex = $_COOKIE['q' . $level];

?>

<!DOCTYPE html>
<html>
    <head><meta charset="UTF-8"><title>機智問答區</title>
        <style>
            div {text-align:center;border:2px solid navy;margin:3px}
            #frame {width:360px}
        </style></head>
    <body>
        <div id="frame">
            <?php if ($level < 6) { ?>
            <form action="03.php" method="post">
                <div>親愛的 <?php echo $_SESSION['usrName']; ?></div>
                <div>
                    <?php 
                                   if ($level==1 && $iserr==0) echo $Q[1][0];
                                   elseif ($iserr) echo $Q[$qIndex][1];
                                   else {
                                       if ($_COOKIE['q' . ($level-1)]==5) echo "最長的河流你都知道，厲害!";
                                       else echo $Q[$_COOKIE['q' . ($level-1)]+1][0];
                                   }
                    ?>
                </div>
                <div>第 <?php echo $level; ?> 關</div>
                <div><b><?php echo $Q[$qIndex]['question']; ?></b></div>
                <div><input name="answer" type="text"></div>
                <div><input type="submit" value="送出答案">
                    <input type="reset" value="改寫答案"></div>
            </form> 
            <?php } else { ?>
            <div><?php echo $Q[$level]; ?></div>
            <?php } ?>
            <div><a href="03.php?level=1">重頭開始</a></div>
            <div><a href="02.php?level=<?php echo $level; ?>">回會員專區</a></div>
            <a href="01.php?logout=1">登出</a>
        </div></body>
</html>