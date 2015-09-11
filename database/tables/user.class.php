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
			return user::USERNAME_IS_TAKEN; // username already exists
    	} else {
	    	$this->set_variable('password', $pwd);
	    	$this->userId = $this->createNew();
	    	$this->set_variable('userid', $this->userId);
	    	return $this->load();
    	}
    }

    public function updateInfo($email, $phone){
    	if ($this->userId > 0){
	    	$this->set_variable('email', $email);
	    	$this->set_variable('phone', $phone);
	    	$this->update();    		
    	}
    }

    public function login($name, $pwd){
    	$this->set_variable('username', $name);
    	if ($this->load()){
	    	if ($pwd === $this->get_variable('password')){
				$retVal['userId'] = $this->get_variable('userid');
				$authaccess = new authaccess();
				$retVal['authToken'] = $authaccess->generateToken($retVal['userId']);
				$retVal['success'] = true;
	    	} else {
	    		$retVal['errorCode'] = user::PASSWORD_DOES_NOT_MATCH;
				$retVal['success'] = false;
	    	}
    	} else {
    		$retVal['errorCode'] = user::USERNAME_DOES_NOT_EXIST;
			$retVal['success'] = false;
    	}
    	return $retVal;
    }
	
}