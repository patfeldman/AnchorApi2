<?php 
class user extends genericTable{
	const DB_TABLE_NAME = 'user'; 
	const DB_UNIQUE_ID = 'userid'; 
	
	public function __construct(){
		parent::__construct(user::DB_TABLE_NAME, user::DB_UNIQUE_ID);
	}
	
	
	
	static public function randomPassword() {
	    $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
	    $pass = array(); //remember to declare $pass as an array
	    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
	    for ($i = 0; $i < 8; $i++) {
	        $n = rand(0, $alphaLength);
	        $pass[] = $alphabet[$n];
	    }
	    return implode($pass); //turn the array into a string
	}		
}