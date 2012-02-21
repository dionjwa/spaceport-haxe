package spaceport;

@:native("haxe.Spaceport")
extern class Lib {
	public static var current :flash.display.MovieClip;
	public static function onSpaceportReady (cb :Void->Void) :Void;
}
