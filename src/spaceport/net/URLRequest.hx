// Original Package
// flash.net

package spaceport.net;

@:native("sp.URLRequest")
extern class URLRequest 
{
	public var data(default, default):Dynamic;
	public var url(default, default):String;
	public var method(default, default):String;

	public function new(?url:Dynamic) :Void;
}
