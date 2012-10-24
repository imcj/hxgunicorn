package http;


class Message 
{
	public var shouldClose ( getShouldClose, null ) : Bool;
	public var trailers : Array<Array<String>>;
	
	public function new() 
	{
	}
	
	function getShouldClose ( ) : Bool
	{
		return false;
	}
	
	public function parseHeaders ( data : String ) : Array<Array<String>>
	{
		return [ [ "", "" ] ];
	}
}