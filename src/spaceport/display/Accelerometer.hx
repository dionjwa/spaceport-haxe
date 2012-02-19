// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/beta/reference/actionscript/3/flash/sensors/Accelerometer.html

package spaceport.display;

@:native("sp.Accelerometer")
extern class Accelerometer extends EventDispatcher {

	// static properties

	// properties

	// constructor
	public function new() :Void;

	// static methods

	// methods
	public function removeEventListener(?type:String, ?listener:Function, ?useCapture:Bool):Void ;
	public function addEventListener(?type:String, ?listener:Function, ?useCapture:Bool, ?priority:Float, ?arg4:Bool):Void ;

}