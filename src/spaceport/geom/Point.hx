// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/geom/Point.html

// Original Package
// flash.geom

package spaceport.geom;

@:native("sp.Point")
extern class Point 
{
	public var x(default, default):Float;
	public var y(default, default):Float;
	public var length(default, null):Float;

	public function new(?x:Float, ?y:Float) :Void;

	public static function polar(?len:Float, ?angle:Float):Point ;
	public static function distance(?pt1:Point, ?pt2:Point):Float ;
	public static function interpolate(?pt1:Point, ?pt2:Point, ?f:Float):Point ;

	public function clone():Point ;
	public function offset(?dx:Float, ?dy:Float):Void ;
	public function subtract(?v:Point):Point ;
	public function add(?v:Point):Point ;
	public function normalize(?thickness:Float):Void ;
	public function equals(?toCompare:Point):Bool ;
}
