
import MtEventListener;
import MtEvent;

class MtEventSnooper implements MtEventListener
{

	public function new()
	{
	}

	public function getName():String
	{
		return "Snoop";
	}

	public function handleEvent( MtEvent event ) : Bool
	{
		Log.trace("Snooping an event");
	}
}
