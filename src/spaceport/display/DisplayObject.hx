// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/DisplayObject.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.DisplayObject")
extern class DisplayObject extends spaceport.event.EventDispatcher 
{
	public var transform(default, default):Transform;
	public var name(default, default):String;
	public var width(default, default):Float;
	public var cacheAsBitmapAnimatable(default, default):String;
	public var cacheAsBitmap(default, default):Bool;
	public var parent(default, null):DisplayObjectContainer;
	public var x(default, default):Float;
	public var y(default, default):Float;
	public var height(default, default):Float;
	public var stage(default, null):Stage;
	public var rotation(default, default):Float;
	public var filters(default, default):Array<Dynamic>;
	public var alpha(default, default):Float;
	public var visible(default, default):Bool;
	public var loaderInfo(default, null):LoaderInfo;
	public var scaleX(default, default):Float;
	public var scaleY(default, default):Float;

	public function new() :Void;

	public function localToGlobal(?point:Point):Point ;
	public function hitTestObject(?obj:DisplayObject):Bool ;
	public function getBounds(?targetCoordinateSpace:DisplayObject):Rectangle ;
	public function globalToLocal(?point:Point):Point ;
	public function destroy(deep:Dynamic):Dynamic ;
}