package io;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import haxe.io.BytesData;
import haxe.Stack;

class StringIO implements Reader, implements Writer
{
	var buf : BytesBuffer;
	
	public var position ( getPosition, setPosition ) : Int;
	var _position : Int;
	
	public var length ( getLength, null ) : Int;
	var _length : Int;
	
	var bytes : Bytes;
	
	public function new ( ?string : String ) 
	{
		buf = new BytesBuffer( );
		buf.add ( Bytes.ofString ( string ) );
		_position = 0;
		_length = string.length;
		bytes = buf.getBytes ( );
	}
	
	public function read ( ?size : Int ) : String
	{
		size = if ( null == size || size > _length ) _length else size;
		if ( size > _length - _position )
			size = _length - _position;
			
		if ( 0 == size )
			return "";
		
		var ret : String = bytes.readString ( _position, size );
		_position += size;
		return ret;
	}
	
	public function readline ( ? size : Int ) : String
	{
		var chunkSize : Int = 1024;
		var size : Int = if ( size > chunkSize ) chunkSize else size;
		if ( size > _length - _position ) {
			size = _length - _position;
		}
		var chunk : String;
		var result : String = "";
		var old : Int;
		var newLine : Int;
		var i : Int = 0;
		
		if ( size == 0 )
			return "";
			
		while ( true ) {
			i++;
			if ( i > 10 )
				return "";
			
			
				
			old = position;
			chunk = read ( size );
			newLine = chunk.indexOf ( "\n" );
			
			if ( newLine > -1 ) {
				_position = old + newLine + 1;
				result += chunk.substring ( 0, newLine + 1 );
				
				break;
			}
			
			result += chunk;
			
			if ( _position == _length )
				break;
				
			if ( size < chunkSize )
				break;
		}
		
		return result;
	}
	
	function getLength ( ) : Int
	{
		return _length;
	}
	
	function getPosition ( ) : Int
	{
		return _position;
	}
	
	function setPosition ( value : Int ) : Int
	{
		_position = value;
		return value;
	}
	
	public function writeUTF ( string : String ) : Void
	{
		try {
			buf.add ( Bytes.ofString ( string ) );
		} catch ( error : Dynamic ) {
			var copy : Bytes = Bytes.ofString ( bytes.readString ( 0, bytes.length ) + string );
			buf = new BytesBuffer ( );
			buf.add ( copy );
			bytes = copy;
		}
		_position += string.length;
		_length += string.length;
	}
}