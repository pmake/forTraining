<?php
//修改物件屬性可見度，以getter/setter存取物件屬性
//讀取物件屬性的方法就稱為getter/修改物件屬性的方法稱為setter
//使用setter與getter的好處是因為用一個方法處理，方法內部就多了很多彈性可以進行其他處理，例如記錄log
//若未使用setter與getter，要記錄物件的活動歷程，就必須在每次讀寫屬性時加入記錄log的動作，使用setter與getter則只需在方法中加入記錄log的動作一次即可
/*
不使用setter
log 修改name屬性
littleBlack->name = lb;
log 修改name屬性
littleBlack->name = bb;
…
…
使用setter

function setName($name){
    log 修改name
    this->name = $name;
}

littleBlack->setName('lb');
littleBlack->setName('bb');
...
...


*/

class Dog {

    protected $name;
    protected $position;

    public function __construct($name){
        $this->name = $name;
        $this->position = ['x'=>0, 'y'=>0];
    }
    
    public function setName ($name){
        this->name = $name;
    }
    
    public function getName ($name){
        return this->name;
    }

    public function moveTo ($x,$y){
        $this->position['x'] = $x;
        $this->position['y'] = $y;
        return $this->position;
    }

    public function distance($x, $y) {
        return array($x - $this->position['x'], $y - $this->position['y']);
    }

}

//用類別藍圖實體化一個物件
$littleBlack = new Dog('littleBlack');

//操作物件屬性與方法
echo $littleBlack->getName();
$position = $littleBlack->moveTo(3,5);
echo "<br>";
echo $position['x'] . '/' . $position['y'];
$distance = $littleBlack->distance(3,6);
echo "<br>";
echo 'x:' . $distance[0] . '      ' . 'y:' . $distance[1];

$cloneLittleBlack = $littleBlack;
$littleBlack = '';

echo $littleBlack->name;
echo $cloneLittleBlack->name;

?>