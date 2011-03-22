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

class TankSceneNode extends BaseSceneNode
{
    private var m_Circle : flash.display.Shape;
	private var m_Radius : Float;

	public function new(radius:Float)
	{
		super();
		m_Radius = radius;
		m_Circle = new flash.display.Shape();
		m_Circle.graphics.beginFill ( 0xEE0000 );
		m_Circle.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
        //m_Circle.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
        m_Circle.graphics.drawCircle ( radius, radius, radius);
        m_Circle.graphics.endFill();
	}

	public override function OnRender() : Void
	{
		trace("Rendering tank");

		m_Circle.x = m_Pos.GetX() - m_Radius;
		m_Circle.y = m_Pos.GetY() - m_Radius;

		flash.Lib.current.addChild(m_Circle);
	}


}
