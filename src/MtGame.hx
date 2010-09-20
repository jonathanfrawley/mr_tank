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

import MtBaseGame;
import JfVector2;

class MtGame extends MtBaseGame
{
	private m_LifeTime : float; // How long game has been in session;
	private m_StartPosition : JfVector2;

	public function new()
	{
		super();


		var stage = new MtStage(MtStageConstants.SCREEN_WIDTH-10, MtStageConstants.SCREEN_HEIGHT-10, 5, 5);

		graphicsHandler.setMtStage(stage);

		graphicsHandler.display();

	}

	public function onUpdate()
	{

	}

	public function createTank() : MtActorId //TODO
	{

	}

	public void removeActor(mtActorId id)
	{
	}

	public void addView(mtIGameView view) //TODO
	{
	}

	public RegisterHit(ActorId sphere)
	{
	}
}
