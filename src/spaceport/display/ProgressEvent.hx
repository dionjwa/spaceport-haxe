// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/ProgressEvent.html

// Original Package
// flash.events

package spaceport.display;

extern class ProgressEvent extends Event {

	// static properties
	public static var PROGRESS:String = "progress";

	// properties
	public var bytesTotal(default, default):Float;
	public var bytesLoaded(default, default):Float;

	// constructor
	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic);

	// static methods

	// methods
	public function clone():Event ;

}