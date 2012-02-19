// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/FrameLabel.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.FrameLabel")
extern class FrameLabel 
{
	public var name(default, null):String;
	public var frame(default, null):Float;

	public function new(?name:Dynamic, ?frame:Dynamic) :Void;
}