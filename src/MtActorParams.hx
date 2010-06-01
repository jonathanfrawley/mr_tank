
import JfVector2;
import MtColour;

enum MtActorType 
{
	MT_AT_Unknown;
	MT_AT_Tank
	MT_AT_Sphere;
}

//P.737 GC2
class MtActorParams
{
	private var m_Id : Int;
	private var m_Pos : JfVector2;
	private var m_Type : MtActorType;	

	public function new(id:Int)
	{
		m_Pos = new JfVector2();
		m_Type = MT_AT_Unknown;
		m_Id = id;
	}

}

class MtSphereParams : public MtActorParams
{
	private var m_Radius:Float;
	private var m_Segments:Int;
	private var m_Colour:MtColour;

	public function new(id:Int)
	{
		super(id);
		m_Type = MT_AT_Sphere;
		m_Radius = 1.0f;
		m_Segments = 16;
		m_Colour = MT_CL_RED;
	}
}


class MtTankParams : public MtActorParams
{
	private var m_Colour:MtColour;
	private var m_CannonAngle:Float;

	public function new(id:Int)
	{
		super(id);
		m_Type = MT_AT_Tank;
		m_Colour = MT_CL_GREEN;
		m_CanonAngle = 0.0f;
	}

}
