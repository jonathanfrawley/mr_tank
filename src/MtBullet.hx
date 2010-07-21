
import JfCore;
import MtSphere;
import MtPhysicsBody;
import MtBullet;
import JfVector2;

class MtBullet extends MtPhysicsSphere
{
//	private var m_Dir:JfReal;
//	private var m_Speed:JfReal;
	private var m_TankRadius:JfReal;

	public function new(x:JfReal, y:JfReal, dir:JfReal, radiusTank:JfReal)
	{
		super(x,y,dir,2,5);
		m_TankRadius = radiusTank;

//		super(160.0,160.0,5);
//		m_Dir = new JfVector2(xVel,yVel);
//		m_Dir = dir;
//		m_Speed = 3;
	}
/*
	public override function step(timeStep:JfReal)
	{
		var dirVec = new JfVector2((Math.cos(m_Dir)*4), (Math.sin(m_Dir)*4));
		m_Pos = m_Pos.add(dirVec.multiply(timeStep).multiply(m_Speed));
	}
*/
	public override function collidesWithRectangle(rectangle:MtRectangle):Bool
	{
		var xMin = rectangle.getPos().getX() - m_TankRadius;
		var xMax = rectangle.getPos().getX()+rectangle.getWidth() - m_TankRadius;
		var yMin = rectangle.getPos().getY() - m_TankRadius;
		var yMax = rectangle.getPos().getY()+rectangle.getHeight() - m_TankRadius;
		var pos:JfVector2 = m_Pos;

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

}
