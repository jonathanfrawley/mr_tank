import MtEvent;
import MtEventType;
import MtConstants;

class MtRightPressedEvent extends MtEvent
{
	private var m_Player:MtPlayerConstant;

	public function new(player:MtPlayerConstant)
	{
		m_Player = player;
		m_Type = MT_EVENT_RIGHTPRESSED;
	}

	public function getPlayer():MtPlayerConstant
	{
		return m_Player;
	}
}
