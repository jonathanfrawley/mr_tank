
import JfCore;
import MtShape;

class MtSphere extends MtShape
{
	private var m_Radius:JfReal;


	public function new(x:JfReal, y:JfReal, radius:JfReal)
	{
		super(x,y);
		m_Radius = radius;
	}

	public function getRadius():JfReal
	{
		return m_Radius;
	}

	/**
	 * Accounts for offset to centre.
     */
	public function getCentrePos():JfVector2
	{
//		return m_Pos.add(new JfVector2(m_Radius,m_Radius));
//		return getPos().add(new JfVector2(m_Radius,m_Radius));
		return getPos();
	}
}
