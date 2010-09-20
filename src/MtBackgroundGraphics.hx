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

import MtStageConstants;

import flash.display.Shape;

class MtBackgroundGraphics 
{
	private var m_BackgroundShape:Shape;

	public function new()
	{
		m_BackgroundShape = new Shape();
	}

	public function init()
	{
        m_BackgroundShape.graphics.beginFill(0x8B4513);
		m_BackgroundShape.graphics.moveTo(0,0);
		m_BackgroundShape.graphics.lineTo(MtStageConstants.SCREEN_WIDTH,0);
		m_BackgroundShape.graphics.lineTo(MtStageConstants.SCREEN_WIDTH,MtStageConstants.SCREEN_HEIGHT);
		m_BackgroundShape.graphics.lineTo(0,MtStageConstants.SCREEN_HEIGHT);
		m_BackgroundShape.graphics.lineTo(0,0);
	}

	public function draw(mc:flash.display.MovieClip) 
	{
		mc.addChild(m_BackgroundShape);

		//flash.Lib.current.addChild(m_BackgroundShape);
	}    
}
