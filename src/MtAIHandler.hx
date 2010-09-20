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
import MtEventType;

class MtAIHandler implements MtEventListener
{
	private var m_PlayerTank:MtTank;
	private var m_EnemyTanks:List<MtTank>;

	public function new()
	{
		m_EnemyTanks = new List<MtTank>();
	}

	public function init():Bool
	{
		return true;
	}

	public function step()
	{
		for(enemyTank in m_EnemyTanks)
		{
			//var dir = enemyTank.getCentrePos().subtract(m_PlayerTank.getCentrePos());
			var dir = m_PlayerTank.getCentrePos().subtract(enemyTank.getCentrePos());
			var dirAngle = Math.atan2(dir.getY(),dir.getX());
			MtEventManager.getInstance().trigger(new MtTankMovedEvent(enemyTank, dirAngle));
		}
	}

	public function getName():String
	{
		return "AIHandler";
	}

	public function handleEvent(event:MtEvent):Bool
	{
		if(event.getType()==MT_EVENT_TANKCREATED)
		{
			var tankCreatedEvent : MtTankCreatedEvent = cast event;
			m_PlayerTank = tankCreatedEvent.getTank();	
		}
		else if(event.getType()==MT_EVENT_ENEMYTANKCREATED)
		{
			var event : MtEnemyTankCreatedEvent = cast event;
			m_EnemyTanks.add(event.getTank());	
		}
		return true;
	}
}
