<?php
define("DB_HOST","localhost");
define("DB_NAME","twitter");
// define("DB_NAME","tweety");
define("DB_USER","tweety");
define("DB_PASS","password");

// SMTP
define("M_HOST","smtp.gmail.com");
define("M_USERNAME","YourEmail@gmail.com");
define("M_PASSWORD","YourEmailPassword");
define("M_SMTPSECURE","tls");
define("M_PORT","587");

$public_end=strpos($_SERVER['SCRIPT_NAME'],"/frontend")+8;
$doc_root=substr($_SERVER['SCRIPT_NAME'],0,$public_end);
define("WWW_ROOT",$doc_root);
// echo BASE_URL;


?>