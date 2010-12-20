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

class MtBulletGraphics extends MtInitialisable
{
    private var m_Circle : flash.display.Shape;
	private var m_Bullet : MtBullet;
	private var m_Tank : MtTank;

	public function new()
	{
        m_Circle = new flash.display.Shape();
		m_IsInit = false;
	}

	public function getBullet()
	{
		return m_Bullet;	
	}

	public function init(bullet:MtBullet, tank:MtTank)
	{
        m_Circle.graphics.beginFill ( 0x000000 );
        m_Circle.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
//        m_Circle.graphics.drawCircle ( bullet.getPos().getX(), bullet.getPos().getY(), bullet.getRadius());
        m_Circle.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), bullet.getRadius());
        m_Circle.graphics.endFill();
		m_Bullet = bullet;
		m_Tank = tank;
		m_IsInit = true;
	}

	public function draw(mc:flash.display.MovieClip)
	{
		if(m_IsInit)
		{
			m_Circle.x = m_Bullet.getPos().getX() - m_Tank.getRadius();
			m_Circle.y = m_Bullet.getPos().getY() - m_Tank.getRadius();
			mc.addChild(m_Circle);
		}
	}
}
