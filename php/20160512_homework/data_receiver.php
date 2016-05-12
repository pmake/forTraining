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
    <body bgcolor="#d1fce8">
        <?php
        echo "<style> div {font-size:23px;} span {fone-size:26px; color:blue;}</style>";

        echo "<h1>" . $_GET['UserName'] . (($_GET['Sex'] == 'male') ? ' 先生您好!' : ' 小姐您好!') . "</h1>";

        echo "<div>";

        echo '<span>您的學歷為:<br><br></span>' . $_GET['Education'] . "<br><br>";

        echo '<span>您喜歡的活動如下:</span><br>';
        if (isset($_GET['Activities'])) {
            echo '<ul>';
            foreach ($_GET['Activities'] as $acts) {
                echo "<li> $acts </li>";
            }
            echo '</ul>';
        } else echo '<br>選項裡沒有我有興趣的項目<br><br>';

        echo '<span>您對於使用臉書經營社群的看法為:</span><br>';
        if ($_GET['Others']=="") echo '<br>我對臉書沒有什麼看法';
        else echo '<br>' . $_GET['Others'];

        echo "</div>";
        ?>
    </body>
</html>
