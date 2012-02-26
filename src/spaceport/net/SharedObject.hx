// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/net/SharedObject.html

// Original Package
// flash.net

package spaceport.net;

@:native("sp.SharedObject")
extern class SharedObject 
{
	public static function getLocal(?name:String, ?arg1:String, ?arg2:Bool):SharedObject ;

	public function new(name:Dynamic);
	
	public function flush(?arg0:Float):String ;
}