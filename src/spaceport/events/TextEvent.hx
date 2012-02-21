// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/TextEvent.html

// Original Package
// flash.events

package spaceport.events;

@:native("sp.TextEvent")
extern class TextEvent extends Event 
{
	public var text(default, null):String;
	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic) :Void;
}
