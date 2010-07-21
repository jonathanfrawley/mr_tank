
interface MtPhysicsBody
{
	public function step(timeStep:Float):Void;
	public function wallCollisionResponse():Void;
	public function collidesWithRectangle(rectangle:MtRectangle):Bool;
}
