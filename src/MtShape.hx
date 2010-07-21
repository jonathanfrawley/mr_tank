
import JfVector2;
import JfCore;

class MtShape
{
	private var m_Pos:JfVector2;

	public function new(x:JfReal, y:JfReal)
	{
		m_Pos = new JfVector2(x,y);
	}

	public function getPos():JfVector2
	{
		return m_Pos;
	}

	public function setPos(pos:JfVector2):Void
	{
		m_Pos = pos;
	}

}
