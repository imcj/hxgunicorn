package http;


class Message 
{
	public var shouldClose ( getShouldClose, null ) : Bool;
	
	public function new() 
	{
	}
	
	function getShouldClose ( ) : Bool
	{
		return false;
	}
}