package spaceport;

@:native("haxe.Spaceport")
extern class Lib {
	/**
	  * This is null until spaceport is initialized
	  */
	public static var current :flash.display.MovieClip;
	/**
	  * Notifies callbacks when Spaceport is ready. 
	  */
	public static function onSpaceportReady (cb :Void->Void) :Void;
}
