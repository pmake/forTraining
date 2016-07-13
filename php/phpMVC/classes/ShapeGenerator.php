<?php
namespace archi\classes\shapegenerator;

use archi\classes\shape\Shape;
use archi\classes\circle\Circle;
use archi\classes\square\Square;
use archi\classes\equilateraltriangle\EquilateralTriangle;

include_once "Circle.php";
include_once "Square.php";
include_once "EquilateralTriangle.php";
class ShapeGenerator
{
    private $shapeTypePool = [];

    public function addShapeType(Shape $shape)
    {
        array_push($this->shapeTypePool,'\\' . get_class($shape));
    }
    public function test()
    {
        print_r($this->shapeTypePool);
    }
    public function shapeGenerate()
    {
        return new $this->shapeTypePool[mt_rand(0,(count($this->shapeTypePool)-1))](mt_rand(1,10));
    }
}
$circle = new Circle(5);
$square = new Square(3);
$eqTriangle = new EquilateralTriangle(3);
$shapeGenerator = new ShapeGenerator();
$shapeGenerator->addShapeType($circle);
$shapeGenerator->addShapeType($circle);
$shapeGenerator->addShapeType($square);
$shapeGenerator->addShapeType($eqTriangle);
$newShape = $shapeGenerator->shapeGenerate();

echo '隨機產生的圖形類別是: ' . get_class($newShape) . "\n";
echo '面積為: ' . $newShape->calcArea(). "\n";
?>