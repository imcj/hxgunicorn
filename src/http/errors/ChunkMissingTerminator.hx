package http.errors;

class ChunkMissingTerminator 
{
	var term : String;
	
	public function new ( term : String ) 
	{
		this.term = term;
	}
	
	public function toString ( ) : String
	{
		return "Invalid chunk terminator is not '\\r\\n'': " + this.term;
	}
}