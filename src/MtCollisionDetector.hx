
import MtSphere;
import MtRectangle;

class MtCollisionDetector
{
	private static var m_Instance:MtCollisionDetector = new MtCollisionDetector();

	private function new()
	{
	}

	public function circleWithinRectangle(sphere:MtSphere, rectangle:MtRectangle):Bool
	{
		var xMin = rectangle.getPos().getX();
		var xMax = rectangle.getPos().getX()+rectangle.getWidth();
		var yMin = rectangle.getPos().getY();
		var yMax = rectangle.getPos().getY()+rectangle.getHeight();

		if( ((sphere.getPos().getX()-sphere.getRadius()) < xMin) ||
			((sphere.getPos().getX()+sphere.getRadius()) > xMax) ||	
			((sphere.getPos().getY()-sphere.getRadius()) < yMin) ||
			((sphere.getPos().getY()+sphere.getRadius()) > yMax) )
		{
			trace("Collision");
			return true;
		}
		return false;
	}

	static public function getInstance() : MtCollisionDetector
	{
		return m_Instance;
	}
}
