package http.unreader;
import haxe.io.Eof;
import haxe.io.Input;

class SocketUnreader extends Unreader
{
	var socketInput : Input;
	var maxChunk : Int;
	
	public function new ( socketInput : Input, maxChunk : Int = 8192 ) 
	{
		this.socketInput = socketInput;
		this.maxChunk = maxChunk;
		
		super ( );
	}
	
	override public function chunk ( ) : String 
	{
		var data : String = "";
		var buf : String;
		while ( true ) {
			try {
				buf  = socketInput.readLine ( );
			} catch ( e : Eof ) {
				return data;
			}
			data += buf;
			if ( 0 == buf.length )
				break;
			if ( data.length >= maxChunk )
				break;
		}
		
		return data;
	}
}