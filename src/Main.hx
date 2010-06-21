
/*
import MtStage;
import MtStageConstants;
import MtGraphicsHandler;
*/
import flash.display.MovieClip;
import flash.events.Event;

import MtGameApp;


class Main 
{
	public static var m_GameApp : MtGameApp;

	static function main() 
	{
		m_GameApp = new MtGameApp();

		if( m_GameApp.init() )
		{
			flash.Lib.current.addEventListener(flash.events.Event.ENTER_FRAME, mainLoop);
/*
			while(m_GameApp.mainLoop())
			{
			}
 */
		}
	}    

	public static function mainLoop(a)
	{
		m_GameApp.mainLoop();
	}
}

