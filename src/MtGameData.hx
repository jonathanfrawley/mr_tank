
class MtGameData
{
	private var m_Score:Int;

	public function new()
	{
		m_Score = 0;
	}

	public getScore()
	{
		return m_Score;
	}

	public setScore(score:Int)
	{
		m_Score = score;
	}
}
