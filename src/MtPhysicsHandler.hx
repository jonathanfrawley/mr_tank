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

import JfVector2;
import MtPhysicsBody;
import MtTank;
import MtEvent;
import MtEventManager;
import MtTankCreatedEvent;
import MtEventType;
import MtUpPressedEvent;
import MtDownPressedEvent;
import MtLeftPressedEvent;
import MtRightPressedEvent;
import MtUpDepressedEvent;
import MtDownDepressedEvent;
import MtLeftDepressedEvent;
import MtRightDepressedEvent;
import MtConstants;
import MtCollisionDetector;
import MtStage;
import MtGameLoadedEvent;
import MtBullet;

class MtPhysicsHandler implements MtEventListener
{
	private var m_Bodies:List<MtPhysicsBody>;
	private var m_EnemyTanks:List<MtTank>;
	private var m_Bullets:List<MtBullet>;
	private var m_PlayerTank:MtTank;
	private var m_Stage:MtStage;
	private var m_HaxeWorld:phx.World;
	private var m_WallShapes:List<phx.Shape>;
	
	public function new()
	{
		m_Bodies = new List<MtPhysicsBody>();
		m_EnemyTanks = new List<MtTank>();
		m_Bullets = new List<MtBullet>();
		m_WallShapes = new List<phx.Shape>();

		//Setup haxe world
		var size = new phx.col.AABB(-1000,-1000,1000,1000); 
		// create the broadphase : this is the algorithm used to optimize collision detection 
		var bf = new phx.col.SortedList();
		m_HaxeWorld = new phx.World(size, bf);	
	}

	public function init():Bool
	{
		// setup gravity
		//m_HaxeWorld.gravity = new phx.Vector(0,0.9);
		//m_HaxeWorld.gravity = new phx.Vector(0,0.1);
        var floor = phx.Shape.makeBox(MtStageConstants.SCREEN_WIDTH,MtStageConstants.BORDER_WIDTH,0,MtStageConstants.SCREEN_HEIGHT-MtStageConstants.BORDER_WIDTH);
		m_HaxeWorld.addStaticShape(floor);
		m_WallShapes.add(floor);
		
		var wallLeft = phx.Shape.makeBox(MtStageConstants.BORDER_WIDTH,MtStageConstants.SCREEN_HEIGHT,0,0);
		m_HaxeWorld.addStaticShape(wallLeft);
		m_WallShapes.add(wallLeft);

        var ceiling = phx.Shape.makeBox(MtStageConstants.SCREEN_WIDTH,MtStageConstants.BORDER_WIDTH,0,0);
		m_HaxeWorld.addStaticShape(ceiling);
		m_WallShapes.add(ceiling);

        var wallRight = phx.Shape.makeBox(MtStageConstants.BORDER_WIDTH,MtStageConstants.SCREEN_HEIGHT,MtStageConstants.SCREEN_WIDTH-MtStageConstants.BORDER_WIDTH,0);
		m_HaxeWorld.addStaticShape(wallRight);
		m_WallShapes.add(wallRight);

		return true;
	}

	public function step(timeStep:Float)
	{
/*
		for(body in m_Bodies)
		{
			body.step(timeStep);
			if(MtCollisionDetector.getInstance().bodyWithinRectangle(body, m_Stage))
			{
				body.wallCollisionResponse();	
			}
*/
/*
			if(body.getActorID() != m_PlayerTank.getActorID())
			{
				if(MtCollisionDetector.getInstance().bodyWithinSphere(body, m_PlayerTank))
				{
					trace("Collision with tank");
					MtEventManager.getInstance().queueEvent(new MtTankBulletCollisionEvent(m_PlayerTank, cast body));
				}
			}
		}
*/
		for(tank in m_EnemyTanks)
		{
			//TODO: Better way of doing this?
			m_HaxeWorld.activate(tank.getBody());
		}

		for (bullet in m_Bullets)
		{
			//TODO:Does this work?
			//m_HaxeWorld.activate(bullet.getBody());
			//m_HaxeWorld.sync(bullet.getBody());
			

			var collision = new phx.Collision();
			var arb = new phx.Arbiter(new phx.Allocator());
			if(collision.testShapes(m_PlayerTank.getShape(), bullet.getShape(), arb))
			{
				MtEventManager.getInstance().queueEvent(new MtTankBulletCollisionEvent(m_PlayerTank, cast bullet));
			}
			for(tank in m_EnemyTanks)
			{
				if(collision.testShapes(tank.getShape(), bullet.getShape(), arb))
				{
					MtEventManager.getInstance().queueEvent(new MtTankBulletCollisionEvent(tank, cast bullet));
					MtEventManager.getInstance().trigger(new MtBulletDestroyedEvent(bullet));	
				}
			}

			//Check for collision between walls.
			for(wall in m_WallShapes)
			{
				var collision = new phx.Collision();
				var arb = new phx.Arbiter(new phx.Allocator());
				if(collision.testShapes(bullet.getShape(), wall, arb))
				{
					MtEventManager.getInstance().trigger(new MtBulletWallCollisionEvent(cast bullet));
				}
			}

/*
			if(MtCollisionDetector.getInstance().bodyWithinSphere(bullet, m_PlayerTank))
			{
				MtEventManager.getInstance().queueEvent(new MtTankBulletCollisionEvent(m_PlayerTank, cast bullet));
			}
*/
			
		}


		m_HaxeWorld.step(1,20);


/*
                var g = flash.Lib.current.graphics;
                g.clear();

                var fd = new phx.FlashDraw(g); 
                fd.drawCircleRotation = true; 
                fd.drawWorld(m_HaxeWorld);
*/


	}

	public function getName():String
	{
		return "MtPhysicsHandler";
	}

	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType()==MT_EVENT_TANKCREATED)
		{
			var tankCreatedEvent : MtTankCreatedEvent = cast event;
			m_PlayerTank = tankCreatedEvent.getTank();	
			m_Bodies.add(m_PlayerTank);

			m_HaxeWorld.addBody(m_PlayerTank.getBody());
		}
		else if(event.getType()==MT_EVENT_UPPRESSED)
		{
			var upPressedEvent : MtUpPressedEvent = cast event;
			if(upPressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.upPressed();
				m_HaxeWorld.activate(m_PlayerTank.getBody());
			}			
		}
		else if(event.getType()==MT_EVENT_UPDEPRESSED)
		{
			var upDepressedEvent : MtUpDepressedEvent = cast event;
			if(upDepressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.upDepressed();
				m_HaxeWorld.activate(m_PlayerTank.getBody());
			}			
		}
		else if(event.getType()==MT_EVENT_DOWNPRESSED)
		{
			var downPressedEvent : MtDownPressedEvent = cast event;
			if(downPressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.downPressed();
				m_HaxeWorld.activate(m_PlayerTank.getBody());
			}			
		}
		else if(event.getType()==MT_EVENT_DOWNDEPRESSED)
		{
			var downDepressedEvent : MtDownDepressedEvent = cast event;
			if(downDepressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.downDepressed();
				m_HaxeWorld.activate(m_PlayerTank.getBody());
			}			
		}
		else if(event.getType()==MT_EVENT_LEFTPRESSED)
		{
			var leftPressedEvent : MtLeftPressedEvent = cast event;
			if(leftPressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.leftPressed();
				m_HaxeWorld.activate(m_PlayerTank.getBody());
			}			
		}
		else if(event.getType()==MT_EVENT_LEFTDEPRESSED)
		{
			var leftDepressedEvent : MtLeftDepressedEvent = cast event;
			if(leftDepressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.leftDepressed();
				m_HaxeWorld.activate(m_PlayerTank.getBody());
			}			
		}
		else if(event.getType()==MT_EVENT_RIGHTPRESSED)
		{
			var rightPressedEvent : MtRightPressedEvent = cast event;
			if(rightPressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.rightPressed();
				m_HaxeWorld.activate(m_PlayerTank.getBody());
			}			
		}
		else if(event.getType()==MT_EVENT_RIGHTDEPRESSED)
		{
			var rightDepressedEvent : MtRightDepressedEvent = cast event;
			if(rightDepressedEvent.getPlayer() == MT_PLAYER_0)
			{
				m_PlayerTank.rightDepressed();
				m_HaxeWorld.activate(m_PlayerTank.getBody());
			}			
		}
		else if(event.getType()==MT_EVENT_GAMELOADED)
		{
			var gameLoadedEvent : MtGameLoadedEvent = cast event;
			m_Stage = gameLoadedEvent.getStage();
		}
		else if(event.getType()==MT_EVENT_BUTTONAPRESSED)
		{
			m_PlayerTank.setTurretDir(m_PlayerTank.getTurretDir() + Math.PI/8);
		}
		else if(event.getType()==MT_EVENT_BUTTONSPRESSED)
		{
			m_PlayerTank.setTurretDir(m_PlayerTank.getTurretDir() - Math.PI/8);
		}
		else if(event.getType()==MT_EVENT_MBLEFTPRESSED)
		{
			var event : MtMBLeftPressedEvent = cast event;
			var dir : JfVector2 = event.getPos().subtract(m_PlayerTank.getCentrePos());
			dir.normalize();
			var dirAngle : Float = Math.atan2(dir.getY(),dir.getX());
			var radius : Float = 2; //XXX:Magic number
			
			var startPos:JfVector2 = new JfVector2(m_PlayerTank.getPos().getX() + ((m_PlayerTank.getRadius()+radius) * Math.cos(dirAngle))
													, m_PlayerTank.getPos().getY() + ((m_PlayerTank.getRadius()+radius) * Math.sin(dirAngle)));
			m_PlayerTank.setTurretDir(dirAngle);
			//var bullet = new MtBullet(m_PlayerTank.getPos().getX(), m_PlayerTank.getPos().getY(), m_PlayerTank.getTurretDir(), m_PlayerTank.getRadius(), radius);
			var bullet = new MtBullet(startPos.getX(), startPos.getY(), m_PlayerTank.getTurretDir(), m_PlayerTank.getRadius(), radius);
			m_Bodies.add(bullet);
			m_Bullets.add(bullet);
			m_HaxeWorld.addBody(bullet.getBody());
			MtEventManager.getInstance().trigger(new MtBulletCreatedEvent(bullet));
		}
		else if(event.getType()==MT_EVENT_MOUSEMOVED)
		{
			var event : MtMouseMovedEvent = cast event;
			var dir : JfVector2 = event.getPos().subtract(m_PlayerTank.getCentrePos());
			dir.normalize();
			var dirAngle : Float = Math.atan2(dir.getY(),dir.getX());
			var radius : Float = 3; //XXX:Magic number
			
			var startPos:JfVector2 = new JfVector2(m_PlayerTank.getPos().getX() + ((m_PlayerTank.getRadius()+radius) * Math.cos(dirAngle))
													, m_PlayerTank.getPos().getY() + ((m_PlayerTank.getRadius()+radius) * Math.sin(dirAngle)));
			m_PlayerTank.setTurretDir(dirAngle);
		}
		else if(event.getType()==MT_EVENT_ENEMYTANKCREATED)
		{
			trace("Hi");
			var event : MtEnemyTankCreatedEvent = cast event;
			var tank : MtTank = event.getTank();
			m_EnemyTanks.add(tank);	
			m_Bodies.add(tank);	

			m_HaxeWorld.addBody(tank.getBody());

			m_HaxeWorld.activate(tank.getBody());
		}
		else if(event.getType() == MT_EVENT_BULLETDESTROYED)
		{
			var event : MtBulletDestroyedEvent = cast event;
			var eventBullet = event.getBullet();
			m_HaxeWorld.removeBody(eventBullet.getBody());
			m_Bullets.remove(eventBullet);
		}
		else if(event.getType() == MT_EVENT_TANKDESTROYED)
		{
			var event : MtTankDestroyedEvent = cast event;
			var eventTank :MtTank = event.getTank();
			//TODO : Delete Tank and bullet
			//setEndScreen();
			m_HaxeWorld.removeBody(eventTank.getBody());
			m_EnemyTanks.remove(eventTank);
			
		}
		//m_PlayerTank.getBody().setSpeed(10,10);
		return true;
	}

}
