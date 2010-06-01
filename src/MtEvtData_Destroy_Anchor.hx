
import MtBaseEventData;
import MtEventType;
import MtCore;

class EvtData_Destroy_Actor : public MtBaseEventData
{
	private static sk_EventType : MtEventType;
	private m_Id : MtActorId;

	public function new( MtActorId id )
	{
		m_Id = id;
		sk_EventType = MT_Event_DestroyActor;
	}

   public function getEventType( ) : MtEventType
   { 
	   return sk_EventType; 
   }
};

