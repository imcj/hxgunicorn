package tests.io;
import haxe.unit.TestCase;
import io.StringIO;


class StringIOTest extends TestCase
{
	function assertRead ( payload : String, size : Int, excepted : String )
	{
		var body : StringIO = new StringIO ( payload );
		assertEquals ( body.read ( size ), excepted );
	}
	
	function assertReadline ( payload : String, size : Int, excepted : String )
	{
		var body : StringIO = new StringIO ( payload );
		assertEquals ( body.readline ( size ), excepted );
	}
	
	public function testRead ( )
	{
		var b : StringIO = new StringIO ( "abc" );
		assertEquals ( "abc", b.read ( 3 ) );
	}
	
	public function testReadEmptyBody ( )
	{
		assertRead ( "", null, "" );
		assertRead ( "", 1, "" );
	}
	
	public function testReadZeroSize ( )
	{
		assertRead ( "a", 0, "" );
	}
	
	public function testReadBufferLoaded ( )
	{
		var buf : StringIO = new StringIO ( "abc" );
		buf.position = 2;
		buf.writeUTF ( "e" );
		buf.position = 0;
		assertEquals ( "abce", buf.read ( 4 ) );
	}
	
	public function testReadline ( )
	{
		var body : StringIO = new StringIO ( "abc\nd" );
		assertEquals ( "abc\n", body.readline ( 4 ) );
		assertEquals ( "d", body.readline ( 1 ) );
	}
	
	public function testReadlineEmptyBody ( )
	{
		assertReadline ( "", null, "" );
		assertReadline ( "", 1, "" );
	}
	
	public function testReadlineNewLineBeforeSize ( )
	{
		var body : StringIO = new StringIO ( "abc\ndef" );
		assertEquals ( "abc\n", body.readline ( 4 ) );
		assertEquals ( "def", body.readline ( ) );
	}
	
	public function testReadlineNewLineAfterSize ( )
	{
		var body : StringIO = new StringIO ( "abc\ndef" );

		assertEquals ( "ab", body.readline ( 2 ) );
		assertEquals ( "c\n", body.readline ( ) );
	}
	
	public function testReadlineZeroSize ( )
	{
		assertReadline ( "a", 0, "" );
	}
	
	public function testReadlineNoNewLine ( )
	{
		var body : StringIO = new StringIO ( "abcdef" );
		assertEquals ( "abcdef", body.read ( ) );
		body.position = 0;
		assertEquals ( "ab", body.read ( 2 ) );
		assertEquals ( "cd", body.read ( 2 ) );
		assertEquals ( "ef", body.read ( 2 ) );
	}
	
	public function testReadlineBufferLoaded ( )
	{
		var body : StringIO = new StringIO ( "abc\ndef" );
		body.writeUTF ( "g\nhi" );
		body.position = 0;
		body.read ( 1 ); 
		assertEquals ( "bc\n", body.readline ( ) );
		assertEquals ( "defg\n", body.readline ( ) );
		assertEquals ( "hi", body.readline ( ) );
	}
	
	public function testReadlineBufferLoadedWithSize ( )
	{
		var body : StringIO = new StringIO ( "abc\ndef" );
		body.read ( 1 );
		assertEquals ( "bc", body.readline ( 2 ) );
		assertEquals ( "\n", body.readline ( 2 ) );
		assertEquals ( "de", body.readline ( 2 ) );
		assertEquals ( "f",  body.readline ( 2 ) );
	}
}