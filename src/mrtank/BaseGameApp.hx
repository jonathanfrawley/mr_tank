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

import mrtank.BaseGameLogic;

class BaseGameApp implements IGameApp
{
	private var m_GameLogic : IGameLogic;
	private var m_GameView : IGameView;

	public function new()
	{
	}

	public function Init() : Bool
	{
		if( ! CreateGameLogicAndView())
		{
			return false;
		}
		return true;
	}

	public function MainLoop() : Bool
	{
		EventManager.GetInstance().Tick();
		m_GameLogic.OnUpdate();	
		m_GameView.OnRender();
		return true;
	}

	private function CreateGameLogicAndView() : Bool
	{
		return true;
	}
}
