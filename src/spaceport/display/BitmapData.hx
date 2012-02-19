// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/BitmapData.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.BitmapData")
extern class BitmapData 
{
	public var width(default, null):Float;
	public var rect(default, null):Rectangle;
	public var height(default, null):Float;
	public var transparent(default, null):Bool;

	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic) :Void;

	public function copyPixels(?arg0:BitmapData, ?arg1:Rectangle, ?arg2:Point, ?arg3:BitmapData, ?arg4:Point, ?arg5:Bool):Void ;
	public function draw(?arg0:[BitmapData, DisplayObject], ?arg1:Matrix, ?arg2:ColorTransform, ?arg3:String, ?arg4:Rectangle, ?arg5:Bool):Void ;
}