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

import JfVector2;
import JfCore;

class MtShape
{
	private var m_Pos:JfVector2;

	public function new(x:JfReal, y:JfReal)
	{
		m_Pos = new JfVector2(x,y);
	}

	public function getPos():JfVector2
	{
		return m_Pos;
	}

	public function setPos(pos:JfVector2):Void
	{
		m_Pos = pos;
	}

}
