package tests;
import haxe.io.Bytes;
import haxe.io.BytesInput;
import haxe.unit.TestCase;
import http.Message;
import http.MessageFactory;
import http.Parser;

class ParserTest extends TestCase
{
	public function testParser ( )
	{
		var parser : Parser = new Parser ( new MessageFactory ( ), new Config ( ), new BytesInput ( Bytes.ofString ( "123" ), 0, 3 ) );
		var message : Message = parser.next ( );
		
		assertTrue ( Std.is ( message, Message ) );
	}
	
}