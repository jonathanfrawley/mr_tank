
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
		m_GameLogic.init();
		return true;
	}

	public function mainLoop() : Bool
	{
		return m_GameLogic.mainLoop();
	}
}
