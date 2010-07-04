
import MtEventManager;
import MtEventListener;
import MtEventType;
import MtGameEndedEvent;
import MtConstants;
import MtUpPressedEvent;
import MtUpDepressedEvent;
import MtButtonAPressedEvent;
import MtButtonSPressedEvent;

class MtIOHandler implements MtEventListener
{
	private var m_MovieClip : flash.display.MovieClip;

	private static var FLASH_KEY_A:Int = 65;
	private static var FLASH_KEY_S:Int = 83;

	public function new()
	{
	}

	public function init()
	{
        m_MovieClip = flash.Lib.current;
	}

	public function poll()
	{
		//trace(flash.events.KeyboardEvent.KEY_DOWN);
	}

	public function getName():String
	{
		return "MtIOHandler";
	}

	public function reportKeyDown(event:flash.events.KeyboardEvent)
	{
		if(event.keyCode == flash.ui.Keyboard.ESCAPE)
		{
			MtEventManager.getInstance().trigger(new MtGameEndedEvent());
		}
		else if (event.keyCode == flash.ui.Keyboard.UP)
		{
			MtEventManager.getInstance().trigger(new MtUpPressedEvent(MT_PLAYER_0));
		}
		else if (event.keyCode == flash.ui.Keyboard.DOWN)
		{
			MtEventManager.getInstance().trigger(new MtDownPressedEvent(MT_PLAYER_0));
		}
		else if (event.keyCode == flash.ui.Keyboard.RIGHT)
		{
			MtEventManager.getInstance().trigger(new MtRightPressedEvent(MT_PLAYER_0));
		}
		else if (event.keyCode == flash.ui.Keyboard.LEFT)
		{
			MtEventManager.getInstance().trigger(new MtLeftPressedEvent(MT_PLAYER_0));
		}
		else if (event.keyCode == FLASH_KEY_A)
		{
			MtEventManager.getInstance().trigger(new MtButtonAPressedEvent());
		}
		else if (event.keyCode == FLASH_KEY_S)
		{
			MtEventManager.getInstance().trigger(new MtButtonSPressedEvent());
		}
	}

	public function reportKeyUp(event:flash.events.KeyboardEvent)
	{
		if (event.keyCode == flash.ui.Keyboard.UP)
		{
			MtEventManager.getInstance().trigger(new MtUpDepressedEvent(MT_PLAYER_0));
		}
		else if (event.keyCode == flash.ui.Keyboard.DOWN)
		{
			MtEventManager.getInstance().trigger(new MtDownDepressedEvent(MT_PLAYER_0));
		}
		else if (event.keyCode == flash.ui.Keyboard.RIGHT)
		{
			MtEventManager.getInstance().trigger(new MtRightDepressedEvent(MT_PLAYER_0));
		}
		else if (event.keyCode == flash.ui.Keyboard.LEFT)
		{
			MtEventManager.getInstance().trigger(new MtLeftDepressedEvent(MT_PLAYER_0));
		}
	}

	public function reportMouseDown(event:flash.events.MouseEvent)
	{
		if(event.buttonDown)
		{
			MtEventManager.getInstance().trigger(new MtMBLeftPressedEvent());
		}
	}

	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType()==MT_EVENT_GAMELOADED)
		{
			m_MovieClip.stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN,reportKeyDown);
			m_MovieClip.stage.addEventListener(flash.events.KeyboardEvent.KEY_UP,reportKeyUp);
			m_MovieClip.stage.addEventListener(flash.events.MouseEvent.MOUSE_DOWN,reportMouseDown);
		}
	
		return true;
	}

}
