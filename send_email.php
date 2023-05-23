<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $recipient = $_POST['recipient'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];

    require_once __DIR__ . '/vendor/autoload.php';
    require_once __DIR__ . '/vendor/phpmailer/phpmailer/src/PHPMailer.php';
    require_once __DIR__ . '/vendor/phpmailer/phpmailer/src/SMTP.php';
    require_once __DIR__ . '/vendor/phpmailer/phpmailer/src/Exception.php';

    // Configuration settings for Outlook.com SMTP
    $smtpHost = 'smtp.office365.com';
    $smtpPort = 587;
    include 'smtp_credentials.php';

    $mail = new PHPMailer\PHPMailer\PHPMailer();
    $mail->isSMTP();
    $mail->Host = $smtpHost;
    $mail->Port = $smtpPort;
    $mail->SMTPAuth = true;
    $mail->SMTPSecure = 'tls';
    $mail->Username = $smtpUsername;
    $mail->Password = $smtpPassword;

    $mail->setFrom($smtpUsername, 'Ikhwan');
    $mail->addAddress($recipient);
    $mail->Subject = $subject;
    $mail->Body = $message;

    if ($mail->send()) {
        echo "Email sent successfully.";
    } else {
        echo "Error sending email: " . $mail->ErrorInfo;
    }
}
