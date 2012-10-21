package http;
import haxe.io.Input;
import http.unreader.Unreader;


interface IMessageFactory 
{
	function create ( config : Config, unreader : Unreader  ) : Message;
}