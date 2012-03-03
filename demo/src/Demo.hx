package ;

import flash.Lib;
import flash.display.Loader;
import flash.display.DisplayObject;
import flash.net.URLRequest;
import flash.events.Event;


class Demo 
{
	public function new() 
	{
		haxe.Firebug.redirectTraces();
		
		flash.Lib.onSpaceportReady(function () :Void {
			trace("spaceport is ready");
			
			var libraryLoader = new Loader();
			var libraryURL = "client/rsrc/avatar.swf";
			var libraryURLRequest = new URLRequest(libraryURL);
			
			var libraryLoaded = function (event) {
				trace("client/rsrc/avatar.swf loaded");
				var library = libraryLoader.contentLoaderInfo.applicationDomain;
				var AvatarClass = library.getDefinition("avatar");
				var avatar :DisplayObject = Type.createInstance(AvatarClass, []);
				flash.Lib.current.stage.addChild(avatar);
				avatar.x = avatar.y = 100;
				
				var CircleClass = library.getDefinition("circle");
				var circle :DisplayObject = Type.createInstance(CircleClass, []);
				flash.Lib.current.stage.addChild(circle);
				circle.x = circle.y = 150;
			}
			
			libraryLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, libraryLoaded);
			libraryLoader.load(libraryURLRequest);
		});
	}
	
	public static function main() 
	{
		new Demo();
	}
}
