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

class MtHealthBarGraphics extends MtInitialisable
{
	private static var HEALTH_BAR_WIDTH = 30;
	private static var HEALTH_BAR_HEIGHT = 3;

    private var m_InnerBox : flash.display.Shape;
	private var m_OuterBox : flash.display.Shape;
//    private static var m_CircleWidth = 50;
//    private static var m_CircleHeight = 50;
	private var m_HealthBar:MtHealthBar;
//	private var m_StartingPos:JfVector2;

	public function new(healthBar:MtHealthBar)
	{
        m_OuterBox = new flash.display.Shape();
		m_InnerBox = new flash.display.Shape();
		m_HealthBar = healthBar;
		m_IsInit = false;
	}

	public function getHealthBar():MtHealthBar
	{
		return m_HealthBar;	
	}

	public function init()
	{
        m_OuterBox.graphics.beginFill ( 0x000000 );
        m_OuterBox.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
        //m_OuterBox.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
        //m_OuterBox.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), tank.getRadius());
        m_OuterBox.graphics.drawRect ( 0, 0, HEALTH_BAR_WIDTH, HEALTH_BAR_HEIGHT );
        m_OuterBox.graphics.endFill();
        m_InnerBox.graphics.beginFill ( 0x7CFC00 );
        m_InnerBox.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
        //m_InnerBox.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
        //m_InnerBox.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), tank.getRadius());
        m_InnerBox.graphics.drawRect ( 0, 0, HEALTH_BAR_WIDTH, HEALTH_BAR_HEIGHT );
        m_InnerBox.graphics.endFill();
//		m_StartingPos = tank.getPos();
		m_IsInit = true;
	}

	public function draw(mc:flash.display.MovieClip)
	{
		if(m_IsInit)
		{
//			m_Circle.x = m_Tank.getPos().getX() - m_Tank.getRadius();
//			m_Circle.y = m_Tank.getPos().getY() - m_Tank.getRadius();
			m_OuterBox.x = m_HealthBar.getTank().getPos().getX();
			m_OuterBox.y = m_HealthBar.getTank().getPos().getY();
			mc.addChild(m_OuterBox);
			m_InnerBox.graphics.clear();
			m_InnerBox.x = m_HealthBar.getTank().getPos().getX();
			m_InnerBox.y = m_HealthBar.getTank().getPos().getY();
			m_InnerBox.graphics.beginFill ( 0x7CFC00 );
			m_InnerBox.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
			//m_InnerBox.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
			//m_InnerBox.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), tank.getRadius());
			m_InnerBox.graphics.drawRect ( 0, 0, HEALTH_BAR_WIDTH * m_HealthBar.getFullness(), HEALTH_BAR_HEIGHT );
			m_InnerBox.graphics.endFill();
			mc.addChild(m_InnerBox);

		}
	}
}
