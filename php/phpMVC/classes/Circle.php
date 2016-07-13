<?php
namespace archi\classes\circle;
use archi\classes\shape\Shape;
include_once "Shape.php";

class Circle extends Shape{
    private $radius;
    public function __construct($radius)
    {
        $this->radius = $radius;
    }
    public function setRadius ($radius){
        $this->radius = $radius;
    }
    public function getRadius (){
        return $this->radius;
    }
    public function calcArea (){
        return $this->radius * $this->radius * 3.14159;
    }
}
?>