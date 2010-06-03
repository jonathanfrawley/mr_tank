
import MtGameLogic;

class MtGameApp
{
	private var m_GameLogic : MtGameLogic;

	public function new()
	{
		m_GameLogic = new MtGameLogic();
	}

	public function init() : Bool
	{
		return m_GameLogic.init();
	}

	public function mainLoop() : Bool
	{
		return m_GameLogic.mainLoop();
	}
}
