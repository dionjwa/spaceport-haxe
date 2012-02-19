// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/geom/Transform.html

// Original Package
// flash.geom

package spaceport.display;

@:native("sp.Transform")
extern class Transform 
{
	public var concatenatedColorTransform(default, null):ColorTransform;
	public var concatenatedMatrix(default, null):Matrix;
	public var colorTransform(default, default):ColorTransform;
	public var matrix(default, default):Matrix;

	public function new(?displayObject:Dynamic) :Void;

	public function nativeSerialize():Dynamic ;

}