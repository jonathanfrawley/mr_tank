
import JfCore;
import MtShape;

class MtSphere extends MtShape
{
	private var m_Radius:JfReal;

	public function new(x:JfReal, y:JfReal, r:JfReal)
	{
		super(x,y);
		m_Radius = r;
	}

	public function getRadius():JfReal
	{
		return m_Radius;
	}
}
