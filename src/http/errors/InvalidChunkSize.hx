package http.errors;

class InvalidChunkSize
{
	public var data : String;
	
	public function new ( data : String ) 
	{
		this.data = data;
	}
	
	public function toString ( ) : String
	{
		return "Invalid chunk size: " + data;
	}
	
}