package ;

import haxe.Spaceport;
import flash.display.MovieClip;

class HelloWorld
{
	public function new ()
	{
		var clip = new MovieClip();
		trace("clip2sdfsdf=" + clip);
	
	}
	
	public static function main () :Void 
	{
		haxe.Firebug.redirectTraces();
		
		Spaceport.onSpaceportReady(function () :Void {
			trace("spaceport ready!!! Spaceport.stage=" + Spaceport.stage);
			new HelloWorld();
		});
	}

}
