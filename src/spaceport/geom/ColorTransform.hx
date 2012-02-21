// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/geom/ColorTransform.html

// Original Package
// flash.geom

package spaceport.geom;

extern class ColorTransform {

	// static properties

	// properties
	public var color(default, default):Float;
	public var redMultiplier(default, default):Float;
	public var blueMultiplier(default, default):Float;
	public var alphaOffset(default, default):Float;
	public var redOffset(default, default):Float;
	public var greenMultiplier(default, default):Float;
	public var alphaMultiplier(default, default):Float;
	public var greenOffset(default, default):Float;
	public var blueOffset(default, default):Float;

	// constructor
	public function new(?redMultiplier:Dynamic, ?greenMultiplier:Dynamic, ?blueMultiplier:Dynamic, ?alphaMultiplier:Dynamic, ?redOffset:Dynamic, ?greenOffset:Dynamic, ?blueOffset:Dynamic, ?alphaOffset:Dynamic) :Void;

	// static methods

	// methods
	public function concat(?second:ColorTransform):Void ;

}
