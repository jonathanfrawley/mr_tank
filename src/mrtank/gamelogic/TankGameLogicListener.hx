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

package mrtank.gamelogic;

import mrtank.event.IEventListener;
import mrtank.event.IEvent;
import mrtank.event.EventType;
import mrtank.gamelogic.GameState;
import mrtank.event.RequestNewActorEvent;
import mrtank.event.NewActorEvent;
import mrtank.event.ThrustEvent;
import mrtank.event.EventManager;

class TankGameLogicListener implements IEventListener
{
	private var m_Logic : TankGameLogic;

	public function new(logic : TankGameLogic)
	{
		m_Logic = logic;
	}

	public function Init() : Bool
	{
		return true;
	}

	public function GetName():String
	{
		return "TankGameLogicListener";
	}

	public function HandleEvent( event:IEvent ) : Bool
	{
		if(event.GetType() == MT_EVENT_GameState)
		{
		}
		else if (event.GetType() == MT_EVENT_RequestNewActor)
		{
			var castEvent : RequestNewActorEvent = cast event;	
			var actor = castEvent.GetActor();
			actor.SetId(m_Logic.GetNewActorId());
			EventManager.GetInstance().QueueEvent( new NewActorEvent(actor) );
		}
		else if (event.GetType() == MT_EVENT_NewActor)
		{
			var castEvent : NewActorEvent = cast event;	
			var actor = castEvent.GetActor();
			trace("New Actor event");
			m_Logic.GetGamePhysics().Add(actor);
			trace("AfterAdding actor event");
		}
		else if (event.GetType() == MT_EVENT_Thrust)
		{
			var castEvent : ThrustEvent = cast event;	
			var actorId = castEvent.GetId();
			var thrust = castEvent.GetThrust();
			m_Logic.GetGamePhysics().AddThrust(actorId, thrust);
		}
		return true;
	}
}
