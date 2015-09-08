<?php
require_once 'api.class.php';
class anchorapi extends api
{
    protected $User;

    public function __construct($request, $origin) {
        parent::__construct($request);
        // Abstracted out for example
        //$APIKey = new authaccess();//new Models\APIKey();
        // if (!array_key_exists('apiKey', $this->request)) {
        //     throw new Exception('No API Key provided');
        // } else if (!$APIKey->verifyKey($this->request['apiKey'], $origin)) {
        //     throw new Exception('Invalid API Key');
        // } else if (array_key_exists('token', $this->request) &&
        //      !$User->get('token', $this->request['token'])) {
        //     throw new Exception('Invalid User Token');
        // }
        // $this->User = $User;
    }

     protected function login(){
        if ($this->method == 'POST') {
            return "Your name is " . $this->User->name;
        } else {
            return "ERROR - NOT WORKING";
        }
     }

    protected function register(){
        if ($this->method == 'POST' && array_key_exists("name",$this->request)) {
            $user = new user();
            $retVal = $user->registerAccount($this->request['name'], $this->request['pwd']);
            if (array_key_exists("email",$this->request)){
                $user->updateInfo($this->request['email'], $this->request['phone']);
            }
            echo $user->login($this->request['name'], $this->request['pwd']);
        } else {
            return "ERROR - NOT WORKING";
        }
     }

 }