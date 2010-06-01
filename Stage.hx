
class Stage 
{
	private var m_Width : Int;
	private var m_Height : Int;
	private var m_X : Int;
	private var m_Y : Int;

	public function new(w,h,x,y)
	{
		m_Width = w;
		m_Height = h;
		m_X = x;
		m_Y = y;
	}

	public function getWidth()
	{
		return m_Width;
	}

	public function getHeight()
	{
		return m_Height;
	}

	public function getX()
	{
		return m_X;
	}

	public function getY()
	{
		return m_Y;
	}
}