import MtEvent;
import MtEventType;

class MtBulletWallCollisionEvent extends MtEvent
{
	private var m_Bullet : MtBullet;

	public function new(bullet:MtBullet)
	{
		m_Type = MT_EVENT_BULLET_WALL_COLLISION;
		m_Bullet = bullet;
	}

	public function getBullet():MtBullet
	{
		return m_Bullet;
	}
}
