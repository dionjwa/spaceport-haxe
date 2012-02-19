[sp]: http://spaceport.io
[haxe]: http://http://haxe.org

# [Spaceport.io][sp] externs and tools for [HaXe][haxe]

[Spaceport.io][sp] is the Flash player re-implemented in iOs, Android, and Html5, allowing you to write code in Javascript and instantly update your game on all supported platforms.

This repo contains externs so you can write [HaXe][haxe], giving you typed functions, code completion, classes, macros, and the ability to export to other platforms.  

## The demo

Just double click the appropriate server in the ./demo folder.

- Windows:  SpaceportServerWindows.exe
- Mac: Spaceport Server OS X.app
- Linux: spaceport-server-linux

Then start the server, and click on the url.  It should open up a browser and show the flash version.

## Your own games

You need to:

- import the spaceport haxelib in your haxelib file
- import the 'lib/haxe.Spaceport.js' file in your index.html file *before* your main game script.  See ./demo/index.html
- add a callback to haxe.Spaceport to get notified when Spaceport.io is ready (this adds the flash.display.Stage variable to haxe.Spaceport):

	Spaceport.onSpaceportReady(function () :Void {
			new HelloWorld();
		});
		
That's it!  Now you have a multi-platform game, ready to go on the web, iOs, and Android.
		
		
		
	
	