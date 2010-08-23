
import JfVector2;
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
import MtBullet;

class MtPhysicsHandler implements MtEventListener
{
	private var m_Bodies:List<MtPhysicsBody>;
	private var m_EnemyTanks:List<MtTank>;
	private var m_Bullets:List<MtBullet>;
	private var m_PlayerTank:MtTank;
	private var m_Stage:MtStage;
	
	public function new()
	{
		m_Bodies = new List<MtPhysicsBody>();
		m_Bullets = new List<MtBullet>();
		m_EnemyTanks = new List<MtTank>();
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
			if(MtCollisionDetector.getInstance().bodyWithinRectangle(body, m_Stage))
			{
				body.wallCollisionResponse();	
			}
/*
			if(body.getActorID() != m_PlayerTank.getActorID())
			{
				if(MtCollisionDetector.getInstance().bodyWithinSphere(body, m_PlayerTank))
				{
					trace("Collision with tank");
					MtEventManager.getInstance().queueEvent(new MtTankBulletCollisionEvent(m_PlayerTank, cast body));
				}
			}
*/
		}
		//Collision Detection
		for(bullet in m_Bullets)
		{
			if(MtCollisionDetector.getInstance().bodyWithinSphere(bullet, m_PlayerTank))
			{
				MtEventManager.getInstance().queueEvent(new MtTankBulletCollisionEvent(m_PlayerTank, cast bullet));
			}
			for(enemyTank in m_EnemyTanks)
			{
				if(MtCollisionDetector.getInstance().bodyWithinSphere(bullet, enemyTank))
				{
					MtEventManager.getInstance().queueEvent(new MtTankBulletCollisionEvent(enemyTank, cast bullet));
				}
			}
		}

		//Between enemy tanks and other tanks
		for(enemyTank in m_EnemyTanks)
		{
			if(MtCollisionDetector.getInstance().bodyWithinSphere(m_PlayerTank, enemyTank))
			{
				MtEventManager.getInstance().trigger(new MtTankTankCollisionEvent(m_PlayerTank, enemyTank));
			}
		}

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
		else if(event.getType()==MT_EVENT_MBLEFTPRESSED)
		{
			var event : MtMBLeftPressedEvent = cast event;
			var dir : JfVector2 = event.getPos().subtract(m_PlayerTank.getCentrePos());
			dir.normalize();
			var dirAngle : Float = Math.atan2(dir.getY(),dir.getX());
			var radius : Float = 3; //XXX:Magic number
			
			var startPos:JfVector2 = new JfVector2(m_PlayerTank.getPos().getX() + ((m_PlayerTank.getRadius()+radius) * Math.cos(dirAngle))
													, m_PlayerTank.getPos().getY() + ((m_PlayerTank.getRadius()+radius) * Math.sin(dirAngle)));
			m_PlayerTank.setTurretDir(dirAngle);
			//var bullet = new MtBullet(m_PlayerTank.getPos().getX(), m_PlayerTank.getPos().getY(), m_PlayerTank.getTurretDir(), m_PlayerTank.getRadius(), radius);
			var bullet = new MtBullet(startPos.getX(), startPos.getY(), m_PlayerTank.getTurretDir(), m_PlayerTank.getRadius(), radius);
			m_Bodies.add(bullet);
			m_Bullets.add(bullet);
			MtEventManager.getInstance().trigger(new MtBulletCreatedEvent(bullet));
		}
		else if(event.getType()==MT_EVENT_MOUSEMOVED)
		{
			var event : MtMouseMovedEvent = cast event;
			var dir : JfVector2 = event.getPos().subtract(m_PlayerTank.getCentrePos());
			dir.normalize();
			var dirAngle : Float = Math.atan2(dir.getY(),dir.getX());
			var radius : Float = 3; //XXX:Magic number
			
			var startPos:JfVector2 = new JfVector2(m_PlayerTank.getPos().getX() + ((m_PlayerTank.getRadius()+radius) * Math.cos(dirAngle))
													, m_PlayerTank.getPos().getY() + ((m_PlayerTank.getRadius()+radius) * Math.sin(dirAngle)));
			m_PlayerTank.setTurretDir(dirAngle);
		}
		else if(event.getType()==MT_EVENT_ENEMYTANKCREATED)
		{
			var event : MtEnemyTankCreatedEvent = cast event;
			var tank = event.getTank();
			m_EnemyTanks.add(tank);	
			m_Bodies.add(tank);	
		}
		else if(event.getType()==MT_EVENT_TANKMOVED)
		{
			var event : MtTankMovedEvent = cast event;
			var tank = event.getTank();	
			var dir = event.getDir();
			tank.move(dir);
//			tank.move(0);
		}
		return true;
	}

}
