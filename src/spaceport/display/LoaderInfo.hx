// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/LoaderInfo.html

// Original Package
// flash.display

package spaceport.display;

import spaceport.events.EventDispatcher;
import spaceport.system.ApplicationDomain;

@:native("sp.LoaderInfo")
extern class LoaderInfo extends EventDispatcher 
{
	public var loader(default, null):Loader;
	public var content(default, null):DisplayObject;
	public var applicationDomain(default, null):ApplicationDomain;

	public function new() :Void;

	public function destroy(deep:Dynamic):Dynamic ;
}