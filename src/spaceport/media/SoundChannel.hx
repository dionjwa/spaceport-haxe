// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/media/SoundChannel.html

// Original Package
// flash.media

package spaceport.media;

import spaceport.events.EventDispatcher;

@:native("sp.SoundChannel")
extern class SoundChannel extends EventDispatcher 
{
	public function new() :Void;
	public function stop():Void;
}