// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/beta/reference/actionscript/3/flash/sensors/Accelerometer.html

package spaceport.display;

import spaceport.events.EventDispatcher;

@:native("sp.Accelerometer")
extern class Accelerometer extends EventDispatcher 
{
	public function removeEventListener(?type:String, ?listener:Dynamic->Void, ?useCapture:Bool):Void ;
	public function new() :Void;
	public function addEventListener(?type:String, ?listener:Dynamic->Void, ?useCapture:Bool, ?priority:Float, ?arg4:Bool):Void ;
}