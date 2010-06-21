
import MtStage;
import MtStageGraphics;
import MtBackgroundGraphics;
import MtEvent;
import MtEventListener;
import MtEventType;
import MtGameLoadedEvent;
import MtEventManager;
import MtTankGraphics;

class MtGraphicsHandler implements MtEventListener
{
//	private var m_StageRef : MtStage;
	private var m_BackgroundGraphics : MtBackgroundGraphics;
	private var m_StageGraphics : MtStageGraphics;
	private var m_MovieClip : flash.display.MovieClip;
//	private var m_PlayerTank:MtTank;
	private var m_TankGraphics:MtTankGraphics;
 
	public function new()
	{
		m_BackgroundGraphics = new MtBackgroundGraphics();
		m_StageGraphics = new MtStageGraphics();
        m_MovieClip = flash.Lib.current;
		//m_StageRef=null;
		m_TankGraphics = new MtTankGraphics();
	}

	public function getName():String
	{
		return "GraphicsHandler";
	}

	public function init() : Bool
	{
//		MtEventManager.getInstance().addListener(this);
		m_BackgroundGraphics.init();
		return true;
	}

	public function display()
	{
		m_BackgroundGraphics.draw(m_MovieClip);
		m_StageGraphics.draw(m_MovieClip);
		m_TankGraphics.draw(m_MovieClip);
	}

	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType()==MT_EVENT_GAMELOADED)
		{
			var gameLoadedEvent : MtGameLoadedEvent = cast event;
//			m_StageRef = gameLoadedEvent.getStage();
			m_StageGraphics.init(gameLoadedEvent.getStage());
		}
		else if(event.getType()==MT_EVENT_TANKCREATED)
		{
			var tankCreatedEvent : MtTankCreatedEvent = cast event;
			//m_PlayerTank = tankCreatedEvent.getTank();	
			m_TankGraphics.init(tankCreatedEvent.getTank());
		}
		return true;
	}
}


