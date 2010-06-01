
import MtBaseGame;
import JfVector2;

class MtGame extends MtBaseGame
{
	private m_LifeTime : float; // How long game has been in session;
	private m_StartPosition : JfVector2;

	public function new()
	{
		super();


		var stage = new MtStage(MtStageConstants.SCREEN_WIDTH-10, MtStageConstants.SCREEN_HEIGHT-10, 5, 5);

		graphicsHandler.setMtStage(stage);

		graphicsHandler.display();

	}

	public function onUpdate()
	{

	}

	public function createTank() : MtActorId //TODO
	{

	}

	public void removeActor(mtActorId id)
	{
	}

	public void addView(mtIGameView view) //TODO
	{
	}

	public RegisterHit(ActorId sphere)
	{
	}
	


}
