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

class BasePhysicsBody implements IPhysicsBody
{
	private var m_Body : phx.Body;
	private var m_Id : ActorId;
	
	public function new()
	{
		m_Body = null;
	}

	public function SetId( val : ActorId ) : Void
	{
		m_Id = val;
	}

	public function GetId() : ActorId
	{
		return m_Id;
	}

	public function SetBody( val : phx.Body ) : Void
	{
		m_Body = val;
	}

	public function GetBody() : phx.Body
	{
		return m_Body;
	}
}
