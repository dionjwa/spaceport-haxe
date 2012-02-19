// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/net/SharedObject.html

// Original Package
// flash.net

package spaceport.display;

extern class SharedObject {

	// static properties

	// properties

	// constructor
	public function new(name:Dynamic);

	// static methods
	public static function getLocal(?name:String, ?arg1:String, ?arg2:Bool):SharedObject ;

	// methods
	public function flush(?arg0:Float):String ;

}