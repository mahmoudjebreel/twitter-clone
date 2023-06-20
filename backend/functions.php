<?php

function is_post_request(){
    return $_SERVER['REQUEST_METHOD']==='POST';
}

function is_get_request(){
    return $_SERVER['REQUEST_METHOD']==='GET';
}

function getInputValue($name){
    if(isset($_POST[$name])){
        echo $_POST[$name];
    }
}

function h($string=""){
    return htmlspecialchars($string);
}

function log_out_user(){
    unset($_SESSION['userLoggedIn']);
    session_destroy();
    return true;
}

function url_for($script){
    return WWW_ROOT.$script;
}

function redirect_to($location){
    header("Location:".$location);
    exit;
}