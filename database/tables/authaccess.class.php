<?php 
class authaccess extends genericTable{
	const DB_TABLE_NAME = 'authacess'; 
	const DB_UNIQUE_ID = 'accessId'; 
	
	public function __construct(){
		parent::__construct(user::DB_TABLE_NAME, user::DB_UNIQUE_ID);
	}

	public static function VerifyKey($key, $origin){

	}
}