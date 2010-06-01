
import MtGraphicsHandler;

class MtEventHandler
{
	private var r_GraphicsHandler : MtGraphicsHandler;

	public function new()
	{
	}

	public function init() : Bool
	{
		return true;
	}

	public function setGraphicsHandlerRef(graphicsHandler:MtGraphicsHandler)
	{
		r_GraphicsHandler = graphicsHandler;
	}

	public function handleEvents():Bool
	{
		return true;
	}

}
