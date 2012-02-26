// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/system/ApplicationDomain.html

// Original Package
// flash.system

package spaceport.system;

@:native("sp.ApplicationDomain")
extern class ApplicationDomain 
{
	public var definitions(default, null):String;

	public function new(?arg0:Dynamic) :Void;

	public function getDefinition(?name:String):Dynamic ;
	public function hasDefinition(?name:String):Bool ;
	public function destroy(deep:Dynamic):Dynamic ;
}