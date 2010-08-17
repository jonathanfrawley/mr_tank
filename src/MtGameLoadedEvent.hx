
import MtEvent;
import MtEventType;
import MtStage;

class MtGameLoadedEvent extends MtEvent
{
	private var m_Stage:MtStage;

	public function new(stage:MtStage)
	{
		m_Type = MT_EVENT_GAMELOADED;
		m_Stage = stage;
	}	

	public function getStage():MtStage
	{
		return m_Stage;
	}
}
