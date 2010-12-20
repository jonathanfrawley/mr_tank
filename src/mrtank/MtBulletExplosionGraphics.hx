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

class MtBulletExplosionGraphics implements MtExplosionGraphics, extends MtInitialisable
{
	private var m_TimeGone:Float;
	private var m_TotalTime:Float;
    private var m_Circle : flash.display.Shape;
	private static var m_StartRadius = 1.0;
	private static var m_SizeIncreaseMultiplier = 4;
	private static var m_Sphere:MtPhysicsSphere;
	
	public function new()
	{
        m_Circle = new flash.display.Shape();
		m_IsInit = false;
		m_TotalTime = 1.0;
		m_TimeGone = 0.0;
	}

	public function init(sphere:MtPhysicsSphere):Bool
	{
		m_Sphere = sphere;
//		m_StartingPos = tank.getPos();
		m_IsInit = true;
		return true;
	}

	public function draw(mc:flash.display.MovieClip):Void
	{
		m_Circle.graphics.beginFill ( 0xFF4500 );
		m_Circle.graphics.lineStyle ( 1, 0xFF4500, 1, false, flash.display.LineScaleMode.NONE );
        //m_Circle.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
        m_Circle.graphics.drawCircle ( m_Sphere.getPos().getX(), m_Sphere.getPos().getY(), m_StartRadius + (m_TimeGone*m_SizeIncreaseMultiplier));
        m_Circle.graphics.endFill();
		mc.addChild(m_Circle);
	}

	public function isFinished():Bool
	{
		if(m_TimeGone > m_TotalTime)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public function advance(delta:Float):Void
	{
		m_TimeGone += delta;
	}
}
