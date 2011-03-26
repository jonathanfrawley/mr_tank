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

package mrtank.event;

import mrtank.event.EventType;
import mrtank.actor.ActorId;
import mrtank.algebra.Point2;
import mrtank.algebra.Vector2;

class ThrustEvent extends BaseEvent
{
	private var m_Id : ActorId;
	private var m_Thrust : Vector2;

	public function new(id:ActorId, thrust:Vector2)
	{
		super(MT_EVENT_Thrust);	
		m_Id = id;
		m_Thrust = thrust;
	}

	public function GetId() : ActorId
	{
		return m_Id;
	}

	public function GetThrust() : Vector2
	{
		return m_Thrust;
	}
}