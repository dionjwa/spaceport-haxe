// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/InteractiveObject.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.InteractiveObject")
extern class InteractiveObject extends DisplayObject 
{
	public var mouseEnabled(default, default):Bool;

	public function new() :Void;
}