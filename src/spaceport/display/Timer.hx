// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/utils/Timer.html

// Original Package
// flash.utils

package spaceport.display;

@:native("sp.Timer")
extern class Timer extends EventDispatcher {

	// static properties

	// properties
	public var delay(default, default):Float;
	public var running(default, null):Bool;
	public var currentCount(default, null):Float;
	public var repeatCount(default, default):Float;

	// constructor
	public function new(?delay:Dynamic, ?repeatCount:Dynamic);

	// static methods

	// methods
	public function stop():Void ;
	public function reset():Void ;
	public function start():Void ;

}