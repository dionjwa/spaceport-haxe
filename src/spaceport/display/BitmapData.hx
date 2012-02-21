// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/BitmapData.html

// Original Package
// flash.display

package spaceport.display;

import spaceport.geom.Point;
import spaceport.geom.Matrix;
import spaceport.geom.Rectangle;
import spaceport.geom.ColorTransform;
import spaceport.events.IOErrorEvent;

@:native("sp.BitmapData")
extern class BitmapData 
{
	public var width(default, null):Float;
	public var rect(default, null):Rectangle;
	public var height(default, null):Float;
	public var transparent(default, null):Bool;

	public function new(?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic) :Void;

	public function copyPixels(?sourceBitmapData:BitmapData, ?sourceRect:Rectangle, ?destPoint:Point, ?alphaBitmapData:BitmapData, ?alphaPoint:Point, ?mergeAlpha:Bool):Void ;
	
	@:overload(function(source:spaceport.display.DisplayObject, ?matrix:spaceport.geom.Matrix, ?colorTransform:spaceport.geom.ColorTransform, ?blendMode:String, ?clipRect:spaceport.geom.Rectangle, ?smoothing:Bool):Void{})
	public function draw(source:BitmapData, ?matrix:Matrix, ?colorTransform:ColorTransform, ?blendMode:String, ?clipRect:Rectangle, ?smoothing:Bool):Void;
}