// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/TouchEvent.html

// Original Package
// flash.events

package spaceport.events;

@:native("sp.TouchEvent")
extern class TouchEvent extends Event 
{
	public static var TOUCH_MOVE:String = "touchMove";
	public static var TOUCH_BEGIN:String = "touchBegin";
	public static var TOUCH_END:String = "touchEnd";

	public var localX(default, null):String;
	public var localY(default, null):String;
	public var touchPointID(default, null):String;
	public var stageX(default, null):String;
	public var stageY(default, null):String;

	public function new() :Void;

	public function clone():Event ;
}