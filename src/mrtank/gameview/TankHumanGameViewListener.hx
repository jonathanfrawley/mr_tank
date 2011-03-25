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

import mrtank.event.IEventListener;
import mrtank.event.EventType;
import mrtank.event.GameStateEvent;
import mrtank.event.IEvent;
import mrtank.event.NewActorEvent;
import mrtank.event.ActorMovedEvent;
import mrtank.gamelogic.GameState;
import mrtank.actor.ActorType;
import mrtank.actor.IActor;
import mrtank.actor.TankActor;

class TankHumanGameViewListener implements IEventListener
{
	private var m_View : TankHumanGameView;

	public function new(view : TankHumanGameView)
	{
		m_View = view;
	}

	public function Init() : Bool
	{
		return true;
	}

	public function GetName():String
	{
		return "TankGameViewListener";
	}

	public function HandleEvent( event:IEvent ) : Bool
	{
		if(event.GetType() == MT_EVENT_GameState)
		{
			var castEvent : GameStateEvent = cast event;	
			var state : GameState;
			state = castEvent.GetState();
			switch(state)
			{
				case MT_GS_Start:
					trace("Handing Start Event");
				case MT_GS_Init:
					trace("Handing Init Event");
				case MT_GS_LevelLoading:
					trace("Handing LevelLoading Event");
				case MT_GS_Running:
					trace("Handing Running Event");
				default:
					trace("Invalid state reached");
			}
		}
		else if (event.GetType() == MT_EVENT_NewActor)
		{
			trace("New Actor event");
			var castEvent : NewActorEvent = cast event;	
			var actor = castEvent.GetActor();

			var newSceneNode:TankSceneNode;
			newSceneNode = null;
			if(actor.GetType() == MT_ACTOR_Tank)
			{
				var castActor : TankActor = cast actor;
				newSceneNode = new TankSceneNode(castActor.GetRadius());
				trace("In if");
				newSceneNode.SetPos(actor.GetPos());
				newSceneNode.SetOrientation(actor.GetOrientation());
				newSceneNode.SetId(actor.GetId());
				if(newSceneNode.GetViewId() == m_View.GetId())
				{
					m_View.SetActor(actor.GetId());
				}
				//newSceneNode.SetViewId(actor.GetViewId());
			}

			if(newSceneNode != null)
			{
				m_View.AddSceneNode(newSceneNode);
			}
			trace("After if");
		}
		else if (event.GetType() == MT_EVENT_ActorMoved)
		{
			trace("Actor Moved Event Handled in GameView");
			var castEvent : ActorMovedEvent = cast event;	
			var id = castEvent.GetId();
			var pos = castEvent.GetPos();
			var orientation = castEvent.GetOrientation();
				
			m_View.UpdateSceneNode(id, pos, orientation);
		}
		return true;
	}
}
