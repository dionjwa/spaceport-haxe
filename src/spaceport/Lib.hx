package spaceport;

import spaceport.display.MovieClip;
import spaceport.display.Stage;

class Lib 
{
	static function __init__ () :Void 
	{
		//Add the spaceport main function.
		untyped __js__('function main (stage) {spaceport.Lib.main(stage);}');
	}
	
	/**
	  * This is null until spaceport is initialized
	  */
	public static var current :MovieClip;
	
	private static var ready :Bool;
	private static var readyCallbacks :Array<Void->Void> = [];
	/**
	  * Notifies callbacks when Spaceport is ready. 
	  */
	public static function onSpaceportReady (cb :Void->Void) :Void
	{
		readyCallbacks.push(cb);
	}
	
	static function main (stage :Stage) :Void
	{
		trace("Spaceport initialized, adding flash.Lib.current to the stage.");
		current = new MovieClip();
		ready = true;
		stage.addChild(current);
		while (readyCallbacks.length > 0) {
			readyCallbacks.pop()();
		}
	}
}
