package ;
import haxe.io.Bytes;
import haxe.unit.TestRunner;
import tests.http.BodyTest;
import tests.ParserTest;
import tests.unreader.SocketUnreaderTest;

class TestSuite 
{

	static public function main ( ) 
	{
		var runner : TestRunner = new TestRunner ( );
		//runner.add ( new BodyTest ( ) );
		//runner.add ( new tests.io.StringIOTest ( ) );
		//runner.add ( new SocketUnreaderTest ( ) );
		runner.add ( new ParserTest ( ) );

		runner.run ( );
	}
	
}