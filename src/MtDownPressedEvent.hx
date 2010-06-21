
import MtEvent;
import MtEventType;
import MtTank;
import MtConstants;

class MtDownPressedEvent extends MtEvent
{
	private var m_Player:MtPlayerConstant;

	public function new(player:MtPlayerConstant)
	{
		m_Player = player;
		m_Type = MT_EVENT_DOWNPRESSED;
	}

	public function getPlayer():MtPlayerConstant
	{
		return m_Player;
	}
}
