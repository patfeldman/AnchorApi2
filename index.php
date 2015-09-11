<?php
header("Access-Control-Allow-Origin: *");
// const AUTOLOAD_LOCATION = './';
// require_once("config/autoload.php");
// require_once 'flight/Flight.php';


// Flight::route('POST|GET /anchorapi/login/', 'login');
// //Flight::route('POST /anchorapi/logout/', 'logout');
// Flight::route('POST /anchorapi/register/', 'register');
// Flight::route('GET /anchorapi/team/token/[0-9a-zA-Z]+/', 'getTeam');
// Flight::route('GET /anchorapi/team/token/[0-9a-zA-Z]+/leader', 'getTeamLeader');
// //  function(){
// // 	$request = Flight::request();
// // 	print_r($request->query['name']);
// //     echo 'I received a POST request.';
// // });

// function register(){
//  	$request = Flight::request();
//     $user = new user();
//     $user->registerAccount($request->query['name'], $request->query['pwd']);
//     $user->updateInfo($request->query['email'], $request->query['phone']);
//     echo $user->login($request->query['name'], $request->query['pwd']);
// }

// function login(){
//  	$request = Flight::request();
//     $user = new user();
//     echo $user->login($request->query['name'], $request->query['pwd']);
// }

// Flight::start();

