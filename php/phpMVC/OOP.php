<?php

//定義類別藍圖
//public:可從外部存取
//protected:不可從外部存取，但類別內的所有成員皆可存取
//private:不可從外部存取，僅供內部區域內的成員存取
//__construct:內建的建構子函數，實體化物件時會自動執行1次，可用來做初始化。不一定要使用建構子函數。

class Dog {

    public $name;
    protected $position;

    public function __construct($name){
        $this->name = $name;
        $this->position = ['x'=>0, 'y'=>0];
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
echo $littleBlack->name;
$position = $littleBlack->moveTo(3,5);
echo "<br>";
echo $position['x'] . '/' . $position['y'];
$distance = $littleBlack->distance(3,6);
echo "<br>";
echo 'x:' . $distance[0] . '      ' . 'y:' . $distance[1];

$cloneLittleBlack = $littleBlack;
//$littleBlack = '';

unset($littleBlack->name);

echo $littleBlack->name;
//echo $littleBlack->distance(4,6);
echo $cloneLittleBlack->name;

?>