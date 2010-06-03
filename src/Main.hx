
/*
import MtStage;
import MtStageConstants;
import MtGraphicsHandler;
*/
import MtGameApp;

class Main 
{
    static function main() 
	{
		var gameApp = new MtGameApp();

         // creates a TextField         
         var tf = new flash.text.TextField();
         tf.text = "Hello World !";
         // add it to the display list
         flash.Lib.current.addChild(tf);
		if( gameApp.init() )
		{
			gameApp.mainLoop();
/*
			while(gameApp.mainLoop())
			{
			}
*/
		}

    }    
}

