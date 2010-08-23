import MtEventType;

class MtHealthBarCreatedEvent extends MtEvent
{
	private var m_HealthBar : MtHealthBar;

	public function new(healthBar:MtHealthBar)
	{
		m_Type = MT_EVENT_HEALTH_BAR_CREATED;
		m_HealthBar = healthBar;	
	}

	public function getHealthBar()
	{
		return m_HealthBar;
	}
}
