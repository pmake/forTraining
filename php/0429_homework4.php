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
            function multiply_table_generator($n){
               echo '<style> td {width:80px; height:80px; border:1px solid; text-align:center;} .base {font-weight:bold; background-color:aqua; font-size:26px;} </style><table>';
               for ($i=1;$i<$n+2;$i++){
                   echo '<tr>';
                   for($j=1;$j<$n+2;$j++){
                       if ($i==1 && $j>1) echo "<td class='base'>" . ($j-1) . '</td>';
                       elseif($i>1 && $j==1) echo "<td class='base'>" . ($i-1) . '</td>';
                       else{
                           if ($i==1 && $j==1) echo '<td></td>';
                           else echo '<td>' . ($i-1) . ' x ' . ($j-1) . ' = ' . ($i-1)*($j-1) . '</td>';
                       }
                   }
                   echo '</tr>';
               }
               echo '</table>';
            }
            //呼叫乘法表產生器並給予階層數
            multiply_table_generator(10);
        ?>
    </body>
</html>
