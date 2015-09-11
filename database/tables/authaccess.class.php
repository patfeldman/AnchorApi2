<?php 
class authaccess extends genericTable{
	const DB_TABLE_NAME = 'authaccess'; 
	const DB_UNIQUE_ID = 'accessId'; 
	const TOKEN_LENGTH = 20; 
	
	public function __construct(){
		parent::__construct(authaccess::DB_TABLE_NAME, authaccess::DB_UNIQUE_ID);
	}

	public function generateToken($userId, $ipAddress=''){
		$this->set_variable('userId', $userId);
		$this->delete();

		$token = authaccess::getRandomToken(authaccess::TOKEN_LENGTH);
		$this->set_variable('userId', $userId);
		$this->set_variable('authToken', $token);
		$this->set_variable('date', gmdate("Y-m-d H:i:s"));
		$this->set_variable('ipAddress', $ipAddress);
		$this->createNew();

		return $token;
	}

	public static function VerifyKey($key, $origin){

	}
	// static public function randomToken() {
	// 	return md5(uniqid(rand(), true));
	// }		

	static public function getRandomToken($length)
	{
	    $token = "";
	    $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    $codeAlphabet.= "abcdefghijklmnopqrstuvwxyz";
	    $codeAlphabet.= "0123456789";
	    $max = strlen($codeAlphabet) - 1;
	    for ($i=0; $i < $length; $i++) {
	        $token .= $codeAlphabet[authaCcess::crypto_rand_secure(0, $max)];
	    }
	    return $token;
	}
	static private function crypto_rand_secure($min, $max)
	{
	    $range = $max - $min;
	    if ($range < 1) return $min; // not so random...
	    $log = ceil(log($range, 2));
	    $bytes = (int) ($log / 8) + 1; // length in bytes
	    $bits = (int) $log + 1; // length in bits
	    $filter = (int) (1 << $bits) - 1; // set all lower bits to 1
	    do {
	        $rnd = hexdec(bin2hex(openssl_random_pseudo_bytes($bytes)));
	        $rnd = $rnd & $filter; // discard irrelevant bits
	    } while ($rnd >= $range);
	    return $min + $rnd;
	}


}