// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/MouseEvent.html

// Original Package
// flash.events

package spaceport.events;

@:native("sp.MouseEvent")
extern class MouseEvent extends Event 
{
	public static var CLICK:String = "click";
	public static var MOUSE_DOWN:String = "mouseDown";
	public static var MOUSE_MOVE:String = "mouseMove";
	public static var MOUSE_UP:String = "mouseUp";

	public var localX(default, null):Float;
	public var localY(default, null):Float;
	public var stageX(default, null):Float;
	public var stageY(default, null):Float;

	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic, ?arg6:Dynamic, ?arg7:Dynamic, ?arg8:Dynamic, ?arg9:Dynamic, ?arg10:Dynamic, ?arg11:Dynamic, ?arg12:Dynamic, ?arg13:Dynamic) :Void;
}