// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/KeyboardEvent.html

// Original Package
// flash.events

package spaceport.events;

extern class KeyboardEvent extends Event {

	// static properties
	public static var KEY_DOWN:String = "keyDown";
	public static var KEY_UP:String = "keyUp";

	// properties
	public var commandKey(default, null):Bool;
	public var altKey(default, null):Bool;
	public var ctrlKey(default, null):Bool;
	public var shiftKey(default, null):Bool;
	public var keyCode(default, null):Float;
	public var charCode(default, null):Float;
	public var keyLocation(default, null):Float;

	// constructor
	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic, ?arg5:Dynamic, ?arg6:Dynamic, ?arg7:Dynamic, ?arg8:Dynamic, ?arg9:Dynamic, ?arg10:Dynamic);

	// static methods

	// methods
	public function clone():Event ;

}