
import JfVector2;
import MtTankType;

class MtTankGraphics extends MtInitialisable
{
    private var m_Circle : flash.display.Shape;
	private var m_Turret : flash.display.Shape;
//    private static var m_CircleWidth = 50;
//    private static var m_CircleHeight = 50;
	private var m_Tank:MtTank;
//	private var m_StartingPos:JfVector2;

	public function new()
	{
        m_Circle = new flash.display.Shape();
		m_Turret = new flash.display.Shape();
		m_IsInit = false;
	}

	public function getTank()
	{
		return m_Tank;
	}

	public function init(tank:MtTank)
	{
		m_Tank = tank;
		if(m_Tank.getType() == MT_TANK_TYPE_PLAYER)
		{
			m_Circle.graphics.beginFill ( 0xEE0000 );
		}
		else
		{
			m_Circle.graphics.beginFill ( 0xEEEE00 );
		}
		m_Circle.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
        //m_Circle.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
        m_Circle.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), tank.getRadius());
        m_Circle.graphics.endFill();
//		m_StartingPos = tank.getPos();
		m_IsInit = true;
	}

	public function draw(mc:flash.display.MovieClip)
	{
		if(m_IsInit)
		{
			m_Circle.x = m_Tank.getPos().getX() - m_Tank.getRadius();
			m_Circle.y = m_Tank.getPos().getY() - m_Tank.getRadius();
			mc.addChild(m_Circle);

			//m_Turret.x = m_Tank.getPos().getX()+m_StartingPos.getX();
			//m_Turret.y = m_Tank.getPos().getY()+m_StartingPos.getY();

//			m_Turret.x = m_Tank.getPos().getX() + m_Tank.getRadius();
//			m_Turret.y = m_Tank.getPos().getY() + m_Tank.getRadius();
			m_Turret.x = m_Circle.x + m_Tank.getRadius();
			m_Turret.y = m_Circle.y + m_Tank.getRadius();
			m_Turret.graphics.clear();
			var turretDir:Float = m_Tank.getTurretDir();
			m_Turret.graphics.beginFill(0x990000);
			m_Turret.graphics.lineStyle ( 5, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
			m_Turret.graphics.lineTo((Math.cos(turretDir)*m_Tank.getRadius()), (Math.sin(turretDir)*m_Tank.getRadius()));

			m_Turret.graphics.endFill();
			mc.addChild(m_Turret);
		}
	}
}
