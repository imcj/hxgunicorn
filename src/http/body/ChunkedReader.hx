package http.body;
using helper.StringHelper;

import http.errors.NoMoreData;
import http.Message;
import http.unreader.Unreader;
import io.Reader;
import io.StringIO;
import io.Writer;

class ChunkedReaderIterator
{
	var reader : ChunkedReader;
	
	public function new ( reader : ChunkedReader  )
	{
		this.reader = reader;
	}
	
	function parse_trailers ( data : String ) : Void
	{
		
	}
	
	public function parse_chunked ( ) : String
	{
		
	}
	
	function parse_chunk_size ( ?data : String = null ) : Array
	{
		reader.buffer = new StringIO ( "" );
		if ( null != reader.buffer )
			reader.buffer.writeUTF ( data );
		
		var idx = reader.buffer.value.indexOf ( "\r\n" );
		while idx < 0 {
			getData ( reader.buffer );
			idx = reader.buffer.value.indexOf ( "\r\n" );
		}
		
		data = reader.buffer.value;
		var line = data.substring ( 0, idx );
		var rest_chunk = data.substring ( idx + 2 );
		// TODO split second paramter
		var chunk_size = line.split ( ";" )[0].strip ( );
		
	}
	
	function getData ( buf : Writer ) : Void
	{
		var data = reader.unreader.read ( );
		if ( "" == data )
			throw new NoMoreData ( );
		buf.writeUTF ( data );
	}
}

class ChunkedReader extends AbstractReader
{
	public var buffer : StringIO;
	public var request : Message;
	public var unreader : Unreader;
	
	public function new ( request : Message, unreader : Unreader )
	{
		this.request = request;
		this.parser = parse_chunked ( unreader );
		this.buffer = new StringIO ( "" );
	}

	override public function read(size:Int):String 
	{

	}
}