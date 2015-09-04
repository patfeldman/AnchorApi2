<?php
	include_once(LOCATION . 'config/project_db_setup.php');
	include_once(LOCATION . "config/constants.php");
	
	function __autoload($className)
	{
		$ar_class_directories = array(LOCATION . 'database/tables/', 
									  LOCATION . 'database/', 
									  LOCATION . 'classes/' 
                                      );
		foreach ($ar_class_directories as $directory)
		{
	        if(file_exists($directory.$className.'.class.php') ){
				require_once $directory.$className.'.class.php';
				return;
			}
		}
	}
	
