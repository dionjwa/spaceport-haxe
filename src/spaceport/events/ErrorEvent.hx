// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/ErrorEvent.html

// Original Package
// flash.events

package spaceport.events;

extern class ErrorEvent extends TextEvent
{
	public static var ERROR:String = "error";

	public var errorID(default, null):Float;

	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic) :Void;
}
