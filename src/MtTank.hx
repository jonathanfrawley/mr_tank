
import JfCore;
import JfVector2;
import MtPhysicsBody;
import MtSphere;

class MtTank extends MtSphere, implements MtPhysicsBody
{
//	private var m_Pos:JfVector2;
	private var m_Dir:JfVector2;
//	private var m_Radius:JfReal;
	private var m_Speed:JfReal;
	private var m_TurretDir:JfReal;

	public function new(x:JfReal,y:JfReal)
	{
		super(x,y,20);
		//m_Pos = new JfVector2(x,y);
		//m_Radius = 20;
		m_Dir = new JfVector2(0,0);
		//m_TurretDir = new JfVector2(1,0);
		m_TurretDir = 0.0;
		m_Speed = 3;
	}

	public function step(timeStep:JfReal)
	{
//		m_Pos = m_Pos.add((m_Dir.multiply(m_Speed)).multiply(timeStep)); //TODO:Does this work okay?
		m_Pos = m_Pos.add(m_Dir.multiply(Math.ceil(timeStep)));
	}

	public function getDir():JfVector2
	{
		return m_Dir;
	}

	public function setDir(dir:JfVector2)
	{
		m_Dir = dir;
	}

	public function getTurretDir():JfReal
	{
		return m_TurretDir;
	}

	public function setTurretDir(dir:JfReal):Void
	{
		m_TurretDir = dir;
	}

	public function upPressed()
	{
		m_Dir.setY(-m_Speed);
	}

	public function upDepressed()
	{
		m_Dir.setY(0);
	}

	public function downPressed()
	{
		m_Dir.setY(m_Speed);
	}

	public function downDepressed()
	{
		m_Dir.setY(0);
	}

	public function leftPressed()
	{
		m_Dir.setX(-m_Speed);
	}

	public function leftDepressed()
	{
		m_Dir.setX(0);
	}

	public function rightPressed()
	{
		m_Dir.setX(m_Speed);
	}

	public function rightDepressed()
	{
		m_Dir.setX(0);
	}
}
