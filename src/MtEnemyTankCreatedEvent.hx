
import MtEvent;
import MtEventType;
import MtTank;

class MtEnemyTankCreatedEvent extends MtEvent
{
	private var m_Tank : MtTank;

	public function new(tank:MtTank)
	{
		m_Type = MT_EVENT_ENEMYTANKCREATED;
		m_Tank = tank;
	}
		
	public function getTank():MtTank
	{
		return m_Tank;
	}
}
