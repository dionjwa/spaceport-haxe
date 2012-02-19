// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/ErrorEvent.html

// Original Package
// flash.events

package spaceport.display;

extern class ErrorEvent extends TextEvent {

	// static properties
	public static var ERROR:String = "error";

	// properties
	public var errorID(default, null):Float;

	// constructor
	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic);

	// static methods

	// methods
	public function clone():Event ;

}