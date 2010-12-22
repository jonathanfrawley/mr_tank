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

import mrtank.BaseGameApp;
import mrtank.BaseGameView;
import mrtank.TankHumanGameView;

class TankGameApp extends BaseGameApp
{
	public function new()
	{
		super();
	}

	private override function CreateGameLogicAndView() : Bool
	{
		m_GameLogic = new TankGameLogic();
		if( ! m_GameLogic.Init())
		{
			return false;
		}
		var playerView : TankHumanGameView;
		playerView = new TankHumanGameView();
		if( ! playerView.Init())
		{
			return false;
		}
		m_GameView = playerView;
		m_GameLogic.OnAttach(playerView);

		return true;
	}
}
