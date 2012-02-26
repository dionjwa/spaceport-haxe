// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/Stage.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.Stage")
extern class Stage extends DisplayObjectContainer 
{
	public var bgColor(default, default):String;
	public var stageHeight(default, null):Float;
	public var stageWidth(default, null):Float;
	public var frameRate(default, default):Float;

	public function new() :Void;
}