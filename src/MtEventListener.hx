
import MtEvent;

interface MtEventListener
{

	public function getName():String;

	/*
	 *--------------------------------------------------------------------------------------
	 *      Method:  handleEvent
	 * Description:  Returns true if consumes event, false otherwise.
	 *--------------------------------------------------------------------------------------
	 */
	public function handleEvent( event:MtEvent ) : Bool; 

}
