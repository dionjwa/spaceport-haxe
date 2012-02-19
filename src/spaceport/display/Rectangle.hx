// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/geom/Rectangle.html

// Original Package
// flash.geom

package spaceport.display;

@:native("sp.Rectangle")
extern class Rectangle {

	public var left(default, default):Float;
	public var width(default, default):Float;
	public var size(default, default):Point;
	public var bottomRight(default, default):Point;
	public var bottom(default, default):Float;
	public var topLeft(default, default):Point;
	public var right(default, default):Float;
	public var x(default, default):Float;
	public var y(default, default):Float;
	public var top(default, default):Float;
	public var height(default, default):Float;

	public function new(?x:Float, ?y:Float, ?width:Float, ?height:Float) :Void;

	public function clone():Rectangle ;
	public function offsetPoint(?point:Point):Void ;
	public function offset(?dx:Float, ?dy:Float):Void ;
	public function intersects(?toIntersect:Rectangle):Bool ;
	public function setEmpty():Void ;
	public function intersection(?toIntersect:Rectangle):Rectangle ;
	public function inflate(?dx:Float, ?dy:Float):Void ;
	public function isEmpty():Bool ;
	public function containsPoint(?point:Point):Bool ;
	public function containsRect(?rect:Rectangle):Bool ;
	public function union(?toUnion:Rectangle):Rectangle ;
	public function contains(?x:Float, ?y:Float):Bool ;
	public function inflatePoint(?point:Point):Void ;
	public function equals(?toCompare:Rectangle):Bool ;
}