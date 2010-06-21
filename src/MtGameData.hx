
class MtGameData
{
	private var m_Score:Int;

	public function new()
	{
		m_Score = 0;
	}

	public function getScore():Int
	{
		return m_Score;
	}

	public function setScore(score:Int)
	{
		m_Score = score;
	}
}
