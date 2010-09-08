
import JfCore;

class MtHealthBar
{
	private var m_MaximumHealth:JfReal;
	private var m_Health:JfReal;
	private var m_Tank:MtTank;

	public function new(tank:MtTank)
	{
		m_MaximumHealth = 100;
		m_Health = 100;
		m_Tank = tank;
	}

	public function registerHit()
	{
		if(m_Health > 0)
		{
			m_Health -= 10.0;
		}
	}
	
	public function getFullness()
	{
		return (m_Health/m_MaximumHealth);	
	}

	public function getTank()
	{
		return m_Tank;
	}
}