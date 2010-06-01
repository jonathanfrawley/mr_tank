
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

		if( gameApp.init() )
		{
			while(gameApp.mainLoop())
			{
			}
		}

    }    
}

