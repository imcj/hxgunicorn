package http;
import http.unreader.Unreader;

class MessageFactory implements IMessageFactory
{
	public function new ( )
	{
		
	}
	
	public function create ( config : Config, unreader : Unreader  ) : Message
	{
		return new Message ( );
	}
}