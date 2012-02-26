// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/utils/Timer.html

// Original Package
// flash.utils

package spaceport.utils;

import spaceport.events.EventDispatcher;

@:native("sp.Timer")
extern class Timer extends EventDispatcher 
{
	public var delay(default, default):Float;
	public var running(default, null):Bool;
	public var currentCount(default, null):Float;
	public var repeatCount(default, default):Float;

	public function new(?delay:Dynamic, ?repeatCount:Dynamic) :Void;

	public function stop():Void ;
	public function reset():Void ;
	public function start():Void ;
}