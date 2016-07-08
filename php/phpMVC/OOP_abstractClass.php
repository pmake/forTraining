<?php

//抽象類別，動物就是一種抽象類別，它是一個概念，而非真的有動物這種實體
//抽象類別無法被實體化(無法以new產生實體)
abstract class Animal{
    //屬性
    private $animalType;
    //方法
    public function setAnimalType ($type){
        $this->animalType = $type;
    }
    public function getAnimalType (){
        return $this->animalType;
    }
    //抽象方法，由子類別實作
    abstract function moveTo ($x, $y);
}

class Cat extends Animal {
    public $position;
    //建構函數
    public function __construct(){
        //使用由父類別繼承的public方法設定private屬性animalType
        $this->setAnimalType('cat');
        $this->position = array('x'=>0, 'y'=>0);
    }
    //實作抽象方法
    public function moveTo($x, $y){
        $this->position['x'] = $x;
        $this->position['y'] = $y;
    }
}

$cathy = new Cat();
echo $cathy->getAnimalType();


?>