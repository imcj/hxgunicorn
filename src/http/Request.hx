package http;
import haxe.io.Input;

class Request extends Parser
{
	static public var factory : IMessageFactory = new MessageFactory ( );
	
	public function new ( socketInput : Input, config : Config) 
	{
		super ( factory, socketInput, config );
	}
	
}