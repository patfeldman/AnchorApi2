<?php
require 'flight/Flight.php';


Flight::route('POST /anchorapi/login/', 'login');
Flight::route('POST /anchorapi/logout/', 'logout');
Flight::route('POST /anchorapi/register/', 'register');
Flight::route('GET /anchorapi/team/token/[0-9a-zA-Z]+/', 'getTeam');
Flight::route('GET /anchorapi/team/token/[0-9a-zA-Z]+/leader', 'getTeamLeader');
//  function(){
// 	$request = Flight::request();
// 	print_r($request->query['name']);
//     echo 'I received a POST request.';
// });

function register(){
 	$request = Flight::request();
    $user = new user();
    $user->registerAccount($request->query['name'], $request->query['pwd']);
    $user->updateInfo($request->query['email'], $request->query['phone']);
    echo $user->login($request->query['name'], $request->query['pwd']);
}

Flight::route('POST /anchorapi/login/', function(){
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


Flight::start();

