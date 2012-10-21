package http;
import errors.StopIteration;
import haxe.io.Input;
import http.unreader.SocketUnreader;
import http.unreader.Unreader;

class Parser 
{
	var factory : IMessageFactory;
	var config : Config;
	var unreader : Unreader;
	var message : Message;
	
	public function new (  factory : IMessageFactory, cfg : Config, socketInput : Input ) 
	{
		this.factory = factory;
		this.config = cfg;
		this.unreader = new SocketUnreader ( socketInput );
		this.message = null;

	}
	
	public function next ( ) : Message
	{
		var data : String;
		
		if ( null != message )
			if ( message.shouldClose )
				throw new StopIteration ( );
		
		// Discard any unread body of the previous message
		if ( null != message ) {
		}
		
		message = factory.create ( this.config, this.unreader );
		
		if ( null == message )
			throw new StopIteration ( );
			
		return message;
	}
}