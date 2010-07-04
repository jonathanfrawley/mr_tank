
import JfCore;

class JfVector2
{
	private var m_X:JfReal;
	private var m_Y:JfReal;

	public function new(x:JfReal=0, y:JfReal=0)
	{
		m_X = x;
		m_Y = y;
	}	

	public function getX():JfReal
	{
		return m_X;
	}

	public function setX(x:JfReal)
	{
		m_X = x;
	}

	public function getY():JfReal
	{
		return m_Y;
	}

	public function setY(y:JfReal)
	{
		m_Y = y;
	}

	public function add(other:JfVector2):JfVector2
	{
		return new JfVector2(m_X+other.getX(), m_Y+other.getY());
	}

	public function multiply(scalar:JfReal):JfVector2
	{
		return new JfVector2(m_X*scalar, m_Y*scalar);
	}

	public function magnitude():JfReal
	{
		return Math.sqrt(((m_X*m_X) + (m_Y*m_Y)));
	}

	public function normalized():JfVector2
	{
		var mag:JfReal = magnitude();
		return new JfVector2(m_X/mag, m_Y/mag);
	}
	
	
}
