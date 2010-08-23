
import MtEventType;

class MtTankDestroyedEvent extends MtEvent
{
	private var m_Tank:MtTank;

	public function new(tank:MtTank)
	{
		m_Type = MT_EVENT_TANKDESTROYED;
		m_Tank = tank;
	}

	public function getTank()
	{
		return m_Tank;
	}
}
