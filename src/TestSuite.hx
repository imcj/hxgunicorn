package ;
import haxe.io.Bytes;
import haxe.unit.TestRunner;
import tests.http.BodyTest;

class TestSuite 
{

	static public function main ( ) 
	{
		var runner : TestRunner = new TestRunner ( );
		//runner.add ( new BodyTest ( ) );
		runner.add ( new tests.io.StringIOTest ( ) );

		runner.run ( );
	}
	
}