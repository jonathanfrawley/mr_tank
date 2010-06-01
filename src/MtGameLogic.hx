
import MtGraphicsHandler;
import MtEventHandler;

class MtGameLogic
{
	private var m_GraphicsHandler : MtGraphicsHandler;
	private var m_EventHandler : MtEventHandler;

	public function new()
	{
		m_GraphicsHandler = new MtGraphicsHandler();
		m_EventHandler = new MtEventHandler();
	}

	public function init() : Bool
	{
		m_GraphicsHandler.init();
		m_EventHandler.init();
		m_EventHandler.setGraphicsHandlerRef(m_GraphicsHandler);
		return true;
	}

	public function mainLoop() : Bool
	{
		if( ! m_EventHandler.handleEvents())
		{
			return false;
		}
		m_GraphicsHandler.display();
		return true;
	}

}
