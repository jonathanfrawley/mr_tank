
import StageConstants;

import flash.display.Shape;

class BackgroundGraphics 
{

	public function new()
	{
	}

	public function draw(stage:Stage, mc:flash.display.MovieClip) 
	{
		var background:Shape = new Shape();

        background.graphics.beginFill(0x8B4513);
		background.graphics.moveTo(0,0);
		background.graphics.lineTo(StageConstants.SCREEN_WIDTH,0);
		background.graphics.lineTo(StageConstants.SCREEN_WIDTH,StageConstants.SCREEN_HEIGHT);
		background.graphics.lineTo(0,StageConstants.SCREEN_HEIGHT);
		background.graphics.lineTo(0,0);

		mc.addChild(background);
	}    
}
