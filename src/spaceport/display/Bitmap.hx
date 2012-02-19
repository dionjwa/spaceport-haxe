// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/Bitmap.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.Bitmap")
extern class Bitmap extends DisplayObject 
{
	public var smoothing(default, default):Bool;
	public var bitmapData(default, default):BitmapData;
	public var pixelSnapping(default, default):String;

	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic) :Void;

	public function getBounds(?targetCoordinateSpace:DisplayObject):Rectangle ;
}