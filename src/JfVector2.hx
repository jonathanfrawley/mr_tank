
class JfVector2
{
	private var m_X:Int;
	private var m_Y:Int;

	public function new(x:Int=0, y:Int=0)
	{
		m_X = x;
		m_Y = y;
	}	

	public function getX():Int
	{
		return m_X;
	}

	public function setX(x:Int)
	{
		m_X = x;
	}

	public function getY():Int
	{
		return m_Y;
	}

	public function setY(y:Int)
	{
		m_Y = y;
	}

	public function add(other:JfVector2):JfVector2
	{
		return new JfVector2(m_X+other.getX(), m_Y+other.getY());
	}

	public function multiply(scalar:Int):JfVector2
	{
		return new JfVector2(m_X*scalar, m_Y*scalar);
	}

	public function magnitude():Int
	{
		return Std.int(Math.sqrt(((m_X*m_X) + (m_Y*m_Y))));
	}

	public function normalized():JfVector2
	{
		var mag:Int = magnitude();
		return new JfVector2(Std.int(m_X/mag), Std.int(m_Y/mag));
	}
	
}
