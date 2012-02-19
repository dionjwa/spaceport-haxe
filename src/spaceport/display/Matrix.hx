// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/geom/Matrix.html

// Original Package
// flash.geom

package spaceport.display;

@:native("sp.Matrix")
extern class Matrix 
{
	public var a(default, default):Float;
	public var b(default, default):Float;
	public var c(default, default):Float;
	public var d(default, default):Float;
	public var tx(default, default):Float;
	public var ty(default, default):Float;

	public function new(?a:Dynamic, ?b:Dynamic, ?c:Dynamic, ?d:Dynamic, ?tx:Dynamic, ?ty:Dynamic) :Void;

	public function concat(?m:Matrix):Void ;
	public function clone():Matrix ;
	public function translate(?tx:Float, ?ty:Float):Void ;
	public function createBox(?scaleX:Float, ?scaleY:Float, ?rotation:Float, ?tx:Float, ?ty:Float):Void ;
	public function rotate(?angle:Float):Void ;
	public function scale(?sx:Float, ?sy:Float):Void ;
	public function deltaTransformPoint(?point:Point):Point ;
	public function invert():Void ;
	public function identity():Void ;
	public function transformPoint(?point:Point):Point ;
}