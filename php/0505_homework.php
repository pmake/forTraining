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
        
        echo "q1:<br><br>";
        
        //造球
        for($i=0;$i<42;$i++){
            $array[$i]=$i+1;
        }
        //強化隨機性
        srand((double)microtime() * 100000);
        //秀球函數
        function showPool($pool){
            echo "餘球如下:<br>";
            foreach($pool as $number){
                echo $number . ", ";
            }
            echo "<br>";
        }
        showPool($array);
        //抽球
        for($j=1;$j<7;$j++){
            //隨機抽球擺放位置
            $tempTail = count($array)-1;
            $tempPos = rand(0,$tempTail);
            //顯示該位置球號
            echo "第 $j 個號碼是 : " . $array[$tempPos] . "<br>";
            //移除被抽中的球(後方球往前擠)
            for($k=$tempPos;$k<$tempTail;$k++){
                $array[$k]=$array[$k+1];
            }
            //清除多餘陣列尾端
            unset($array[$tempTail]);
            showPool($array);
        }
       
        
        echo "<br>";
        
        //q2
        
        echo "q2:<br><br>";
        
        $season  = array('春','夏','秋','冬');
        echo "每年的四季分別為 : ";
        foreach($season as $eleValue){
            echo $eleValue;
        }
        
        echo "<br><br>";
        
        //q3
        
        echo "q3:<br><br>";
        
        //第一維陣列用來區分各天的語系
        $d0 = array("星期日的英文是","Sunday");
        $d1 = array("星期一的英文是","Monday");
        $d2 = array("星期二的英文是","Tuesday");
        $d3 = array("星期三的英文是","Wednesday");
        $d4 = array("星期四的英文是","Thursday");
        $d5 = array("星期五的英文是","Friday");
        $d6 = array("星期六的英文是","Saturday");
        //第二維區分各天
        $weekday = array($d0,$d1,$d2,$d3,$d4,$d5,$d6);
        //兩層foreach分別讀取一個維度值以輸出結果
        foreach($weekday as $eleValue1){
            $temp ="";
            foreach($eleValue1 as $eleValue2){
                $temp.=$eleValue2;
            }
            echo $temp . "<br>";
        }
        
        echo "<br>";
        
        //q4
        
        echo "q4-1:<br><br>";
        
        /*
        這題可以宣告一個3維陣列$students[這是第三維][這是第二維][這是第一維]
        第一維區分屬性值，有2個維度(屬性名稱和屬性值)
        第二維區分屬性，有5個維度(學號、姓名、姓別…)
        第三維區分學生，有5個維度(有5個學生)
        等當宣告5*5*2=50個變數，有點浪費
        因為屬性名稱是共用的，所以可以提取出來以一個1維陣列存放即可
        所以就變成用一個2維陣列加一個1維陣列處理即可
        2維陣列:
        第一維區分屬性值，有5個維度
        第二維區分學生，有5個維度
        1維陣列:
        區分屬性名稱，有5個維度
        2維陣列部份等當宣告5*5=25個變數，1維陣列部份等當宣告5*1=5個變數
        總共30個變數，比3維的方式節省20個變數，應該是比較好的選擇
        以下實作上述兩種方式
        */
        //3維方式
        //第一維
        $sno1 = array('學號 : ','101，');
        $sname1 = array('姓名 : ','李雪毓，');
        $sgender1 = array('性別 : ','女，');
        $sbirth1 = array('生日 : ','2000/3/14，');
        $sphone1 = array('電話 : ','(02)2704-2762。');
        
        $sno2 = array('學號 : ','102，');
        $sname2 = array('姓名 : ','黃冠妮，');
        $sgender2 = array('性別 : ','女，');
        $sbirth2 = array('生日 : ','2000/6/6，');
        $sphone2 = array('電話 : ','(02)2093-8213。');
        
        $sno3 = array('學號 : ','103，');
        $sname3 = array('姓名 : ','韋國書，');
        $sgender3 = array('性別 : ','男，');
        $sbirth3 = array('生日 : ','2000/7/15，');
        $sphone3 = array('電話 : ','(02)2502-1314。');
        
        $sno4 = array('學號 : ','104，');
        $sname4 = array('姓名 : ','劉子芸，');
        $sgender4 = array('性別 : ','女，');
        $sbirth4 = array('生日 : ','2000/8/7，');
        $sphone4 = array('電話 : ','(02)2530-7996。');
        
        $sno5 = array('學號 : ','105，');
        $sname5 = array('姓名 : ','李政昀，');
        $sgender5 = array('性別 : ','男，');
        $sbirth5 = array('生日 : ','2000/12/24，');
        $sphone5 = array('電話 : ','(02)2740-8965。');
        //第二維
        $st1 = array($sno1,$sname1,$sgender1,$sbirth1,$sphone1);
        $st2 = array($sno2,$sname2,$sgender2,$sbirth2,$sphone2);
        $st3 = array($sno3,$sname3,$sgender3,$sbirth3,$sphone3);
        $st4 = array($sno4,$sname4,$sgender4,$sbirth4,$sphone4);
        $st5 = array($sno5,$sname5,$sgender5,$sbirth5,$sphone5);
        //第三維
        $sts = array($st1,$st2,$st3,$st4,$st5);
        //顯示結果
        foreach($sts as $st){
            $combiner="";
            foreach($st as $proper){
                foreach($proper as $proValue){
                    $combiner.=$proValue;
                }
            }
            echo $combiner . "<br>";
        }
        
        echo "<br>";
        
        echo "q4-2:<br><br>";
        //2維+1維方式減少變數及程式行數
        //宣告屬性名稱陣列
        $attName = array("學號","姓名","性別","生日","電話");
        //宣告2維陣列的第一維
        $attSet1 = array('101','李雲毓','女','2000/3/14','(02)2704-2762');
        $attSet2 = array('102','黃冠妮','女','2000/6/6','(02)2093-8123');
        $attSet3 = array('103','韋國書','男','2000/7/15','(02)2502-1314');
        $attSet4 = array('104','劉子芸','女','2000/8/7','(02)2530-7996');
        $attSet5 = array('105','李政昀','男','2000/12/24','(02)2740-8965');
        //宣告2維陣列的第二維
        $students = array($attSet1,$attSet2,$attSet3,$attSet4,$attSet5);
        //顯示結果
        echo "<table><tr>";
        foreach($attName as $eleValue3){
            echo "<td>" . $eleValue3 . "</td>";
        }
        echo "</tr>";
        foreach($students as $eleValue4){
            echo "<tr>";
            foreach($eleValue4 as $eleValue5){
                echo "<td>" . $eleValue5 . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
        //表格美化
        echo "<style>table,td {border:1px solid;} td {text-align:center; width:150px;}</style>"
        ?>
    </body>
</html>
