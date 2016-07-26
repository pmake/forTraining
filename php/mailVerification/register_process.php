<?php
require_once './shared/randomUniqueID.php';
require_once '../sendMail/PHPMailer-master/PHPMailerAutoload.php';
$cName = $_POST['cName'];
$cAccount = $_POST['cAccount'];
$cEmail = $_POST['cEmail'];

$chkNo = idGenerator(10);

$chkLink = "<a href=\"http://www.myHost.com/mailVerify.php?uid=$cAccount&chkNo=$chkNo\">http://www.myHost.com/mailVerify.php?uid=$cAccount&chkNo=$chkNo</a>";

//echo $chkLink;

require_once 'mail_txt.php';

//require_once('./PHPMailer-master/class.phpmailer.php');
//include("./PHPMailer-master/class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded

$mail = new PHPMailer(true); // the true param means it will throw exceptions on errors, which we need to catch

$mail->IsSMTP(); // telling the class to use SMTP
try {
//$mail->Host       = "mail.google.com"; // SMTP server
    $mail->SMTPDebug = 2;                     // enables SMTP debug information (for testing)
    $mail->SMTPAuth = true;                  // enable SMTP authentication
    $mail->SMTPSecure = "tls";                 // sets the prefix to the servier
    $mail->Host = "smtp.gmail.com";      // sets GMAIL as the SMTP server
    $mail->Port = 587;                   // set the SMTP port for the GMAIL server
    $mail->Username = "unique.ntsn@gmail.com";  // GMAIL username
    $mail->Password = "accuctnxwsoyjwbb";            // GMAIL password
    $mail->AddReplyTo('unique.ntsn@gmail.com', 'Archi');
    $mail->AddAddress("$cEmail", 'John Doe');
    $mail->SetFrom('unique.ntsn@gmail.com', 'Archi');
    $mail->AddReplyTo('unique.ntsn@gmail.com', 'Archi');
    $mail->Subject = 'PHPMailer Test Subject via mail(), advanced';
    $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
    //$mail->MsgHTML(file_get_contents('contents.html'));
    $mail->Body = "$message";
    $mail->CharSet = "utf-8";
    $mail->AddAttachment('PHPMailer-master/examples/images/phpmailer.png');      // attachment
    $mail->AddAttachment('PHPMailer-master/examples/images/phpmailer_mini.png'); // attachment
    $mail->Send();
    echo "Message Sent OK<p></p>\n";
} catch (phpmailerException $e) {
    echo $e->errorMessage(); //Pretty error messages from PHPMailer
} catch (Exception $e) {
    echo $e->getMessage(); //Boring error messages from anything else!
}


?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>

</body>
</html>