// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/IOErrorEvent.html

// Original Package
// flash.events

package spaceport.events;

@:native("sp.IOErrorEvent")
extern class IOErrorEvent extends ErrorEvent 
{
	public static var IO_ERROR:String = "ioError";

	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic, ?arg4:Dynamic) :Void;
}
