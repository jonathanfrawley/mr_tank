import MtCore;

interface MtPhysicsBody implements MtActor
{
	public function step(timeStep:Float):Void;
	public function wallCollisionResponse():Void;
	public function collidesWithRectangle(rectangle:MtRectangle):Bool;
	public function collidesWithSphere(sphere:MtSphere):Bool;
	public function setActorID(id:MtActorID):Void;
	public function getActorID():MtActorID;
}
