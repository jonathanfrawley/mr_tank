import MtEvent;
import MtEventType;
import MtBullet;

class MtBulletCreatedEvent extends MtEvent
{
	private var m_Bullet:MtBullet;

	public function new(bullet:MtBullet)
	{
		m_Type = MT_EVENT_BULLETCREATED;
		m_Bullet = bullet;
	}

	public function getBullet()
	{
		return m_Bullet;
	}
}
