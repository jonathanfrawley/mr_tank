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

import flash.display.Shape;

class MtStageGraphics extends MtInitialisable
{
	var m_Border:Shape;

	public function new()
	{
		m_Border = new Shape();
		m_IsInit = false;
	}
	
	public function init(stage:MtStage)
	{
		//Draw background m_Border
		m_Border.graphics.moveTo(0,0);
		m_Border.graphics.lineStyle(1.0,1);
		m_Border.graphics.beginFill(0xFFFFFF);
		var xStart = stage.getPos().getX();
		var yStart = stage.getPos().getY();
		var width = stage.getWidth();
		var height = stage.getHeight();
		var ellipseWidth = 10.5;
		var ellipseHeight = 10.5;
		m_Border.graphics.drawRoundRect(xStart, yStart, width, height, ellipseWidth, ellipseHeight);
		m_Border.graphics.endFill();
		m_IsInit = true;
	}

	public function draw( mc:flash.display.MovieClip) 
	{
		if(m_IsInit)
		{
			mc.addChild(m_Border);
		}
	}    
}
