
import MtStageConstants;

import flash.display.Shape;

class MtBackgroundGraphics 
{

	public function new()
	{
	}

	public function draw(stage:MtStage, mc:flash.display.MovieClip) 
	{
		var background:Shape = new Shape();

        background.graphics.beginFill(0x8B4513);
		background.graphics.moveTo(0,0);
		background.graphics.lineTo(MtStageConstants.SCREEN_WIDTH,0);
		background.graphics.lineTo(MtStageConstants.SCREEN_WIDTH,MtStageConstants.SCREEN_HEIGHT);
		background.graphics.lineTo(0,MtStageConstants.SCREEN_HEIGHT);
		background.graphics.lineTo(0,0);

		mc.addChild(background);
	}    
}
