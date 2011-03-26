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

import mrtank.core.Constants;

class BackgroundSceneNode extends BaseSceneNode
{
    private var m_Rectangle : flash.display.Shape;

	public function new()
	{
		super();
		m_Rectangle = new flash.display.Shape();

		m_Rectangle.graphics.beginFill(0x8B4513);
		m_Rectangle.graphics.moveTo(0,0);
		m_Rectangle.graphics.lineTo(Constants.SCREEN_WIDTH,0);
		m_Rectangle.graphics.lineTo(Constants.SCREEN_WIDTH, Constants.SCREEN_HEIGHT);
		m_Rectangle.graphics.lineTo(0,Constants.SCREEN_HEIGHT);
		m_Rectangle.graphics.lineTo(0,0);
	}

	public override function OnRender() : Void
	{
		flash.Lib.current.addChild(m_Rectangle);
	}
}

