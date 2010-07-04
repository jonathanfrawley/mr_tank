
import MtCore;

class JfVector2
{
	private var m_X:MtFloat;
	private var m_Y:MtFloat;

	public function new(x:MtFloat=0, y:MtFloat=0)
	{
		m_X = x;
		m_Y = y;
	}	

	public function getX():MtFloat
	{
		return m_X;
	}

	public function setX(x:MtFloat)
	{
		m_X = x;
	}

	public function getY():MtFloat
	{
		return m_Y;
	}

	public function setY(y:MtFloat)
	{
		m_Y = y;
	}

	public function add(other:JfVector2):JfVector2
	{
		return new JfVector2(m_X+other.getX(), m_Y+other.getY());
	}

	public function multiply(scalar:MtFloat):JfVector2
	{
		return new JfVector2(m_X*scalar, m_Y*scalar);
	}

	public function magnitude():MtFloat
	{
		return Std.int(Math.sqrt(((m_X*m_X) + (m_Y*m_Y))));
	}

	public function normalized():JfVector2
	{
		var mag:MtFloat = magnitude();
		return new JfVector2(Std.int(m_X/mag), Std.int(m_Y/mag));
	}
	
}
