import MtEventType;

class MtAIHandler implements MtEventListener
{
	private var m_PlayerTank:MtTank;
	private var m_EnemyTanks:List<MtTank>;

	public function new()
	{
		m_EnemyTanks = new List();
	}

	public function init():Bool
	{
		return true;
	}

	public function step()
	{
	}

	public function getName():String
	{
		return "AIHandler";
	}

	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType()==MT_EVENT_TANKCREATED)
		{
			var tankCreatedEvent : MtTankCreatedEvent = cast event;
			m_PlayerTank = tankCreatedEvent.getTank();	
		}
		else if(event.getType()==MT_EVENT_ENEMYTANKCREATED)
		{
			var event : MtEnemyTankCreatedEvent = cast event;
			m_EnemyTanks.add(event.getTank());	
		}
		return true;
	}
}
