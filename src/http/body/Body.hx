package http.body;
import errors.StopIteration;
import io.Reader;
import nme.utils.ByteArray;

class Body 
{
	var reader : Reader;
	var buf : ByteArray;
	
	public function new ( reader : IReader ) 
	{
		this.reader = reader;
		this.buf = new ByteArray ( );
	}
	
	public function next ( ) : String
	{
		var ret : String = readline ( );
		if ( 0 == ret.length )
			throw new StopIteration ( );
			
		return ret;
	}
	
	public function getsize ( ) : UInt
	{
		
	}
	
	public function read ( ?size : Int ) : String
	{
		
	}
	
	public function readline ( ?size : Int ) : String
	{
		
	}
	
	public function readlines ( ?size : Int ) : String
	{
		
	}
}