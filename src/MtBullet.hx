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

import JfCore;
import MtSphere;
import MtPhysicsBody;
import MtBullet;
import JfVector2;

class MtBullet extends MtPhysicsSphere
{
//	private var m_Dir:JfReal;
//	private var m_Speed:JfReal;
	private var m_TankRadius:JfReal;
	private var m_WallHitCount:Int;

	public function new(x:JfReal, y:JfReal, dir:JfReal, radiusTank:JfReal, radius:JfReal)
	{
		super(x,y,dir,2,radius);
		m_TankRadius = radiusTank;

		m_HaxeBody.setSpeed(Math.cos(dir) * 10, Math.sin(dir) * 10);
//		m_HaxeShape.material = new phx.Material(0.1,10.9,20);
		m_HaxeShape.material = new phx.Material(0.9,10.9,20);

		m_WallHitCount = 0;
//		super(160.0,160.0,5);
//		m_Dir = new JfVector2(xVel,yVel);
//		m_Dir = dir;
//		m_Speed = 3;
	}
/*
	public override function step(timeStep:JfReal)
	{
		var dirVec = new JfVector2((Math.cos(m_Dir)*4), (Math.sin(m_Dir)*4));
		m_Pos = m_Pos.add(dirVec.multiply(timeStep).multiply(m_Speed));
	}
*/
	public override function collidesWithRectangle(rectangle:MtRectangle):Bool
	{
		var xMin = rectangle.getPos().getX() - m_TankRadius;
		var xMax = rectangle.getPos().getX()+rectangle.getWidth() - m_TankRadius;
		var yMin = rectangle.getPos().getY() - m_TankRadius;
		var yMax = rectangle.getPos().getY()+rectangle.getHeight() - m_TankRadius;
		var pos:JfVector2 = m_Pos;

		if( ((pos.getX()-m_Radius) < xMin) ||
			((pos.getX()+m_Radius) > xMax) ||	
			((pos.getY()-m_Radius) < yMin) ||
			((pos.getY()+m_Radius) > yMax) )
		{
			trace("Collision");
			return true;
		}
		return false;
	}

	public function addWallHit():Void
	{
		m_WallHitCount++;
	}

	public function getWallHitCount():Int
	{
		return m_WallHitCount;	
	}

}
