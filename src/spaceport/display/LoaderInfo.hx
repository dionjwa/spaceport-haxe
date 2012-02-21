// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/LoaderInfo.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.LoaderInfo")
extern class LoaderInfo extends spaceport.events.EventDispatcher 
{
	public var loader(default, null):Loader;
	public var content(default, null):DisplayObject;
	public var applicationDomain(default, null):ApplicationDomain;

	public function new() :Void;

	public function destroy(deep:Dynamic):Dynamic ;
}