<?php
require 'flight/Flight.php';


Flight::route('POST|GET /anchorapi/login/', function(){
	$request = Flight::request();
	print_r($request->query['name']);
    echo 'I received a POST request.';
});
Flight::route('/user/[0-9]+', function(){
    echo 'I received a .';
});


function hello(){
    echo 'hello world!';
}

Flight::route('/', 'hello');
Flight::route('/login/', 'hello');


Flight::start();

