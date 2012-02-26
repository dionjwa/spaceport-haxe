// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/media/Sound.html

// Original Package
// flash.media

package spaceport.media;

import spaceport.events.EventDispatcher;
import spaceport.net.URLRequest;

@:native("sp.Sound")
extern class Sound extends EventDispatcher 
{
	public function new(?arg0:Dynamic, ?arg1:Dynamic) :Void;

	public function load(arg0:URLRequest):Void;
	public function close():Void ;
	public function play(?startTime:Float, ?loops:Float, ?sndTransform:SoundTransform):SoundChannel;
}