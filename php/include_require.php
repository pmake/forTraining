<!DOCTYPE html><!-- 宣告文件類型 -->
<html lang="zh-tw"><!-- 指定網頁使用的語言 -->
<head>
	<title>表單傳送範例</title>
</head>
<body>
<?php
    include "shared/inc1.inc";
    //require "shared/inc1.inc";亦可引入，差別在include遭遇引入檔案不存在時不會停止程式執行，只會提示錯誤訊息，require則會讓程式停止執行
    echo "5+3=".plus(5,3)."<br />";
    echo "5-3=".minus(5,3);
?>
</body>
</html>


