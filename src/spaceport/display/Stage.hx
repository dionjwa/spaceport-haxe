// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/Stage.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.Stage")
extern class Stage extends DisplayObjectContainer {

	// static properties

	// properties
	public var bgColor(default, default):String;
	// public var stage(default, null):Stage;
	public var stageHeight(default, null):Float;
	public var stageWidth(default, null):Float;
	public var frameRate(default, default):Float;

	// constructor
	public function new() :Void;

	// static methods

	// methods

}