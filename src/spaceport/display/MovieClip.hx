// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/MovieClip.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.MovieClip")
extern class MovieClip extends Sprite 
{
	public var currentFrame(default, null):Float;
	public var totalFrames(default, null):Float;
	public var isPlaying(default, null):String;
	public var currentLabels(default, null):Array<Dynamic>;
	public var currentLabel(default, null):String;

	public function new() :Void;

	public function play():Void ;
	public function stop():Void ;
	public function gotoAndPlay(?arg0:Dynamic, ?arg1:String):Void ;
	public function gotoAndStop(?arg0:Dynamic, ?arg1:String):Void ;
	public function prevFrame():Void ;
	public function nextFrame():Void ;
}