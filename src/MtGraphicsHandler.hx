
import MtStage;
import MtStageGraphics;
import MtBackgroundGraphics;

class MtGraphicsHandler
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
	}

	public function init() : Bool
	{
		return true;
	}

	public function setMtStage(m_stage:MtStage)
	{
		m_MtStageRef = m_stage;
	}

	public function display()
	{
		m_MtBackgroundGraphics.draw(m_MtStageRef, m_MovieClip);
		m_MtStageGraphics.draw(m_MtStageRef, m_MovieClip);
	}
}


