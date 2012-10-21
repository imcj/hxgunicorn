package http.unreader;
import errors.NotImplementedError;
import io.StringIO;

class Unreader
{
	var buf : StringIO;
	
	public function new ( ) 
	{
		buf = new StringIO ( "" );
	}
	
	public function chunk ( ) : String
	{
		throw new NotImplementedError ( );
		return null;
	}
	
	public function read ( ?size : Int ) : String
	{
		var bufferIsNotEmpty : Bool;
		var c : String;
		var ret : String;
		
		if ( 0 == size )
			return "";
		if ( 0 > size )
			size = null;
		
		bufferIsNotEmpty = null == size && this.buf.length > 0;
		if ( bufferIsNotEmpty ) {
			ret = buf.read ( buf.length );
			buf.clear ( );
			return ret;
		}
		
		if ( null == size )
			return this.chunk ( );
		
		// buffer not enough
		// read the content of the specified length
		while ( buf.length < size ) {
			c = chunk ( );
			if ( 0 == c.length ) {
				ret = buf.read ( buf.length );
				buf.clear ( );
				return ret;
			}
			buf.writeUTF ( c );
		}
		buf.position = 0;
		ret = buf.read ( buf.length );
		buf.clear ( );
		buf.writeUTF ( ret.substr ( size ) );
		buf.position = 0;

		return ret.substr ( 0, size );
	}
	
	public function unread ( data : String ) : Void
	{
		buf.writeUTF ( data );
	}
}