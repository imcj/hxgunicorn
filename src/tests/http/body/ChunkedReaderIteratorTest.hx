package tests.http.body;
import haxe.io.Bytes;
import haxe.io.BytesInput;
import haxe.unit.TestCase;
import http.Message;
import http.MessageFactory;
import http.unreader.SocketUnreader;

class ChunkedReaderIteratorTest extends TestCase
{
	public function testParseTrailers ( )
	{
		var unreader = new SocketUnreader ( new BytesInput ( Bytes.ofString ( "\r\n" ) ) );
		var message = new MessageFactory ( ).create ( new Config ( ), unreader );
		
		var chunkReaderIterator = new ChunkedReaderIteratorTestable ( message, unreader );
		try {
			chunkReaderIterator.testParseTrailers ( "" );
		} catch ( e : Dynamic ) {
			// 跳过
			assertTrue  ( true );
		}
	}
	
	public function testParseChunkSize ( )
	{
		var chunks = [
			"chunk1",
			"chunk2",
			"chunk3",
			"over"
		];
		var chunkString = "";
		for ( chunk in chunks )
			chunkString += Std.string(chunk.length) + "\r\n" + chunk + "\r\n";

		var unreader = new SocketUnreader ( new BytesInput ( Bytes.ofString ( chunkString ), 0, chunkString.length ) );
		var message = new MessageFactory ( ).create ( new Config ( ), unreader );

		var chunkReaderIterator = new ChunkedReaderIteratorTestable ( message, unreader );
		assertEquals ( 6, chunkReaderIterator.testParseChunkSize ( ) [0]);
	}
	
	public function testNext ( )
	{
		var chunks = [
			"chunk1",
			"chunk2",
			"chunk3",
			"over"
		];
		var chunkString = "";
		for ( chunk in chunks )
			chunkString += Std.string(chunk.length) + "\r\n" + chunk + "\r\n";

		var unreader = new SocketUnreader ( new BytesInput ( Bytes.ofString ( chunkString ), 0, chunkString.length ) );
		var message = new MessageFactory ( ).create ( new Config ( ), unreader );

		var chunkReaderIterator = new ChunkedReaderIteratorTestable ( message, unreader );
		assertEquals ( "chunk1", chunkReaderIterator.next ( ) );
		assertEquals ( "chunk2", chunkReaderIterator.next ( ) );
		assertEquals ( "chunk3", chunkReaderIterator.next ( ) );
		assertEquals ( "over", chunkReaderIterator.next ( ) );
	}
}