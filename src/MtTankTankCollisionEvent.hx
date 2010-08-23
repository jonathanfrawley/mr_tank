import MtEventType;

class MtTankTankCollisionEvent extends MtEvent
{
	private var m_Tank0 : MtTank;
	private var m_Tank1 : MtTank;
	
	public function new(tank0:MtTank, tank1:MtTank)
	{
		m_Type = MT_EVENT_TANK_TANK_COLLISION;
		m_Tank0 = tank0;
		m_Tank1 = tank1;
	}
		
	public function getTank0():MtTank
	{
		return m_Tank0;
	}

	public function getTank1():MtTank
	{
		return m_Tank1;
	}

}
