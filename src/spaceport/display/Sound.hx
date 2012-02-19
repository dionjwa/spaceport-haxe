// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/media/Sound.html

// Original Package
// flash.media

package spaceport.display;

extern class Sound extends EventDispatcher {

	// static properties

	// properties

	// constructor
	public function new(?arg0:Dynamic, ?arg1:Dynamic);

	// static methods

	// methods
	public function load(?arg0:URLRequest, ?arg1:SoundLoaderContext):Void ;
	public function close():Void ;
	public function play(?startTime:Float, ?loops:Float, ?sndTransform:SoundTransform):SoundChannel ;

}