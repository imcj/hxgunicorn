package http.body;
using helper.StringHelper;

import http.errors.InvalidChunkSize;
import http.errors.NoMoreData;
import http.Message;
import http.unreader.Unreader;
import io.Reader;
import io.StringIO;
import io.Writer;

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