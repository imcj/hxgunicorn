package tests.unreader;
import haxe.io.Bytes;
import haxe.io.BytesInput;
import haxe.io.Input;
import haxe.unit.TestCase;
import http.unreader.SocketUnreader;
import neko.net.Socket;
import sys.net.Host;

class SocketUnreaderTest extends TestCase
{
	public function testReadBufferIsNotEmpty ( )
	{
		var i : Input = new BytesInput ( Bytes.ofString ( "123" ), 0, 3 );
		var unreader : SocketUnreader = new SocketUnreader ( i );
		assertEquals ( "1", unreader.read ( 1 ) );
		assertEquals ( "23", unreader.read ( ) );
	}
	
	public function testReadBufferIsNotEnough ( )
	{
		var i : Input = new BytesInput ( Bytes.ofString ( "123" ), 0, 3 );
		var unreader : SocketUnreader = new SocketUnreader ( i, 2 );
		assertEquals ( "1", unreader.read ( 1 ) );
		assertEquals ( "23", unreader.read ( 2 ) );
	}
	
	public function testReadChunkIsEmpty ( )
	{
		var i : Input = new BytesInput ( Bytes.ofString ( "12" ), 0, 2 );
		var unreader : SocketUnreader = new SocketUnreader ( i, 2 );
		assertEquals ( "1", unreader.read ( 1 ) );
		assertEquals ( "2", unreader.read ( 1 ) );
	}
}