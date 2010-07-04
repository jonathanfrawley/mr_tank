
import MtTank;
import MtBullet;
import MtInitialisable;
import JfVector2;

class MtBulletGraphics extends MtInitialisable
{
    private var m_Circle : flash.display.Shape;
	private var m_Bullet : MtBullet;

	public function new()
	{
        m_Circle = new flash.display.Shape();
		m_IsInit = false;
	}

	public function init(bullet:MtBullet, tank:MtTank)
	{
        m_Circle.graphics.beginFill ( 0x990000 );
        m_Circle.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
//        m_Circle.graphics.drawCircle ( bullet.getPos().getX(), bullet.getPos().getY(), bullet.getRadius());
        m_Circle.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), bullet.getRadius());
        m_Circle.graphics.endFill();
		m_Bullet = bullet;
		m_IsInit = true;
	}

	public function draw(mc:flash.display.MovieClip)
	{
		if(m_IsInit)
		{
			m_Circle.x = m_Bullet.getPos().getX();
			m_Circle.y = m_Bullet.getPos().getY();
			mc.addChild(m_Circle);
		}
	}
}
