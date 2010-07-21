import JfCore;


class MtPhysicsSphere extends MtSphere, implements MtPhysicsBody
{
	private var m_Dir:JfReal;
	private var m_Speed:JfReal;

	public function new(x:JfReal, y:JfReal, dir:JfReal, speed:JfReal, radius:JfReal)
	{
		super(x,y,radius);
		m_Dir = dir;
		m_Speed = speed;
	}

	public function step(timeStep:Float):Void
	{
		var dirVec = new JfVector2((Math.cos(m_Dir)), (Math.sin(m_Dir)));
		m_Pos = m_Pos.add(dirVec.multiply(timeStep).multiply(m_Speed));
	}

	public function wallCollisionResponse():Void
	{
		m_Dir = m_Dir - Math.PI;
		step(1);
	}

	public function collidesWithRectangle(rectangle:MtRectangle):Bool
	{
		var xMin = rectangle.getPos().getX();
		var xMax = rectangle.getPos().getX()+rectangle.getWidth();
		var yMin = rectangle.getPos().getY();
		var yMax = rectangle.getPos().getY()+rectangle.getHeight();
		var pos:JfVector2 = getCentrePos();

		if( ((pos.getX()-m_Radius) < xMin) ||
			((pos.getX()+m_Radius) > xMax) ||	
			((pos.getY()-m_Radius) < yMin) ||
			((pos.getY()+m_Radius) > yMax) )
		{
			trace("Collision");
			return true;
		}
		return false;
	}

	public function getDir():JfReal
	{
		return m_Dir;
	}

	public function setDir(dir:JfReal)
	{
		m_Dir = dir;
	}
}
