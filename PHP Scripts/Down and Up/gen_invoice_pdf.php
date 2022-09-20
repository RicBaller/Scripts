<?php
include __DIR__ . '/init.php';
include __DIR__ . '/includes/invoicefunctions.php';

use WHMCS\Auth;

$user = filter_var($_GET['us'], FILTER_SANITIZE_STRING);
$pass = filter_var($_GET['pw'], FILTER_SANITIZE_STRING);
$id = filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT);
$authAdmin = new Auth;

if ($authAdmin->getInfobyUsername($user) && $authAdmin->comparePassword($pass)) {
    $isValid = true;
} else {
    $isValid = false;
}

if (!$isValid) {
    die('Access Denied');
}


if ($id > 0) {
    $pdfdata = pdfInvoice($id);

    header("Content-type:application/pdf");
    header("Content-Disposition:attachment;filename=invoice_$id.pdf");

    echo $pdfdata;  
