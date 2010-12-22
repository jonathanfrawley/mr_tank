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

import mrtank.EventType;

class NewActorEvent extends BaseEvent
{
	private var m_Actor : IActor;

	public function new(actor:IActor)
	{
		super(MT_EVENT_NewActor);	
		m_Actor = actor;
	}

	public function GetActor() : IActor
	{
		return m_Actor;
	}
}
