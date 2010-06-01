
import MtEventType;
import MtEventListener;

enum eConstants
{
	kINFINITE = 0xffffffff;
	kNUMQUEUES = 2;
}

interface IMtEventManager
{

	public function addListener(inHandler:MtEventListener, inType:MtEventType) : Bool;
	
	public function delListener(inHandler:MtEventListener, inType:MtEventType ) : Bool;

	public function trigger(inEvent:MtEventData) : Bool;

	public function queueEvent(inEvent:MtEventData) : Bool;

	public function abortEvent(inType:MtEventType, allOfType:Bool) : Bool;

	public function tick(maxMillis:Int=kINFINITE) : Bool;

	public function validateType(inType:MtEventType) : Bool;

	static public function get() : IMtEventManager;
}

typedef List<MtEventListener> MtEventListenerList;
typedef List<MtEventType> MtEventTypeList;

class MtEventManager implements IMtEventManager
{
	private var m_ActiveQueue : Int;
	private var m_Name : String;
	private var m_SetAsGlobal : Bool;
	
	List<MtEventListener> 
	List<MtEventType>

	public function new(pName:String, setAsGlobal:Bool)
	{
		m_ActiveQueue = 0;	
	}

	public function addListener(inHandler:MtEventListener, inType:MtEventType) : Bool
	{
		if(! validateType(inType) )
		{
			return false;
		}

		var

	}
	
	public function delListener(inHandler:MtEventListener, inType:MtEventType ) : Bool;

	public function trigger(inEvent:MtEventData) : Bool
	{
		//TODO
		return false;
	}

	public function queueEvent(inEvent:MtEventData) : Bool;

	public function abortEvent(inType:MtEventType, allOfType:Bool) : Bool;

	public function tick(maxMillis:Int=kINFINITE) : Bool;

	public function validateType(inType:MtEventType) : Bool;

	static public function get() : IMtEventManager;
		

}
