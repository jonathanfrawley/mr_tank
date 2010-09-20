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

import JfVector2;
import MtColour;

enum MtActorType 
{
	MT_AT_Unknown;
	MT_AT_Tank
	MT_AT_Sphere;
}

//P.737 GC2
class MtActorParams
{
	private var m_Id : Int;
	private var m_Pos : JfVector2;
	private var m_Type : MtActorType;	

	public function new(id:Int)
	{
		m_Pos = new JfVector2();
		m_Type = MT_AT_Unknown;
		m_Id = id;
	}

}

class MtSphereParams : public MtActorParams
{
	private var m_Radius:Float;
	private var m_Segments:Int;
	private var m_Colour:MtColour;

	public function new(id:Int)
	{
		super(id);
		m_Type = MT_AT_Sphere;
		m_Radius = 1.0f;
		m_Segments = 16;
		m_Colour = MT_CL_RED;
	}
}


class MtTankParams : public MtActorParams
{
	private var m_Colour:MtColour;
	private var m_CannonAngle:Float;

	public function new(id:Int)
	{
		super(id);
		m_Type = MT_AT_Tank;
		m_Colour = MT_CL_GREEN;
		m_CanonAngle = 0.0f;
	}

}
