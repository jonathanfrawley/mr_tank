/**
jfpx - A cross platform physics engine using CUDA    
Copyright (C) 2010 Jonathan Frawley

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
**/

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
			//MtGameLogic.setTEMP(event.localX);
			MtEventManager.getInstance().trigger(new MtMBLeftPressedEvent(event.stageX, event.stageY));
		}
	}

	public function reportMouseMove(event : flash.events.MouseEvent)
	{
		//TODO:Make check to see if mouse has actually moved first.
		MtEventManager.getInstance().queueEvent(new MtMouseMovedEvent(event.stageX, event.stageY));
	}


	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType()==MT_EVENT_GAMELOADED)
		{
			m_MovieClip.stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN,reportKeyDown);
			m_MovieClip.stage.addEventListener(flash.events.KeyboardEvent.KEY_UP,reportKeyUp);
			m_MovieClip.stage.addEventListener(flash.events.MouseEvent.MOUSE_DOWN,reportMouseDown);
			m_MovieClip.stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE,reportMouseMove);
		}
	
		return true;
	}

}
