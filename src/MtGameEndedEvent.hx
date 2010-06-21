
import MtEvent;
import MtEventType;

class MtGameEndedEvent extends MtEvent
{
	public function new()
	{
		m_Type = MT_EVENT_GAMEEND;
	}
}
