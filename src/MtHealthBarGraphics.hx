
class MtHealthBarGraphics extends MtInitialisable
{
    private var m_InnerBox : flash.display.Shape;
	private var m_OuterBox : flash.display.Shape;
//    private static var m_CircleWidth = 50;
//    private static var m_CircleHeight = 50;
	private var m_HealthBar:MtHealthBar;
//	private var m_StartingPos:JfVector2;

	public function new(healthBar:MtHealthBar)
	{
        m_OuterBox = new flash.display.Shape();
		m_InnerBox = new flash.display.Shape();
		m_HealthBar = healthBar;
		m_IsInit = false;
	}

	public function init()
	{
        m_OuterBox.graphics.beginFill ( 0x000000 );
        m_OuterBox.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
        //m_OuterBox.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
        //m_OuterBox.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), tank.getRadius());
        m_OuterBox.graphics.drawRect ( 0, 0, 50, 5 );
        m_OuterBox.graphics.endFill();
        m_InnerBox.graphics.beginFill ( 0x7CFC00 );
        m_InnerBox.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
        //m_InnerBox.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
        //m_InnerBox.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), tank.getRadius());
        m_InnerBox.graphics.drawRect ( 0, 0, 50, 5 );
        m_InnerBox.graphics.endFill();
//		m_StartingPos = tank.getPos();
		m_IsInit = true;
	}

	public function draw(mc:flash.display.MovieClip)
	{
		if(m_IsInit)
		{
//			m_Circle.x = m_Tank.getPos().getX() - m_Tank.getRadius();
//			m_Circle.y = m_Tank.getPos().getY() - m_Tank.getRadius();
			m_OuterBox.x = m_HealthBar.getTank().getPos().getX();
			m_OuterBox.y = m_HealthBar.getTank().getPos().getY();
			mc.addChild(m_OuterBox);
			m_InnerBox.graphics.clear();
			m_InnerBox.x = m_HealthBar.getTank().getPos().getX();
			m_InnerBox.y = m_HealthBar.getTank().getPos().getY();
			m_InnerBox.graphics.beginFill ( 0x7CFC00 );
			m_InnerBox.graphics.lineStyle ( 1, 0x000000, 1, false, flash.display.LineScaleMode.NONE );
			//m_InnerBox.graphics.drawCircle ( tank.getPos().getX(), tank.getPos().getY(), tank.getRadius());
			//m_InnerBox.graphics.drawCircle ( tank.getRadius(), tank.getRadius(), tank.getRadius());
			m_InnerBox.graphics.drawRect ( 0, 0, 50 * m_HealthBar.getFullness(), 5 );
			m_InnerBox.graphics.endFill();
			mc.addChild(m_InnerBox);

		}
	}
}
