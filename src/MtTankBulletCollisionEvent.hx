import MtEvent;
import MtEventType;

class MtTankBulletCollisionEvent extends MtEvent
{
	private var m_Tank : MtTank;
	private var m_Bullet : MtBullet;

	public function new(tank:MtTank, bullet:MtBullet)
	{
		m_Type = MT_EVENT_TANK_BULLET_COLLISION;
		m_Tank = tank;
		m_Bullet = bullet;
	}

	public function getTank():MtTank
	{
		return m_Tank;
	}

	public function getBullet():MtBullet
	{
		return m_Bullet;
	}
}
