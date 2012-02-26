package spaceport.transitions;

import spaceport.events.Event;

@:native("sp.TweenEvent")
extern class TweenEvent extends Event 
{
	public static var MOTION_CHANGE:String = "motionChange";
	public static var MOTION_LOOP:String = "motionLoop";
	public static var MOTION_STOP:String = "motionStop";
	public static var MOTION_FINISH:String = "motionFinish";
	public static var MOTION_RESUME:String = "motionResume";
	public static var MOTION_START:String = "motionStart";

	public var position(default, default):String;
	public var time(default, default):String;

	public function new(type:Dynamic, time:Dynamic, position:Dynamic, bubbles:Dynamic, cancelable:Dynamic) :Void;

	public function clone():Event ;
}