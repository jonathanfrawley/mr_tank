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

import MtSphere;
import MtRectangle;
import MtPhysicsBody;

class MtCollisionDetector
{
	private static var m_Instance:MtCollisionDetector = new MtCollisionDetector();

	private function new()
	{
	}

	public function bodyWithinRectangle(body:MtPhysicsBody, rectangle:MtRectangle):Bool
	{
		if(body.collidesWithRectangle(rectangle))
		{
			return true;
		}
		return false;

	}

	public function bodyWithinSphere(body:MtPhysicsBody, sphere:MtSphere):Bool
	{
		if(body.collidesWithSphere(sphere))
		{
			return true;
		}
		return false;

	}

/*
	public function bodyWithinRectangle(body:MtPhysicsBody, rectangle:MtRectangle):Bool
	{
		//Identity collision detection
		return false;
	}
*/

	static public function getInstance() : MtCollisionDetector
	{
		return m_Instance;
	}
}
