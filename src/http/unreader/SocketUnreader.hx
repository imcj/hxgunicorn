package http.unreader;
import haxe.io.Bytes;
import haxe.io.BytesInput;
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
		var last : Int;
		var buf : StringBuf = new StringBuf ( );
		var counter = 0;
		
		try {
			while ( ( last = socketInput.readByte ( ) ) > 0 )
			{
				buf.addChar ( last );
				counter += 1;
				if ( counter > maxChunk )
					break;
			}
		} catch ( e : Eof ) {
			
		}
		return buf.toString ( );
	}
}