package http.body;
import errors.NotImplementedError;

class AbstractReader 
{

	public function read ( size : Int ) : String
	{
		throw new NotImplementedError ( );
	}
	
}