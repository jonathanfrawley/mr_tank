
import MtStage;
import MtStageGraphics;
import MtBackgroundGraphics;
import MtEvent;
import MtEventListener;
import MtEventType;
import MtGameLoadedEvent;
import MtEventManager;

class MtGraphicsHandler implements MtEventListener
{
	private var m_MtStageRef : MtStage;
	private var m_MtBackgroundGraphics : MtBackgroundGraphics;
	private var m_MtStageGraphics : MtStageGraphics;
	private var m_MovieClip : flash.display.MovieClip;
 
	public function new()
	{
		m_MtBackgroundGraphics = new MtBackgroundGraphics();
		m_MtStageGraphics = new MtStageGraphics();
        m_MovieClip = flash.Lib.current;
		m_MtStageRef=null;
	}

	public function getName():String
	{
		return "GraphicsHandler";
	}

	public function init() : Bool
	{
//		MtEventManager.getInstance().addListener(this);
		return true;
	}

	public function setMtStage(m_stage:MtStage)
	{
		m_MtStageRef = m_stage;
	}

	public function display()
	{
		m_MtBackgroundGraphics.draw(m_MovieClip);
		if( m_MtStageRef != null)
		{
			m_MtStageGraphics.draw(m_MtStageRef, m_MovieClip);
		}
	}

	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType()==MT_EVENT_GAMELOADED)
		{
//			var tmp : Dynamic = event;
			var gameLoadedEvent : MtGameLoadedEvent = cast event;
		//	var gameLoadedEventData : MtGameLoadedEventData;
			try {
//				gameLoadedEvent = tmp;
		//		tmp = gameLoadedEvent.getData();
		//		gameLoadedEventData = tmp;
				setMtStage(gameLoadedEvent.getStage());
			} catch( msg : String ) {
				trace("Error occurred: " + msg);
			}
		}
		return true;
	}
}


