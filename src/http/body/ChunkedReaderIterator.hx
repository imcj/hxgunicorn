package http.body;

import http.Message;
import http.unreader.Unreader;
import http.errors.NoMoreData;
import http.errors.InvalidChunkSize;
import http.errors.ChunkMissingTerminator;
import io.Writer;
import io.StringIO;

using helper.StringHelper;

class ChunkedReaderIterator
{
	var request : Message;
	var unreader : Unreader;
	
	var size : Int;
	var rest : String;

	public function new ( request : Message, unreader : Unreader  )
	{
		this.request = request;
		this.unreader = unreader;
	}
	
	public function next ( ) : String
	{
		var chunks : Array<Dynamic>;
		if ( null == size ) {
			chunks = parseChunkSize ( );
			size = chunks[0];
			rest = chunks[1];
		} else
			parseChunkSize ( rest );
			
		var ret = rest.substring ( 0, size );
		rest = rest.substr ( size );
		
		if ( rest.length < 2 )
			rest += unreader.read ( );
		
		if ( "\r\n" != rest.substr ( 0, 2 ) )
			throw new ChunkMissingTerminator ( rest.substr ( 0, 2 ) );
			
		return ret;
	}
	
	function parseTrailers ( data : String ) : Void
	{
		var buffer = new StringIO ( "" );
		buffer.writeUTF ( data );
		
		var idx = buffer.value.indexOf ( "\r\n\r\n" );
		var done = "\r\n" == buffer.value.substr ( 0, 2 );
		
		while ( idx < 0 && ! done ) {
			getData ( buffer );
			idx = buffer.value.indexOf ( "\r\n\r\n" );
			done = "\r\n" == buffer.value.substr ( 0, 2 );
		}
		
		if ( done ) {
			unreader.unread ( buffer.value.substr ( 0, 2 ) );
			return;
		}
		
		request.trailers = request.parseHeaders ( buffer.value.substr ( 0, idx ) );
		unreader.unread ( buffer.value.substr ( idx + 4 ) );
	}
	
	function parseChunkSize ( ?data : String = null ) : Array<Dynamic>
	{
		var buffer = new StringIO ( "" );
		if ( null != data )
			buffer.writeUTF ( data );
		
		var idx = buffer.value.indexOf ( "\r\n" );
		while ( idx < 0 ) {
			getData ( buffer );
			idx = buffer.value.indexOf ( "\r\n" );
		}
		
		data = buffer.value;

		var line = data.substring ( 0, idx );
		var rest_chunk = data.substring ( idx + 2 );
		// TODO split second paramter
		var chunk_size = line.split ( ";" )[0].strip ( );
		var chunk_size_int;
		
		trace ( "1" );
		chunk_size_int = Std.parseInt ( chunk_size );
		trace ( rest_chunk );
		trace ( "2" );
		
		if ( null == chunk_size_int )
			throw new InvalidChunkSize ( chunk_size );

		if ( 0 == chunk_size_int ) {
			try {
				parseTrailers ( rest_chunk );
			} catch ( e : NoMoreData ) {
				
			}
			
			return [ 0, null ];
		}

		return [ chunk_size_int, rest_chunk ];
	}
	
	function getData ( buf : Writer ) : Void
	{
		var data = unreader.read ( );
		if ( "" == data )
			throw new NoMoreData ( );
		buf.writeUTF ( data );
	}
}