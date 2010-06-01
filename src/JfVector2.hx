
class JfVector2
{
	private var m_X:Int;
	private var m_Y:Int;

	public function new()
	{
		m_X = 0;
		m_Y = 0;
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
	
}
