
import flash.display.Shape;

class MtStageGraphics extends MtInitialisable
{
	var m_Border:Shape;

	public function new()
	{
		m_Border = new Shape();
		m_IsInit = false;
	}
	
	public function init(stage:MtStage)
	{
		//Draw background m_Border
		m_Border.graphics.moveTo(0,0);
		m_Border.graphics.lineStyle(1.0,1);
		m_Border.graphics.beginFill(0xFFFFFF);
		var xStart = stage.getPos().getX();
		var yStart = stage.getPos().getY();
		var width = stage.getWidth();
		var height = stage.getHeight();
		var ellipseWidth = 10.5;
		var ellipseHeight = 10.5;
		m_Border.graphics.drawRoundRect(xStart, yStart, width, height, ellipseWidth, ellipseHeight);
		m_Border.graphics.endFill();
		m_IsInit = true;
	}

	public function draw( mc:flash.display.MovieClip) 
	{
		if(m_IsInit)
		{
			mc.addChild(m_Border);
		}
	}    
}
