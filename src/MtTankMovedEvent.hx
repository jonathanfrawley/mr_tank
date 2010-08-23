import MtEvent;
import MtEventType;

class MtTankMovedEvent extends MtEvent
{
	private var m_Tank:MtTank;
	private var m_Dir:Float;

	public function new(tank:MtTank, movementDir:Float)
	{
		m_Type = MT_EVENT_TANKMOVED;
		m_Tank = tank;
		m_Dir = movementDir;
	}

	public function getTank()
	{
		return m_Tank;
	}

	public function getDir()
	{
		return m_Dir;
	}
}
