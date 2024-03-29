<?php
namespace archi\classes\square;
use archi\classes\circle\Circle;
use archi\classes\shape\Shape;

include_once "Shape.php";
class Square extends Shape{
    private $sideLength;
    public function __construct($sideLength)
    {
        $this->sideLength = $sideLength;
    }
    public function setSideLength ($sideLength){
        $this->sideLength = $sideLength;
    }
    public function getSideLength (){
        return $this->sideLength;
    }
    public function calcArea (){
        return ($this->sideLength * $this->sideLength);
    }
}
?>