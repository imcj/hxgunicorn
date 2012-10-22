package helper;

class StringHelper 
{

	static public function strip ( s : String ) : String
	{
		return lstrip ( rstrip ( s ) );
	}
	
	static public function lstrip ( s : String ) : String
	{
		return ~/^[\t\n\r ]*/i.replace ( s, "" );
	}
	
	static public function rstrip ( s : String ) : String
	{
		return ~/[\t\n\r ]*$/i.replace ( s, "" );
	}
}