<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<?php
$oriStr = 'abcd1234';

//encode，三種不同加密方式
$rot13EncodeStr = str_rot13($oriStr);
$md5EncodeStr = md5($oriStr);
$sha1EncodeStr = sha1($oriStr);
$base64EncodeStr = base64_encode($oriStr);
$cryptEncodeStr = crypt($oriStr, $oriStr);

echo "原字串: $oriStr <br>";
echo "<br><br>";
echo "rot13加密後: $rot13EncodeStr <br>";
echo "md5加密後: $md5EncodeStr <br>";
echo "sha1加密後: $sha1EncodeStr <br>";
echo "base64加密後: $base64EncodeStr <br>";
echo "crypt加密後: $cryptEncodeStr <br>";
echo "<br><br>";

//decode，只有rot13和base64可逆，其餘不可逆

echo "rot13解密後: " . str_rot13($rot13EncodeStr) . "<br>";
echo "base64解密後: " . base64_decode($base64EncodeStr) . "<br>";

/**
 * Created by PhpStorm.
 * User: Vera
 * Date: 2016/7/11
 * Time: 下午 01:57
 */
?>
</body>
</html>
