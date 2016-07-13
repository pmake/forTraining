<?php

class A
{
    //當存取的屬性未定義時，會進到這個magic method，可以用來實作屬性多載
    function __get($undefineVar)
    {
        echo '你觸發了magic method for undefined property';
    }

    //當存取的方法未定義時，會進到這個magic method，可以用來實作方法多載
    function __call($undefineMethodName, $undefineMethodParameters)
    {
        echo '你觸發了magic method for undefined Method';
        //未定義方法的參數會以陣列的方式傳入
        print_r($undefineMethodParameters);
    }
}

$a = new A();
//這會觸發__get magic method，因為存取的屬性未定義在類別中
$a->anyProperty;
//這會觸發__call magic method，因為使用的方法未定義在類別中
$a->anyMethod('傳入值1', '傳入值2');

//實作多型
class testOverLoad
{
    function __call($methodName, $methodParameters)
    {
        switch ($methodName) {
            case 'testMethod':
                switch (count($methodParameters)) {
                    case 2:
                        echo '這是兩個參數的處理需求，以下實施對應的處理';
                        //也可以再進一步做參數型別判斷
                        break;
                    case 3:
                        echo '這是三個參數的處理需求，以下實施對應的處理';
                        break;
                    default:
                        echo '例外處理';
                }
                break;
            default:
                echo '例外處理';
        }
    }
}

$test = new testOverLoad();
$test->testMethod(1, 1);

?>