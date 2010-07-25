import MtCore;

class MtActorIDGenerator
{
	private static var m_Instance : MtActorIDGenerator = new MtActorIDGenerator();
	private var m_CurrentActorID : MtActorID;	

	private function new()
	{
		m_CurrentActorID = 0;
	}

	public function getNext() : MtActorID
	{
		return (++m_CurrentActorID);
	}

	static public function getInstance() : MtActorIDGenerator
	{
		return m_Instance;
	}
}
