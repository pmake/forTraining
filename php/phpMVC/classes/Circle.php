<?php
namespace archi\classes\circle;
class Circle {
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
        
    }
}
?>