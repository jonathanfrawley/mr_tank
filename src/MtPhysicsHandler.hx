
import MtPhysicsBody;
import MtTank;
import MtEvent;
import MtEventManager;
import MtTankCreatedEvent;
import MtEventType;
import MtUpPressedEvent;
import MtDownPressedEvent;
import MtLeftPressedEvent;
import MtRightPressedEvent;
import MtUpDepressedEvent;
import MtDownDepressedEvent;
import MtLeftDepressedEvent;
import MtRightDepressedEvent;
import MtConstants;
import MtCollisionDetector;
import MtStage;
import MtGameLoadedEvent;

class MtPhysicsHandler implements MtEventListener
{
	private var m_Bodies:List<MtPhysicsBody>;
	private var m_PlayerTank:MtTank;
	private var m_Stage:MtStage;
	
	public function new()
	{
		m_Bodies = new List();
	}

	public function init():Bool
	{
		return true;
	}

	public function step(timeStep:Float)
	{
		for(body in m_Bodies)
		{
			body.step(timeStep);
		}
		//Collision Detection
/*
		if(! MtCollisionDetector.getInstance().circleWithinRectangle(m_PlayerTank,m_Stage))
		{
			trace("Tank outside wall");	
		}
*/
		//trace("Tank outside wall");	

		//Collision Response TODO

	//	m_PlayerTank.setTurretDir(m_PlayerTank.getTurretDir().add(new JfVector2(0,1)));
//		m_PlayerTank.setTurretDir(m_PlayerTank.getTurretDir() + 1);
	}

	public function getName():String
	{
		return "MtPhysicsHandler";
	}

	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType()==MT_EVENT_TANKCREATED)
		{
			var tankCreatedEvent : MtTankCreatedEvent = cast event;
			m_PlayerTank = tankCreatedEvent.getTank();	
			m_Bodies.add(m_PlayerTank);
		}
		else if(event.getType()==MT_EVENT_UPPRESSED)
		{
			var upPressedEvent : MtUpPressedEvent = cast event;
			if(upPressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.upPressed();
			}			
		}
		else if(event.getType()==MT_EVENT_UPDEPRESSED)
		{
			var upDepressedEvent : MtUpDepressedEvent = cast event;
			if(upDepressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.upDepressed();
			}			
		}
		else if(event.getType()==MT_EVENT_DOWNPRESSED)
		{
			var downPressedEvent : MtDownPressedEvent = cast event;
			if(downPressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.downPressed();
			}			
		}
		else if(event.getType()==MT_EVENT_DOWNDEPRESSED)
		{
			var downDepressedEvent : MtDownDepressedEvent = cast event;
			if(downDepressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.downDepressed();
			}			
		}
		else if(event.getType()==MT_EVENT_LEFTPRESSED)
		{
			var leftPressedEvent : MtLeftPressedEvent = cast event;
			if(leftPressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.leftPressed();
			}			
		}
		else if(event.getType()==MT_EVENT_LEFTDEPRESSED)
		{
			var leftDepressedEvent : MtLeftDepressedEvent = cast event;
			if(leftDepressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.leftDepressed();
			}			
		}
		else if(event.getType()==MT_EVENT_RIGHTPRESSED)
		{
			var rightPressedEvent : MtRightPressedEvent = cast event;
			if(rightPressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.rightPressed();
			}			
		}
		else if(event.getType()==MT_EVENT_RIGHTDEPRESSED)
		{
			var rightDepressedEvent : MtRightDepressedEvent = cast event;
			if(rightDepressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.rightDepressed();
			}			
		}
		else if(event.getType()==MT_EVENT_GAMELOADED)
		{
			var gameLoadedEvent : MtGameLoadedEvent = cast event;
			m_Stage = gameLoadedEvent.getStage();
		}
		else if(event.getType()==MT_EVENT_BUTTONAPRESSED)
		{
			m_PlayerTank.setTurretDir(m_PlayerTank.getTurretDir() + Math.PI/8);
		}
		else if(event.getType()==MT_EVENT_BUTTONSPRESSED)
		{
			m_PlayerTank.setTurretDir(m_PlayerTank.getTurretDir() - Math.PI/8);
		}
		return true;
	}

}
