
import MtStageConstants;

import flash.display.Shape;

class MtBackgroundGraphics 
{
	private var m_BackgroundShape:Shape;

	public function new()
	{
		m_BackgroundShape = new Shape();
	}

	public function init()
	{
        m_BackgroundShape.graphics.beginFill(0x8B4513);
		m_BackgroundShape.graphics.moveTo(0,0);
		m_BackgroundShape.graphics.lineTo(MtStageConstants.SCREEN_WIDTH,0);
		m_BackgroundShape.graphics.lineTo(MtStageConstants.SCREEN_WIDTH,MtStageConstants.SCREEN_HEIGHT);
		m_BackgroundShape.graphics.lineTo(0,MtStageConstants.SCREEN_HEIGHT);
		m_BackgroundShape.graphics.lineTo(0,0);
	}

	public function draw(mc:flash.display.MovieClip) 
	{
		mc.addChild(m_BackgroundShape);

		//flash.Lib.current.addChild(m_BackgroundShape);
	}    
}
