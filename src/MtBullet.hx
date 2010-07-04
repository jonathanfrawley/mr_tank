
import JfCore;
import MtSphere;
import MtPhysicsBody;
import MtBullet;
import JfVector2;

class MtBullet extends MtSphere, implements MtPhysicsBody
{
	private var m_Dir:JfReal;
	private var m_Speed:JfReal;

	public function new(x:JfReal, y:JfReal, dir:JfReal)
	{
		super(x,y,5);
//		super(160.0,160.0,5);
//		m_Dir = new JfVector2(xVel,yVel);
		m_Dir = dir;
		m_Speed = 3;
	}

	public function step(timeStep:JfReal)
	{
		var dirVec = new JfVector2((Math.cos(m_Dir)*4), (Math.sin(m_Dir)*4));
		m_Pos = m_Pos.add(dirVec.multiply(timeStep).multiply(m_Speed));
	}

}
