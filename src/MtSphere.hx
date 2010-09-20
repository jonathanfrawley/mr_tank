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

import JfCore;
import MtShape;

class MtSphere extends MtShape
{
	private var m_Radius:JfReal;


	public function new(x:JfReal, y:JfReal, radius:JfReal)
	{
		super(x,y);
		m_Radius = radius;
	}

	public function getRadius():JfReal
	{
		return m_Radius;
	}

	/**
	 * Accounts for offset to centre.
     */
	public function getCentrePos():JfVector2
	{
//		return m_Pos.add(new JfVector2(m_Radius,m_Radius));
//		return getPos().add(new JfVector2(m_Radius,m_Radius));
		return getPos();
	}
}
