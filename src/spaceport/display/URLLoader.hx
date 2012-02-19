// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/net/URLLoader.html

// Original Package
// flash.net

package spaceport.display;

@:native("sp.URLLoader")
extern class URLLoader extends EventDispatcher 
{
	public var data(default, default):Dynamic;
	public function new(?arg0:Dynamic) :Void;
	public function load(?arg0:URLRequest):Void ;
}