<?php
require_once 'api.class.php';
class anchorapi extends api
{
    protected $User;

    public function __construct($request, $origin) {
        parent::__construct($request);
        // Abstracted out for example
        //$APIKey = new authaccess();//new Models\APIKey();
        // if (!array_key_exists('apiKey', $this->input)) {
        //     throw new Exception('No API Key provided');
        // } else if (!$APIKey->verifyKey($this->input->apiKey, $origin)) {
        //     throw new Exception('Invalid API Key');
        // } else if (array_key_exists('token', $this->input) &&
        //      !$User->get('token', $this->input->token)) {
        //     throw new Exception('Invalid User Token');
        // }
        // $this->User = $User;
    }

    protected function authenticate(){
        if ($this->method == 'POST' && array_key_exists("username",$this->input)) {
            $user = new user();
            return $user->login($this->input->username, $this->input->password);
        } else {
            return "ERROR - NOT WORKING";
        }
    }

    protected function register(){
        if ($this->method == 'POST' && array_key_exists("username",$this->input)) {
            $user = new user();
            $retVal = $user->registerAccount($this->input->username, $this->input->password);
            if ($retVal == user::USERNAME_IS_TAKEN){
                return "ERROR - USERNAME IS TAKEN";
            } else {
                if (array_key_exists("email",$this->input)){
                    $user->updateInfo($this->input->email, $this->input->tel);
                }
                return $user->login($this->input->username, $this->input->password);
            }
        } else {
            return "ERROR - NOT WORKING" . print_r($this->input, true);
        }
    }     
    protected function moods($argValues){
        if ($this->method == 'GET') {
            try{
                $userId = authaccess::getValidUserId($argValues[0]);
                $history = moodhistory::getLastestMoods($userId, $argValues[1]);
                return $history;
            } catch (Exception $e) {
                return  "ERROR - EXPIRED OR INVALID TOKEN";
            }
        } else if ($this->method == 'POST') {
            try{
                $userId = authaccess::getValidUserId($argValues[0]);
                $history = moodhistory::addMood($userId, $this->input->groupId, $this->input->moodId);
                return $history;
            } catch (Exception $e) {
                return  "ERROR - EXPIRED OR INVALID TOKEN";
            }

        } else {    
            return "ERROR - NOT WORKING" . print_r($this->input, true);
        }
     }     

 }