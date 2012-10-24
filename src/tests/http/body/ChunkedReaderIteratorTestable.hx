package tests.http.body;

import http.body.ChunkedReaderIterator;
import http.Message;
import http.unreader.Unreader;

class ChunkedReaderIteratorTestable extends ChunkedReaderIterator
{

	public function new ( request : Message, unreader : Unreader  )
	{
		super ( request, unreader );
	}
	
	public function testParseTrailers ( data : String ) : Void
	{
		this.parseTrailers ( data );
	}
	
	public function testParseChunkSize ( ? data : String ) : Array<Dynamic>
	{
		return this.parseChunkSize ( data );
	}
}