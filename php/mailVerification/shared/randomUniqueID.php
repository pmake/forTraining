<?php
//參數指定值是未傳入參數時的預設值
function idGenerator($idLength = 8)
{
    return substr(md5(uniqid(rand())), rand(0, 32 - $idLength), $idLength);
}