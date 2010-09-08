import MtEvent;
import MtEventType;

class MtBulletDestroyedEvent extends MtEvent
{
	private var m_Bullet : MtBullet;

	public function new(bullet:MtBullet)
	{
		m_Type = MT_EVENT_BULLETDESTROYED;
		m_Bullet = bullet;
	}

	public function getBullet():MtBullet
	{
		return m_Bullet;
	}
}
