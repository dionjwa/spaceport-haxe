// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/Loader.html

// Original Package
// flash.display

package spaceport.display;

import spaceport.net.URLRequest;

@:native("sp.Loader")
extern class Loader extends DisplayObjectContainer 
{
	public var contentLoaderInfo(default, null):LoaderInfo;
	public var content(default, null):DisplayObject;

	public function new() :Void;

	public function load(?arg0:URLRequest) :Void;
}