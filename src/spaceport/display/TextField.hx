// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/text/TextField.html

// Original Package
// flash.text

package spaceport.display;

@:native("sp.TextEvent")
extern class TextField extends InteractiveObject 
{

	public var width(default, default):Float;
	public var text(default, default):String;
	public var wordWrap(default, default):Bool;
	public var height(default, default):Float;
	public var defaultTextFormat(default, default):TextFormat;
	public var htmlText(default, default):String;
	public var multiline(default, default):Bool;
	public var autoSize(default, default):String;

	public function new() :Void;
}