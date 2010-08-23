import MtEventType;

class MtAIHandler implements MtEventListener
{
	private var m_PlayerTank:MtTank;
	private var m_EnemyTanks:List<MtTank>;

	public function new()
	{
		m_EnemyTanks = new List<MtTank>();
	}

	public function init():Bool
	{
		return true;
	}

	public function step()
	{
		for(enemyTank in m_EnemyTanks)
		{
			//var dir = enemyTank.getCentrePos().subtract(m_PlayerTank.getCentrePos());
			var dir = m_PlayerTank.getCentrePos().subtract(enemyTank.getCentrePos());
			var dirAngle = Math.atan2(dir.getY(),dir.getX());
			MtEventManager.getInstance().trigger(new MtTankMovedEvent(enemyTank, dirAngle));
		}
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
