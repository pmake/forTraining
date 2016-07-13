<?php
Class MyClassA{
    public $name =  'Ryu';
}
Class MyClassB{
    public $name = 'Ryu';
}
//定義參數時加上型別前綴，可限制傳入的參數型別，限制的型別可以是自定義的類別
Function typeTest(MyClassA $para){
    echo $para->name;
}

typeTest(new MyClassA());//正常執行
//typeTest(new MyClassB());//提示參數型別錯誤

function testCallable (callable $callback){
    $callback();
}
function cb(){
    echo '123';
}

Class Test{
    public function test(){
        echo '123fromtest';
	}
}
testCallable('cb');//正常執行
testCallable(array(new Test(),'test'));//正常執行，PHP也接受這種格式傳遞物件方法
testCallable(123);//提示型別錯誤

?>