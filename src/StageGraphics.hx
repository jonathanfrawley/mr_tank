
import flash.display.Shape;

class StageGraphics {

	public function new()
	{
	}

	public function draw(stage:Stage, mc:flash.display.MovieClip) 
	{
		var border:Shape = new Shape();

		//Draw background border
		border.graphics.moveTo(0,0);
		border.graphics.lineStyle(1.0,1);
		border.graphics.beginFill(0xFFFFFF);
		var xStart = stage.getX();
		var yStart = stage.getY();
		var width = stage.getWidth();
		var height = stage.getHeight();
		var ellipseWidth = 10.5;
		var ellipseHeight = 10.5;
		border.graphics.drawRoundRect(xStart, yStart, width, height, ellipseWidth, ellipseHeight);
		border.graphics.endFill();

		mc.addChild(border);
	}    
}
