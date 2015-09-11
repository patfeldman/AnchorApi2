<?php 
class moodhistory extends genericTable{
	const DB_TABLE_NAME = 'moodhistory'; 
	const DB_UNIQUE_ID = 'historyid'; 
	
	public function __construct(){
		parent::__construct(moodhistory::DB_TABLE_NAME, moodhistory::DB_UNIQUE_ID);
	}

	public static function getLastestMoods($userId, $numMoods){
		$retVal = array();
		$mood = new moodhistory();
		$mood->set_variable("userId", $userId);
		while ($mood->loadNext('', ' order by date', $numMoods )){
			$item['GroupId'] = $mood->get_variable('moodGroup');
			//$retVal
		}

	}
}