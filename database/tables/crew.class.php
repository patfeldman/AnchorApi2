<?php 
class crew extends genericTable{
	const DB_TABLE_NAME = 'crew'; 
	const DB_UNIQUE_ID = 'crewid'; 
	
	public function __construct(){
		parent::__construct(user::DB_TABLE_NAME, user::DB_UNIQUE_ID);
	}
}