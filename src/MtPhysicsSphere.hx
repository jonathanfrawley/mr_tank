import JfCore;
import MtCore;


class MtPhysicsSphere extends MtSphere, implements MtPhysicsBody
{
	private var m_Dir : JfReal;
	private var m_Speed : JfReal;
	private var m_ActorID : MtActorID;
	private var m_HaxeBody : phx.Body;
	private var m_HaxeShape : phx.Shape;

	public function new(x:JfReal, y:JfReal, dir:JfReal, speed:JfReal, radius:JfReal)
	{
		super(x,y,radius);
		m_Dir = dir;
		m_Speed = speed;
		setActorID(MtActorIDGenerator.getInstance().getNext());

		//Setup haxe
		m_HaxeBody = new phx.Body(x,y);
		m_HaxeShape = new phx.Circle(radius, new phx.Vector(0,0));
		m_HaxeBody.addShape( m_HaxeShape );
	}

	public function getBody()
	{
		return m_HaxeBody;
	}

	public function getShape()
	{
		return m_HaxeShape;
	}

	public function step(timeStep:Float):Void
	{
		var dirVec = new JfVector2((Math.cos(m_Dir)), (Math.sin(m_Dir)));
		m_Pos = m_Pos.add(dirVec.multiply(timeStep).multiply(m_Speed));
	}

	public function wallCollisionResponse():Void
	{
/**
		***NB:Can't do this, need to know normal direction.
		*** Need to get passed in contact information here.
		var cosDir = Math.cos(m_Dir);
		var sinDir = Math.sin(m_Dir);
		var tanDir = Math.tan(m_Dir);
		//determine quadrant and adjust angle accordingly
		if((cosDir > 0) && (sinDir > 0) && (tanDir > 0))
		{
			m_Dir = m_Dir + (Math.PI/2);
		}
		else if((cosDir < 0) && (sinDir > 0) && (tanDir < 0))
		{
			m_Dir = m_Dir - (Math.PI/2);
		}
		else if((cosDir < 0) && (sinDir < 0) && (tanDir > 0))
		{
			m_Dir = m_Dir + (Math.PI/2);
		}
		else if((cosDir > 0) && (sinDir < 0) && (tanDir < 0))
		{
			//m_Dir = m_Dir - (Math.PI/2);
			m_Dir = m_Dir + Math.PI;
		}	
		else
		{
			m_Dir = m_Dir - Math.PI;
		}
**/
		m_Dir = m_Dir - Math.PI;
		step(1);
	}

	//XXX:Need to put above in superclass
	public override function getPos()
	{
		return new JfVector2(m_HaxeBody.x, m_HaxeBody.y);
	}
/*
	public override function getCentrePos()
	{
		return new JfVector2(m_HaxeBody.x, m_HaxeBody.y);
	}
*/

	public function collidesWithRectangle(rectangle:MtRectangle):Bool
	{
		var xMin = rectangle.getPos().getX();
		var xMax = rectangle.getPos().getX()+rectangle.getWidth();
		var yMin = rectangle.getPos().getY();
		var yMax = rectangle.getPos().getY()+rectangle.getHeight();
		var pos:JfVector2 = getCentrePos();

		if( ((pos.getX()-m_Radius) < xMin) ||
			((pos.getX()+m_Radius) > xMax) ||	
			((pos.getY()-m_Radius) < yMin) ||
			((pos.getY()+m_Radius) > yMax) )
		{
			trace("Collision");
			return true;
		}
		return false;
	}

	public function collidesWithSphere(sphere:MtSphere):Bool
	{
		var myX = m_Pos.getX();
		var myY = m_Pos.getY();
		var sphereX = sphere.getPos().getX();	
		var sphereY = sphere.getPos().getY();
		//var radiusSquared = m_Radius * m_Radius;
		var radiusSquared = sphere.getRadius() * sphere.getRadius();
		var xs = sphereX - myX;
		var ys = sphereY - myY;
		if( radiusSquared > ((xs * xs) + (ys * ys)) )
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public function getDir():JfReal
	{
		return m_HaxeBody.a;
	}

/*
	public function getDir():JfReal
	{
		return m_Dir;
	}
*/

	public function setDir(dir:JfReal)
	{
		m_Dir = dir;
	}

	public function setActorID(id:MtActorID):Void
	{
		m_ActorID = id;
	}

	public function getActorID():MtActorID
	{
		return m_ActorID;
	}

}
