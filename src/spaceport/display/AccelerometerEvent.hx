// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/beta/reference/actionscript/3/flash/events/AccelerometerEvent.html

package spaceport.display;

import spaceport.events.Event;

extern class AccelerometerEvent extends Event 
{
	public static var STATUS:String = "status";
	public static var UPDATE:String = "update";

	public var accelerationX(default, null):String;
	public var accelerationY(default, null):String;
	public var accelerationZ(default, null):String;

	public function new() :Void;
}