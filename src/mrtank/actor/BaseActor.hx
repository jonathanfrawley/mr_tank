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

package mrtank.actor;

import mrtank.algebra.Point2;
import mrtank.gameview.ViewId;

class BaseActor implements IActor
{
	private var m_Pos : Point2;
	private var m_Orientation : Float;
	private var m_Id : ActorId;
	private var m_ViewId : ViewId;
	private var m_Type : ActorType;
	
	public function new(type:ActorType)
	{
		m_Pos = new Point2(0,0);
		m_Type = type;
	}

	public function GetPos() : Point2
	{
		return m_Pos;
	}

	public function SetPos( val : Point2 ) : Void
	{
		m_Pos = val;
	}

	public function GetOrientation() : Float
	{
		return m_Orientation;
	}

	public function SetId( val : ActorId ) : Void
	{
		m_Id = val;
	}
	public function GetId() : ActorId
	{
		return m_Id;
	}

	public function SetViewId( val : ViewId ) : Void
	{
		m_ViewId = val;
	}
	public function GetViewId() : ViewId
	{
		return m_ViewId;
	}

	public function GetType() : ActorType
	{
		return m_Type;
	}
}
