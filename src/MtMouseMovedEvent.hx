import MtEvent;
import MtEventType;

class MtMouseMovedEvent extends MtEvent
{
	private var m_Pos:JfVector2;

	public function new(x:Float, y:Float)
	{
		m_Type = MT_EVENT_MOUSEMOVED;
		m_Pos = new JfVector2(x,y);
	}

	public function getPos():JfVector2
	{
		return m_Pos;
	}
}
