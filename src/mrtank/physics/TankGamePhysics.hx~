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
import mrtank.ActorType;

class TankGamePhysics extends BasePhysics
{
	private var m_Bodies : FastList<IPhysicsBody>;
	private var m_World : phx.World;

	public function new()
	{
		super();
		m_Bodies = new FastList<IPhysicsBody>();

		var size = new phx.col.AABB(-1000,-1000,1000,1000); 
		var bf = new phx.col.SortedList();
		m_World = new phx.World(size, bf);	
	}

	public override function Add(actor:IActor)
	{
		trace("ewoj");
		var body : IPhysicsBody = MakePhysicsBody( actor );
		trace("ww");
		m_Bodies.add( body );
		m_World.addBody( body.GetBody() );
	}

	public function MakePhysicsBody( actor : IActor ) : IPhysicsBody
	{
		var physicsBody : IPhysicsBody = null;
		//TODO
		if( actor.GetType() == MT_ACTOR_Tank )
		{
			var body : phx.Body = new phx.Body(actor.GetPos().GetX(), actor.GetPos().GetY() );
			var shape : phx.Shape = new phx.Circle(10, new phx.Vector(0,0));
			body.addShape( shape );

			//XXX:Remove
			body.setSpeed(100,100); 

			physicsBody = new BasePhysicsBody();
			physicsBody.SetId(actor.GetId());
			physicsBody.SetBody(body);
			
		}
		return physicsBody;
	}

	public override function Step(timeStep:Float)
	{
		trace("Stepping");
		m_World.step(timeStep,20);

		for(body in m_Bodies)
		{
			var newPos : Point2 = new Point2(body.GetBody().x, body.GetBody().y);
			EventManager.GetInstance().QueueEvent( new ActorMovedEvent(body.GetId(), newPos, body.GetBody().a) );
		}	
	}
}
