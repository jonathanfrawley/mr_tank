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

import JfCore;

class MtHealthBar
{
	private var m_MaximumHealth:JfReal;
	private var m_Health:JfReal;
	private var m_Tank:MtTank;

	public function new(tank:MtTank)
	{
		m_MaximumHealth = 100;
		m_Health = 100;
		m_Tank = tank;
	}

	public function registerHit()
	{
		if(m_Health > 0)
		{
			m_Health -= 10.0;
		}
	}
	
	public function getFullness()
	{
		return (m_Health/m_MaximumHealth);	
	}

	public function getTank()
	{
		return m_Tank;
	}
}
