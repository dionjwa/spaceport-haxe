// Adobe Documentation
// http://livedocs.adobe.com/livecycle/es/sdkHelp/common/langref/mx/graphics/codec/PNGEncoder.html

package spaceport.display;

@:native("sp.PNGEncoder")
extern class PNGEncoder 
{
	public function new(bitmapData:Dynamic) :Void;

	public static function encode(bitmapData:Dynamic):Dynamic ;

	public function nativeSerialize():Dynamic ;
}