<?php

//不存在reference或是程式結束前會執行destruct函數
class A{
    public function __destruct(){
        echo 'A 要被清除了';
    }
}

class B{
    public function __destruct(){
        echo 'B 要被清除了';
    }
}

class C{
    public function __destruct(){
        echo 'C 要被清除了';
    }
}

$a = new A();
$b = new B();
$c = new C();
//消除reference，以其他值取代指標或是用null即可
$a = null;
$b = null;
$c = null;

?>