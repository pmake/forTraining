<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
    </head>
    <body>
        <?php
        //trait 特徵，在物件中的類似include或是require的概念，單純的複製貼上內容至需求位置
        trait AnimalDigest{
            public function digest($foodName){
                echo 'to digest ' . $foodName;
            }
        }

        class Dog{
            use AnimalDigest;
        }

        class GoldenRetriever extends Dog{
            
        }

        $lb = new GoldenRetriever();
        $lb->digest('meat');



        ?>
    </body>
</html>
