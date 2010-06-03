
import MtGraphicsHandler;
import MtEventManager;
import MtStage;
import MtGameLoadedEvent;
import MtStageConstants;

class MtGameLogic
{
	private var m_GraphicsHandler : MtGraphicsHandler;

	public function new()
	{
		m_GraphicsHandler = new MtGraphicsHandler();
	}

	public function init() : Bool
	{
		m_GraphicsHandler.init();
		MtEventManager.getInstance().addListener(m_GraphicsHandler);
		var stage = new MtStage( MtStageConstants.SCREEN_WIDTH-20, MtStageConstants.SCREEN_HEIGHT-20);
		//MtEventManager.getInstance().queueEvent(new MtGameLoadedEvent(stage));
		MtEventManager.getInstance().trigger(new MtGameLoadedEvent(stage));
		return true;
	}

	public function mainLoop() : Bool
	{
/*
		if( ! MtEventManager.getInstance().tick() )
		{
			return false;
		}
*/

		m_GraphicsHandler.display();
		return true;
	}
}
