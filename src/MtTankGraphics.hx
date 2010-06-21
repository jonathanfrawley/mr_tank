
import MtInitialisable;
import JfVector2;

class MtTankGraphics extends MtInitialisable
{
    private var m_Rectangle : flash.display.Shape;
	private var m_Turret : flash.display.Shape;
    private static var m_RectangleWidth = 50;
    private static var m_RectangleHeight = 50;
	private var m_Tank:MtTank;
	private var m_StartingPos:JfVector2;

	public function new()
	{
        m_Rectangle = new flash.display.Shape();
		m_Turret = new flash.display.Shape();
		m_IsInit = false;
	}

	public function init(tank:MtTank)
	{
        m_Rectangle.graphics.beginFill ( 0x990000 );
        m_Rectangle.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
        //m_Rectangle.graphics.drawRect ( tank.getPos().getX(), tank.getPos().getY(), tank.getWidth(), m_RectangleHeight);
        m_Rectangle.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
        m_Rectangle.graphics.endFill();
		m_StartingPos = tank.getPos();
/*
		m_Turret.graphics.beginFill(0x990000);
        m_Turret.graphics.lineStyle ( 5, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
		m_Turret.graphics.moveTo(tank.getPos().getX(), tank.getPos().getY());
		m_Turret.graphics.lineTo(tank.getRadius()*2,tank.getPos().getY());
		m_Turret.graphics.endFill();
*/
		m_Tank = tank;
		m_IsInit = true;
	}

	public function draw(mc:flash.display.MovieClip)
	{
		if(m_IsInit)
		{
			m_Rectangle.x = m_Tank.getPos().getX();
			m_Rectangle.y = m_Tank.getPos().getY();
			mc.addChild(m_Rectangle);
/*
			m_Turret.x = m_Tank.getPos().getX();
			m_Turret.y = m_Tank.getPos().getY();
			m_Turret.graphics.clear();
*/
			m_Turret.x = m_Tank.getPos().getX()+m_StartingPos.getX();
			m_Turret.y = m_Tank.getPos().getY()+m_StartingPos.getY();
			m_Turret.graphics.clear();
//			var dirNormal:JfVector2;
			//dirNormal = m_Tank.getTurretDir().normalized();
//			dirNormal = m_Tank.getTurretDir().normalized();
			var turretDir:Float = m_Tank.getTurretDir();
			m_Turret.graphics.beginFill(0x990000);
			m_Turret.graphics.lineStyle ( 5, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
			//m_Turret.graphics.moveTo(m_Tank.getPos().getX()+m_Tank.getRadius(), m_Tank.getPos().getY()+m_Tank.getRadius());
			//m_Turret.graphics.moveTo(m_Tank.getRadius(), m_Tank.getRadius());
			//m_Turret.graphics.lineTo(dirNormal.getX()*m_Tank.getRadius()*2, dirNormal.getY() * m_Tank.getRadius()*2);
			//m_Turret.graphics.lineTo(m_Tank.getPos().getX() + m_Tank.getRadius() + dirNormal.getX(), m_Tank.getPos().getY() + m_Tank.getRadius() + dirNormal.getY());

			//m_Turret.graphics.moveTo(m_Tank.getPos().getX(), m_Tank.getPos().getY());
			//m_Turret.graphics.moveTo(0, 0);
			//m_Turret.graphics.lineTo(m_Tank.getPos().getX() + (dirNormal.getX()*m_Tank.getRadius()), m_Tank.getPos().getY() + (dirNormal.getY()*m_Tank.getRadius()));

//			m_Turret.graphics.lineTo((dirNormal.getX()*m_Tank.getRadius()), (dirNormal.getY()*m_Tank.getRadius()));
			m_Turret.graphics.lineTo((Math.cos(turretDir)*m_Tank.getRadius()), (Math.sin(turretDir)*m_Tank.getRadius()));

			m_Turret.graphics.endFill();
			mc.addChild(m_Turret);
		}
	}
}
