<?php
//定義資料傳輸介面
interface DataTransferInterface {
    //定義抽象方法
    public function getDataID();
    public function getData();
}

class DataStorager {
    protected $dataArr = [];//儲存資料用的陣列

    public function saveData (DataTransferInterface $DTI){
        $arrKey = $DTI->getDataID();
        $arrValue = $DTI->getData();
        $this->dataArr[$arrKey] = $arrValue;
    }
    public function readData(){
        return $this->dataArr;
    }
}

class ContactList implements DataTransferInterface{
    protected $friendList = [];
    
    public function add($name, $engName){
        $this->friendList[$name] = $engName;
    }
    
    public function getDataID(){
        return 'friendList';
    }
    public function getData(){
        return $this->friendList;   
    }
}
aa
$ds = new DataStorager();
$cl = new ContactList();
$cl->add('Wen', 'Archi');
$cl->add('Ryu', 'Horyuken');
$ds->saveData($cl);
$data = $ds->readData();
print_r($data);

?>