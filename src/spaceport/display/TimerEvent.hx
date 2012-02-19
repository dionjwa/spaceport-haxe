// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/TimerEvent.html

// Original Package
// flash.events

package spaceport.display;

@:native("sp.TimerEvent")
extern class TimerEvent extends Event 
{
	public static var TIMER_COMPLETE:String = "timerComplete";
	public static var TIMER:String = "timer";

	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic) :Void;

	public function clone():Event ;
}