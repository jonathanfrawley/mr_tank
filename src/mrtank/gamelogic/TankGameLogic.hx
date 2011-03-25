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

import haxe.FastList;

import mrtank.gamelogic.BaseGameLogic;
import mrtank.gamelogic.GameState;
import mrtank.gamelogic.TankGameLogicListener;
import mrtank.event.IEventListener;
import mrtank.event.EventType;
import mrtank.event.EventManager;
import mrtank.event.GameStateEvent;
import mrtank.event.RequestNewActorEvent;
import mrtank.gameview.IGameView;
import mrtank.actor.ActorId;
import mrtank.actor.TankActor;
import mrtank.physics.TankGamePhysics;

class TankGameLogic extends BaseGameLogic
{
	private var m_GameViews : FastList<IGameView>;
	private var m_State : GameState;
	private var m_LastActorId : ActorId;
	private var m_GamePhysics : TankGamePhysics;
	
	public function new()
	{
		super();
		m_GameViews = new FastList<IGameView>();
		m_GamePhysics = new TankGamePhysics();
		m_LastActorId = 0;
	}

	public override function Init() : Bool
	{
		if(! super.Init() )
		{
			return false;
		}

		var eventListener : IEventListener = new TankGameLogicListener(this);
		ListenToTankGameLogicEvents(eventListener);

		m_State = MT_GS_Start;
		
//		EventManager.GetInstance().QueueEvent( new GameStateEvent(MT_GS_Init) );

		//TODO: Other init stuff.
		return true;
	}

	public override function OnAttach( view : IGameView) : Void
	{
		m_GameViews.add(view);
	}

	public override function OnUpdate() : Bool
	{
		
		switch(m_State)
		{
			case MT_GS_Start:
				ChangeState(MT_GS_Init);
			case MT_GS_Init:
				ChangeState(MT_GS_LevelLoading);
			case MT_GS_LevelLoading:
				//TODO:Handle multiple level options
				CreateLevel(0);
				ChangeState(MT_GS_Running);
			case MT_GS_Running:
			default:
				trace("Invalid state reached");
		}

		m_GamePhysics.Step( 1.0 / 60 );

		for(gameView in m_GameViews)
		{
			gameView.OnUpdate();
		}
		return true;
	}

	public function ChangeState(newState : GameState) : Void
	{
		m_State = newState;
		EventManager.GetInstance().QueueEvent( new GameStateEvent(newState) );
	}

	public function CreateLevel(levelNum : Int)
	{
		switch(levelNum)
		{
			case 0:
				var playerTankRadius : Float;
				playerTankRadius = 2.0;
				var playerTank : TankActor;
				playerTank = new TankActor(playerTankRadius);
				EventManager.GetInstance().QueueEvent( new RequestNewActorEvent(playerTank) );
			default:
				trace("Invalid level choice");
		}
	}

	public function ListenToTankGameLogicEvents( eventListener : IEventListener ) : Void
	{	
		//TODO:Add appropriate events here.
		EventManager.GetInstance().AddListener(eventListener, MT_EVENT_GameState);
	}

	public function GetNewActorId() : ActorId
	{
		m_LastActorId++;
		return m_LastActorId;
	}

	public function GetGamePhysics() : TankGamePhysics
	{
		return m_GamePhysics;
	}
}
