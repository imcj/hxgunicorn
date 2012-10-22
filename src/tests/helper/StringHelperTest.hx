package tests.helper;
import haxe.unit.TestCase;
import helper.StringHelper;

class StringHelperTest extends TestCase
{
	public function testStrip ( ) 
	{
		assertEquals ( "abc", StringHelper.strip ( " abc " ) );
	}
	
	public function testLStrip ( ) 
	{
		assertEquals ( "abc ", StringHelper.lstrip ( " abc " ) );
	}
	
	public function testRStrip ( ) 
	{
		assertEquals ( " abc", StringHelper.rstrip ( " abc " ) );
	}
	
}