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

class TankHumanGameView extends BaseGameView
{
	private var m_ActorId : ActorId;

	public function new()
	{
		super();
		m_ActorId = -1;
	}

	public override function Init() : Bool
	{
		var eventListener : IEventListener = new TankHumanGameViewListener(this);
		ListenToTankGameViewEvents(eventListener);	

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

}
