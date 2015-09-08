<?php 
class user extends genericTable{
	const DB_TABLE_NAME = 'user'; 
	const DB_UNIQUE_ID = 'userid'; 

	const USERNAME_DOES_NOT_EXIST = -1;
	const USERNAME_IS_TAKEN = -2;
	const PASSWORD_DOES_NOT_MATCH = -3;
	const USER_NOT_SET = -4;
	
	private $userId = user::USER_NOT_SET; 
	public function __construct(){
		parent::__construct(user::DB_TABLE_NAME, user::DB_UNIQUE_ID);
	}
	

    public function registerAccount($name, $pwd){
    	$this->set_variable('username', $name);
    	if ($this->load()){
			$this->userId = user::USERNAME_IS_TAKEN; // username already exists
    	} else {
	    	$this->set_variable('password', $pwd);
	    	$this->userId = $this->createNew();
    	}
    	return $this->userId;
    }

    public function updateInfo($email, $phone){
    	if ($this->userId > 0){
	    	$this->set_variable('email', $email);
	    	$this->set_variable('phone', $phone);
	    	$this->update();    		
    	}
    }

    public function login($name, $pwd){
    	$retVal = user::USER_NOT_SET;
    	$this->set_variable('username', $name);
    	if ($this->load()){
	    	if ($pwd === $this->get_variable('password')){
				$retVal = $this->get_variable('userid');
	    	} else {
	    		$retVal = user::PASSWORD_DOES_NOT_MATCH;
	    	}
    	} else {
    		$retVal = user::USERNAME_DOES_NOT_EXIST;
    	}
    	return $retVal;
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