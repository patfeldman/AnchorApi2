<?php
        header("Access-Control-Allow-Origin: *");
        header('Access-Control-Allow-Methods: *');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');
        header("Content-Type: application/json");


//const AUTOLOAD_LOCATION = '/home/openm6/public_html/biobounce/db_interface/';
const AUTOLOAD_LOCATION = './';
require_once("config/autoload.php");

// Requests from the same server don't have a HTTP_ORIGIN header
if (!array_key_exists('HTTP_ORIGIN', $_SERVER)) {
    $_SERVER['HTTP_ORIGIN'] = $_SERVER['SERVER_NAME'];
}
try {
    $API = new anchorapi($_REQUEST['request'], $_SERVER['HTTP_ORIGIN']);
    echo $API->processAPI();
} catch (Exception $e) {
    echo json_encode(Array('error' => $e->getMessage()));
}