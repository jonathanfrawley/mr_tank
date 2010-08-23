
import flash.events.MouseEvent;

import MtGraphicsHandler;
import MtEventManager;
import MtStage;
import MtGameLoadedEvent;
import MtStageConstants;
import MtEvent;
import MtIOHandler;
import MtEventType;
import MtBaseGame;
import JfVector2;
import MtPhysicsHandler;
import MtEvent;

class MtGameLogic extends MtBaseGame, implements MtEventListener
{
	private var m_GraphicsHandler : MtGraphicsHandler;
	private var m_PhysicsHandler : MtPhysicsHandler;
	private var m_AIHandler : MtAIHandler;
	private var m_IsFinished : Bool;
	private var m_IOHandler : MtIOHandler;
	private var m_LifeTime : Float; // How long game has been in session;
	private var m_StartPosition : JfVector2;
	private var loopCnt:Int;
	private var m_HealthBars:List<MtHealthBar>;
/*
	static public var TEMP:Float = -1;

	public static function setTEMP(t:Float)
	{
		TEMP = t;
	}
*/


	public function new()
	{
		super();
		m_GraphicsHandler = new MtGraphicsHandler();
		m_IsFinished = false;
		m_IOHandler = new MtIOHandler();
		m_PhysicsHandler = new MtPhysicsHandler();
		m_AIHandler = new MtAIHandler();

		m_HealthBars = new List<MtHealthBar>();
		loopCnt = 0;
	}

	public function init() : Bool
	{
		m_GraphicsHandler.init();
		m_IOHandler.init();
		m_PhysicsHandler.init();
		m_AIHandler.init();

		addListeners();
		setupLevel();

		return true;
	}

	public function addListeners()
	{
		//Add all listeners
		MtEventManager.getInstance().addListener(m_GraphicsHandler);
		MtEventManager.getInstance().addListener(m_IOHandler);
		MtEventManager.getInstance().addListener(m_PhysicsHandler);
		MtEventManager.getInstance().addListener(m_AIHandler);
		MtEventManager.getInstance().addListener(this);
	}

	public function setupLevel(levelNum:Int=0)
	{
		if (levelNum==0)
		{
			//Setup initial Level
			var playerTank = new MtTank(40,40);
			MtEventManager.getInstance().queueEvent(new MtTankCreatedEvent(playerTank));
			MtEventManager.getInstance().queueEvent(new MtGameLoadedEvent(new MtStage( MtStageConstants.SCREEN_WIDTH-20, MtStageConstants.SCREEN_HEIGHT-20)));

			MtEventManager.getInstance().queueEvent(new MtEnemyTankCreatedEvent(new MtTank(160,160)));

			var playerHealthBar = new MtHealthBar(playerTank);
			m_HealthBars.add(playerHealthBar);
			MtEventManager.getInstance().queueEvent(new MtHealthBarCreatedEvent(playerHealthBar));
		}
	}

	public function mainLoop() : Bool
	{
		if( m_IsFinished )
		{
			return false;
		}

		if( ! MtEventManager.getInstance().tick() )
		{
			return false;
		}

		m_AIHandler.step();
		m_PhysicsHandler.step(1.0); //TODO : Adaptive timestep
		m_GraphicsHandler.display();

		m_IOHandler.poll();
/*
		if(TEMP != -1)
		{
			trace("Hi" + TEMP);
			TEMP = -1;
		}
*/
//		trace("Hi" + flash.events.MouseEvent.stageX(1,null));
		//loopCnt = loopCnt + 1;
		//trace("Hi"+ loopCnt);

		return true;
	}

	public function getName():String
	{
		return "MtGameLogic";
	}
	
	
	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType() == MT_EVENT_GAMEEND)
		{
			m_IsFinished = ! m_IsFinished;
		}
		else if(event.getType() == MT_EVENT_TANK_BULLET_COLLISION)
		{
			var event : MtTankBulletCollisionEvent = cast event;
			var tank = event.getTank();	
			for(healthBar in m_HealthBars)
			{
				if(tank == healthBar.getTank())
				{
					healthBar.registerHit();
				}
			}
		}
		return true;
	}
	
}
