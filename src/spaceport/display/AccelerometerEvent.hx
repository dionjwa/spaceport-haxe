// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/beta/reference/actionscript/3/flash/events/AccelerometerEvent.html

package spaceport.display;

extern class AccelerometerEvent extends Event {

	// static properties
	public static var STATUS:String = "status";
	public static var UPDATE:String = "update";

	// properties
	public var accelerationX(default, null):String;
	public var accelerationY(default, null):String;
	public var accelerationZ(default, null):String;

	// constructor
	public function new() :Void;

	// static methods

	// methods
	public function clone():Event ;

}