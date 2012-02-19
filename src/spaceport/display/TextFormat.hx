// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/text/TextFormat.html

// Original Package
// flash.text

package spaceport.display;

@:native("sp.TextFormat")
extern class TextFormat 
{
	public var bold(default, default):Dynamic;
	public var font(default, default):String;
	public var color(default, default):Dynamic;
	public var size(default, default):Dynamic;
	public var bullet(default, default):Dynamic;
	public var leftMargin(default, default):Dynamic;
	public var tabStops(default, default):Array<Dynamic>;
	public var letterSpacing(default, default):Dynamic;
	public var url(default, default):String;
	public var italic(default, default):Dynamic;
	public var target(default, default):String;
	public var underline(default, default):Dynamic;
	public var leading(default, default):Dynamic;
	public var indent(default, default):Dynamic;
	public var align(default, default):String;
	public var rightMargin(default, default):Dynamic;
	public var kerning(default, default):Dynamic;
	public var blockIndent(default, default):Dynamic;

	public function new(?font:Dynamic, ?size:Dynamic, ?color:Dynamic, ?bold:Dynamic, ?italic:Dynamic, ?underline:Dynamic, ?url:Dynamic, ?target:Dynamic, ?align:Dynamic, ?leftMargin:Dynamic, ?rightMargin:Dynamic, ?indent:Dynamic, ?leading:Dynamic) :Void;
}