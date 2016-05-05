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
        
        //q1
        srand((double)microtime() * 100000);
        for($i=1;$i<7;$i++){
            echo "第 $i 個號碼是 : " . rand(1,42) . "<br>";
        }
        
        //q2
        $season  = array('春','夏','秋','冬');
        echo "每年的四季分別為 : ";
        foreach($season as $eleValue){
            echo $eleValue;
        }
        
        //q3
        $d0 = array("星期日的英文是","Sunday");
        $d1 = array("星期一的英文是","Monday");
        $d2 = array("星期二的英文是","Tuesday");
        $d3 = array("星期三的英文是","Wednesday");
        $d4 = array("星期四的英文是","Thursday");
        $d5 = array("星期五的英文是","Friday");
        $d6 = array("星期六的英文是","Saturday");
        
        $weekday = array($d0,$d1,$d2,$d3,$d4,$d5,$d6);
        foreach($weekday as $eleValue1){
            $temp ="";
            foreach($eleValue1 as $eleValue2){
                $temp.=$eleValue2;
            }
            echo $temp . "<br>";
        }
        
        //q4
        $sno = array("學號",'101');
        $name = array("姓名",'李雲毓');
        $gender = array("性別",'女');
        $birthday = array("生日",'2000/3/14');
        $phone = array("電話",'(02)2704-2762');
        
        ?>
    </body>
</html>
