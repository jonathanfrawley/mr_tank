
import Stage;
import StageGraphics;
import StageConstants;
import BackgroundGraphics;

class Main 
{

    static function main() 
	{

        var mc:flash.display.MovieClip = flash.Lib.current;

		var backgroundGraphics = new BackgroundGraphics();
		var stage = new Stage(StageConstants.SCREEN_WIDTH-10, StageConstants.SCREEN_HEIGHT-10, 5, 5);
		var stageGraphics = new StageGraphics();

		backgroundGraphics.draw(stage, mc);
		stageGraphics.draw(stage, mc);
		
/*


        mc.graphics.moveTo(50,50);
        mc.graphics.lineTo(100,50);
        mc.graphics.lineTo(100,100);
        mc.graphics.lineTo(50,100);
        mc.graphics.endFill();

		mc.graphics.lineStyle(1.0,10);
		mc.graphics.moveTo(0,0);
		mc.graphics.drawCircle(100,100,100);
		var roundObject:flash.display.Shape = new flash.display.Shape();
		mc.graphics.lineStyle(1.0,10);
		mc.graphics.beginFill(0xFF0000);
		mc.graphics.moveTo(150, 0);
		mc.graphics.curveTo(300, 0, 300, 50);
		mc.graphics.curveTo(300, 100, 250, 100);
		mc.graphics.curveTo(200, 100, 200, 50);
		mc.graphics.curveTo(200, 0, 250, 0);
		mc.graphics.endFill();
		//this.addChild(roundObject);

		//Draw background border
		mc.graphics.moveTo(0,0);
		mc.graphics.lineStyle(1.0,1);
        mc.graphics.beginFill(0xFFFFFF);
		var xStart = 5.0;
		var yStart = 5.0;
		var width = 390;
		var height = 290;
		var ellipseWidth = 10.5;
		var ellipseHeight = 10.5;
		mc.graphics.drawRoundRect(xStart, yStart, width, height, ellipseWidth, ellipseHeight);
        mc.graphics.endFill();
*/
		

    }    
}

