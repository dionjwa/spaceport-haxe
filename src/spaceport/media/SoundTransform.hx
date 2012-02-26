package spaceport.media;

@:native("sp.SoundTransform")
extern class SoundTransform 
{
	public var volume(default, default):String;
	public var pan(default, default):String;
	public function new(vol:Dynamic, panning:Dynamic) :Void;
}