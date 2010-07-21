
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
