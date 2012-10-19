package io;

interface Reader 
{
	var position ( getPosition, setPosition ) : Int;
	var length ( getLength, null ) : Int;
	
	function read ( ?size : Int ) : String;
	function readline ( ?size : Int ) : String;
}