<?php 
class moodhistory extends genericTable{
	const DB_TABLE_NAME = 'moodhistory'; 
	const DB_UNIQUE_ID = 'historyid'; 
	
	public function __construct(){
		parent::__construct(moodhistory::DB_TABLE_NAME, moodhistory::DB_UNIQUE_ID);
	}

	public static function getLastestMoods($userId, $numMoods){
		$retVal['data'] = array();
		$retVal['success'] = true;

		$mood = new moodhistory();
		$mood->set_variable("userId", $userId);
		while ($mood->loadNext('', ' order by date desc ', $numMoods )){
			$item['GroupId'] = $mood->get_variable('moodGroup');
			$item['MoodId']= $mood->get_variable('moodItem');
			$item['Time']= date('h:i a, M jS, Y', strtotime($mood->get_variable('date')));
			array_push ($retVal['data'], $item);
		}
		return $retVal;

	}
	public static function addMood($userId, $groupId, $moodId){
		$retVal['success'] = true;

		$mood = new moodhistory();
		$mood->set_variable("userId", $userId);
		$mood->set_variable("moodGroup", $groupId);
		$mood->set_variable("moodItem", $moodId);
		$mood->set_variable("date", date("Y-m-d H:i:s"));
		$mood->createNew();
		return $retVal;
	}

}