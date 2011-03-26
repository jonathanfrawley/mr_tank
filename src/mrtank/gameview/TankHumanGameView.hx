/**
mr_tank - A tank game written with haXe    
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

package mrtank.gameview;

import mrtank.gameview.BaseGameView;
import mrtank.event.EventType;
import mrtank.actor.ActorId;
import mrtank.event.IEventListener;
import mrtank.event.EventManager;
import mrtank.event.ThrustEvent;
import mrtank.algebra.Vector2;

class TankHumanGameView extends BaseGameView
{
	private static var FLASH_KEY_W:Int = 87;
	private static var FLASH_KEY_A:Int = 65;
	private static var FLASH_KEY_S:Int = 83;
	private static var FLASH_KEY_D:Int = 68;
	
	private var m_ActorId : ActorId;
	private var m_ThrustAmount : Float;
	private var m_Background : BackgroundSceneNode;

	public function new()
	{
		super();
		m_ActorId = -1;
		m_ThrustAmount = 40;
	}

	public override function Init() : Bool
	{
		var eventListener : IEventListener = new TankHumanGameViewListener(this);
		ListenToTankGameViewEvents(eventListener);	

		m_Background = new BackgroundSceneNode();
		
		return true;
	}

	public function ListenToTankGameViewEvents(eventListener : IEventListener) : Void
	{
		EventManager.GetInstance().AddListener(eventListener, MT_EVENT_GameState);
		EventManager.GetInstance().AddListener(eventListener, MT_EVENT_ActorMoved);
	}

	public function SetActor(actorId : ActorId)
	{
		m_ActorId = actorId;
	}

	public function ReportKeyDown(event:flash.events.KeyboardEvent)
	{
		trace(event.keyCode);
		if(event.keyCode == flash.ui.Keyboard.ESCAPE)
		{
			//			EventManager.GetInstance().Trigger(new GameEndedEvent());
		}
		else if (event.keyCode == FLASH_KEY_W)
		{
			EventManager.GetInstance().Trigger(new ThrustEvent(m_ActorId, new Vector2(0, -m_ThrustAmount)));
		}
		else if (event.keyCode == FLASH_KEY_A)
		{
			EventManager.GetInstance().Trigger(new ThrustEvent(m_ActorId, new Vector2(-m_ThrustAmount, 0)));
		}
		else if (event.keyCode == FLASH_KEY_S)
		{
			EventManager.GetInstance().Trigger(new ThrustEvent(m_ActorId, new Vector2(0, m_ThrustAmount)));		
		}
		else if (event.keyCode == FLASH_KEY_D)
		{
			EventManager.GetInstance().Trigger(new ThrustEvent(m_ActorId, new Vector2(m_ThrustAmount, 0)));		
		}
	}

	public function ReportKeyUp(event:flash.events.KeyboardEvent)
	{
		if (event.keyCode == FLASH_KEY_W)
		{
			EventManager.GetInstance().Trigger(new ThrustEvent(m_ActorId, new Vector2(0, 0)));
		}
		else if (event.keyCode == FLASH_KEY_A)
		{
			EventManager.GetInstance().Trigger(new ThrustEvent(m_ActorId, new Vector2(0, 0)));
		}
		else if (event.keyCode == FLASH_KEY_S)
		{
			EventManager.GetInstance().Trigger(new ThrustEvent(m_ActorId, new Vector2(0, 0)));		
		}
		else if (event.keyCode == FLASH_KEY_D)
		{
			EventManager.GetInstance().Trigger(new ThrustEvent(m_ActorId, new Vector2(0, 0)));		
		}
	}

	public override function OnRender() : Bool
	{
		m_Background.OnRender();

		for(node in m_SceneNodes)
		{
			node.OnRender();
		}
		return true;
	}

	public override function OnUpdate() : Bool
	{
		return true;
	}
}
