// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/EventDispatcher.html

// Original Package
// flash.events

package spaceport.events;

@:native("sp.EventDispatcher")
extern class EventDispatcher implements IEventDispatcher
{
	public function new(?arg0:EventDispatcher) :Void;

	public function dispatchEvent(event:Event):Bool ;
	public function removeEventListener(type:String, listener:Dynamic->Void, ?useCapture:Bool) :Void;
	public function willTrigger(type:String):Bool ;
	public function addEventListener(type:String, listener:Dynamic->Void, ?useCapture:Bool, ?priority:Float, ?arg4:Bool):Void ;
	public function hasEventListener(type:String):Bool ;
}