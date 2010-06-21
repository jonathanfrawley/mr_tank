
import MtShape;

class MtSphere extends MtShape
{
	private var m_Radius:Int;

	public function new(x:Int, y:Int, r:Int)
	{
		super(x,y);
		m_Radius = r;
	}


	public function getRadius():Int
	{
		return m_Radius;
	}
}
