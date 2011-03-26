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
package mrtank.gameview;

import haxe.FastList;

import mrtank.actor.ActorId;
import mrtank.algebra.Point2;

class BaseGameView implements IGameView
{
	private var m_Id : ViewId;
	private var m_SceneNodes : FastList<ISceneNode>;

	public function new()
	{
		m_SceneNodes = new FastList<ISceneNode>();
	}

	public function Init() : Bool
	{
		return true;
	}

	public function OnUpdate() : Bool
	{
		return true;
	}

	public function OnRender() : Bool
	{
		for(node in m_SceneNodes)
		{
			node.OnRender();
		}
		return true;
	}

	public function GetId() : ViewId
	{
		return m_Id;
	}

	public function SetId(id:ViewId) : Void
	{
		m_Id = id;
	}
	
	public function AddSceneNode(node : ISceneNode) : Void
	{
		m_SceneNodes.add(node);
	}

	public function UpdateSceneNode(id:ActorId, pos:Point2, orientation:Float)
	{
		for(node in m_SceneNodes)
		{
			if(node.GetId() == id)
			{
				node.SetPos(pos);
				node.SetOrientation(orientation);
				return;
			}
		}
	}

}
