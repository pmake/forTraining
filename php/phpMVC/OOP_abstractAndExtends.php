<?php

class Animal {

    private $animalType;
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

    public function eat($food) {
        echo this->name . 'is eating ' . $food;
    }

}


class Dog extends Animal {
    
    public function barking ($target) {
        echo this->name . 'is barking to ' . $target;  
    }
    
}

class Cat extends Animal {
    
    public function clawAttack($target){
        echo this->name . 'is Attack ' . $target . 'with it\'s claw';
    }
    
}


?>