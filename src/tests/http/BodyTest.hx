package tests.http;
import errors.StopIteration;
import haxe.io.Bytes;
import haxe.unit.TestCase;
import io.Reader;

class BodyTest extends TestCase
{	
	//public function assert_readline ( payload : String, size : Int, expected ) : Void
	//{
		//body = Body(StringIO(payload))
		//assertEquals(body.readline(size), expected)
	//}
//
	//public function test_readline_empty_body ( ) : Void
	//{
		//assert_readline("", None, "")
		//assert_readline("", 1, "")
	//}
//
	//public function test_readline_zero_size ( ) : Void
	//{
		//assert_readline("abc", 0, "")
		//assert_readline("\n", 0, "")
	//}
//
	//public function test_readline_new_line_before_size ( ) : Void
	//{
		//body = Body(StringIO("abc\ndef"))
		//assertEquals(body.readline(4), "abc\n")
		//assertEquals(body.readline ( ), "def")
	//}
//
	//public function test_readline_new_line_after_size ( ) : Void
	//{
		//body = Body(StringIO("abc\ndef"))
		//assertEquals(body.readline(2), "ab")
		//assertEquals(body.readline ( ), "c\n")
	//}
//
	//public function test_readline_no_new_line ( ) : Void
	//{
		//body = Body(StringIO("abcdef"))
		//assertEquals(body.readline ( ), "abcdef")
		//body = Body(StringIO("abcdef"))
		//assertEquals(body.readline(2), "ab")
		//assertEquals(body.readline(2), "cd")
		//assertEquals(body.readline(2), "ef")
	//}
//
	//public function test_readline_buffer_loaded ( ) : Void
	//{
		//reader = StringIO("abc\ndef")
		//var body : IReader = Body(reader)
		//body.read(1)
		//reader.write("g\nhi")
		//reader.seek(7)
		//assertEquals(body.readline ( ), "bc\n")
		//assertEquals(body.readline ( ), "defg\n")
		//assertEquals(body.readline ( ), "hi")
	//}
//
	//public function test_readline_buffer_loaded_with_size ( ) : Void
	//{
		//body = Body(StringIO("abc\ndef"))
		//body.read(1)
		//assertEquals(body.readline(2), "bc")
		//assertEquals(body.readline(2), "\n")
		//assertEquals(body.readline(2), "de")
		//assertEquals(body.readline(2), "f")
	//}
}