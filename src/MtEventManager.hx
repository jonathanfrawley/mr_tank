
import MtEvent;
import MtEventListener;
import MtConstants;

class MtEventManager
{
	private var m_Listeners:List<MtEventListener>;
	private var m_Events:List<MtEvent>;
	private static var m_Instance:MtEventManager = new MtEventManager("EventManager");

	private function new(pName:String)
	{
		m_Listeners = new List<MtEventListener>();
		m_Events = new List<MtEvent>();
	}

	public function addListener(inHandler:MtEventListener) : Bool
	{
		m_Listeners.add(inHandler);	
		return true;
	}
	
	public function delListener(inHandler:MtEventListener) : Bool
	{
		m_Listeners.remove(inHandler);
		return true;
	}

	public function trigger(inEvent:MtEvent) : Bool
	{
		for(listener in m_Listeners)
		{
			listener.handleEvent(inEvent);
		}
		return true;
	}

	public function queueEvent(inEvent:MtEvent) : Bool
	{
		m_Events.add(inEvent);
		return true;
	}

	public function removeEvent(inEvent:MtEvent) : Bool
	{
		m_Events.remove(inEvent);
		return true;
	}

	public function tick(maxMillis:Int=0xffffffff) : Bool
	{
		//TODO : impose time limit
		while( ! m_Events.isEmpty())
		{
			var event : MtEvent = m_Events.pop();
			for(listener in m_Listeners)
			{
				listener.handleEvent(event);
			}
		}
		return true;
	}

	static public function getInstance() : MtEventManager
	{
		return m_Instance;
	}
}
