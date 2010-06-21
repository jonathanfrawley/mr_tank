
import MtShape;

class MtRectangle extends MtShape
{
	private var m_Width : Int;
	private var m_Height : Int;

	public function new(w:Int,h:Int,x:Int=10,y:Int=10)
	{
		super(x,y);
		m_Width = w;
		m_Height = h;
	}

	public function getWidth()
	{
		return m_Width;
	}

	public function getHeight()
	{
		return m_Height;
	}
}
