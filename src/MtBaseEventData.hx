
import MtEventData;
import MtEventType;

class MtBaseEventData implements MtEventData
{
	protected var m_TimeStamp : Float;

	public function new ( timeStamp = 0.0f:Float )
	{
		m_TimeStamp = timeStamp;
	}

	public function getEventType() : MtEventType;
	
	public function getTimeStamp():Float
	{
		return m_TimeStamp;
	}
};

