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

package mrtank;

import haxe.FastList;

import mrtank.BaseGameLogic;
import mrtank.BaseGameView;
import mrtank.TankGameLogicListener;
import mrtank.IEventListener;
import mrtank.EventType;
import mrtank.GameState;

class TankGameLogic extends BaseGameLogic
{
	private var m_GameViews : FastList<IGameView>;
	private var m_State : GameState;
	
	public function new()
	{
		super();
		m_GameViews = new FastList<IGameView>();
	}

	public override function Init() : Bool
	{
		if(! super.Init() )
		{
			return false;
		}

		var eventListener : IEventListener = new TankGameLogicListener(this);
		ListenToTankGameLogicEvents(eventListener);
		
		EventManager.GetInstance().QueueEvent( new GameStateEvent(MT_GS_Init) );

		//TODO: Other init stuff.
		return true;
	}

	public override function OnAttach( view : IGameView) : Void
	{
		m_GameViews.add(view);
	}

	public override function OnUpdate() : Bool
	{
		for(gameView in m_GameViews)
		{
			gameView.OnUpdate();
		}
		return true;
	}

	public function ListenToTankGameLogicEvents( eventListener : IEventListener ) : Void
	{	
		//TODO:Add appropriate events here.
		EventManager.GetInstance().AddListener(eventListener, MT_EVENT_GameState);
	}
}
