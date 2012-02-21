// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/Event.html

// Original Package
// flash.events

package spaceport.events;

@:native("sp.Event")
extern class Event 
{
	public static var ENTER_FRAME:String = "enterFrame";
	public static var EXIT_FRAME:String = "exitFrame";
	public static var COMPLETE:String = "complete";
	public static var REMOVED_FROM_STAGE:String = "removedFromStage";
	public static var SOUND_COMPLETE:String = "soundComplete";
	public static var REMOVED:String = "removed";
	public static var MEMORY_NOTICE:String = "memoryNotice";
	public static var MEMORY_WARNING:String = "memoryWarning";
	public static var UNLOAD:String = "unload";
	public static var ADDED:String = "added";
	public static var ADDED_TO_STAGE:String = "addedToStage";
	public static var FRAME_CONSTRUCTED:String = "frameConstructed";
	public static var DEACTIVATE:String = "deactivate";
	public static var RENDER:String = "render";
	public static var RESIZE:String = "resize";
	public static var ACTIVATE:String = "activate";

	public var cancelable(default, null):Bool;
	public var type(default, null):String;
	public var bubbles(default, null):Bool;
	public var currentTarget(default, null):Dynamic;
	public var target(default, null):Dynamic;
	public var eventPhase(default, null):Float;

	public function new(?type:Dynamic, ?bubbles:Dynamic, ?cancelable:Dynamic) :Void;

	public function clone():Event ;
	public function stopImmediatePropagation():Void ;
	public function preventDefault():Void ;
	public function formatToString(?className:String, args:Dynamic):String ;
	public function isDefaultPrevented():Bool ;
	public function stopPropagation():Void ;
}