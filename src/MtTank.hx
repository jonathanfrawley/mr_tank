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

import JfCore;
import JfVector2;
import MtPhysicsBody;
import MtSphere;
import MtTankType;

class MtTank extends MtPhysicsSphere
{
//	private var m_Pos:JfVector2;
//	private var m_Radius:JfReal;
//	private var m_Speed:JfReal;
	private var m_TurretDir:JfReal;
	private static var MT_THROTTLE_SPEED:JfReal = 2;
	private var m_Type:MtTankType;

	public function new(x:JfReal,y:JfReal, type:MtTankType)
	{
		super(x,y,0,2,10);
		//m_Pos = new JfVector2(x,y);
		//m_Radius = 20;
		//m_TurretDir = new JfVector2(1,0);
		m_TurretDir = 0.0;
		m_Type = type;
//		m_Speed = 3;
	}

	public function getType():MtTankType
	{
		return m_Type;	
	}


/*
	public function step(timeStep:JfReal)
	{
//		m_Pos = m_Pos.add((m_Dir.multiply(m_Speed)).multiply(timeStep)); //TODO:Does this work okay?
		m_Pos = m_Pos.add(m_Dir.multiply(Math.ceil(timeStep)));
	}
	public function getDir():JfVector2
	{
		return m_Dir;
	}
*/

	/**
	 * Accounts for offset to centre.
     */
/*
	public function getCentrePos():JfVector2
	{
		return m_Pos.add(new JfVector2(m_Radius,m_Radius));
	}
*/
/*
	public function setDir(dir:JfVector2)
	{
		m_Dir = dir;
	}
*/
	public function getTurretDir():JfReal
	{
		return m_TurretDir;
	}

	public function setTurretDir(dir:JfReal):Void
	{
		m_TurretDir = dir;
	}

	public function upPressed()
	{
//		m_Dir = - Math.PI / 2;
//		m_Speed = MT_THROTTLE_SPEED;

//		trace("Hello UP PRESSED"); 
//		trace(m_HaxeBody);
		m_HaxeBody.setSpeed(0 , -MT_THROTTLE_SPEED);
//		m_HaxeBody.f = new phx.Vector(10 , MT_THROTTLE_SPEED*100);
	}

	public function upDepressed()
	{
		//m_Dir.setY(0);
/*
		if(m_Dir== -Math.PI / 2)
		{
			m_Speed = 0;
		}
*/

		m_HaxeBody.setSpeed(0 , 0);
	}

	public function downPressed()
	{
//		m_Dir.setY(m_Speed);
//		m_Dir = Math.PI / 2;
//		m_Speed = MT_THROTTLE_SPEED;

		m_HaxeBody.setSpeed(0 , MT_THROTTLE_SPEED);
	}

	public function downDepressed()
	{
	//	m_Dir.setY(0);
//		if(m_Dir== Math.PI / 2)
//		{
//			m_Speed = 0;
//		}

		m_HaxeBody.setSpeed(0 , 0);
	}

	public function leftPressed()
	{
		//m_Dir.setX(-m_Speed);
//		m_Dir = Math.PI;
//		m_Speed = MT_THROTTLE_SPEED;

		m_HaxeBody.setSpeed(-MT_THROTTLE_SPEED , 0);
	}

	public function leftDepressed()
	{
//		m_Dir.setX(0);
/*
		if(m_Dir==Math.PI)
		{
			m_Speed = 0;
		}
*/

		m_HaxeBody.setSpeed(0 , 0);
	}

	public function rightPressed()
	{
//		m_Dir.setX(m_Speed);
//		m_Dir = 0;
//		m_Speed = MT_THROTTLE_SPEED;

		m_HaxeBody.setSpeed(MT_THROTTLE_SPEED , 0);
	}

	public function rightDepressed()
	{
//		m_Dir.setX(0);
//		if( m_Dir == 0 )
//		{
//			m_Speed = 0;
//		}

		m_HaxeBody.setSpeed(0 , 0);
	}

	public function move(dir:Float)
	{
		m_TurretDir = Math.PI;
		m_Dir = dir;
		m_Speed = MT_THROTTLE_SPEED;
	}

}
