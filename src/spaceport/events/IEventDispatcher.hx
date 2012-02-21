package spaceport.events;

@:native("sp.EventDispatcher")
interface IEventDispatcher 
{
	public function dispatchEvent(event:Event):Bool ;
	public function removeEventListener(type:String, listener:Dynamic->Void, ?useCapture:Bool) :Void;
	public function willTrigger(type:String):Bool ;
	public function addEventListener(type:String, listener:Dynamic->Void, ?useCapture:Bool, ?priority:Float, ?arg4:Bool):Void ;
	public function hasEventListener(type:String):Bool ;
}
