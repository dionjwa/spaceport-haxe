[sp]: http://spaceport.io
[haxe]: http://http://haxe.org

# [Spaceport.io][sp] externs and tools for [HaXe][haxe]

[Spaceport.io][sp] is the Flash player re-implemented in iOs, Android, and Html5, allowing you to write code in Javascript and instantly update your game on all supported platforms.

This repo contains externs so you can write [HaXe][haxe], giving you typed functions, code completion, classes, macros, and the ability to export to other platforms.

This is a first draft, it's likely that some of the spaceport classes are not yet in the corresponding flash packages.

## The demo

First build the client app with haxe:

	cd <spaceport-haxe>/demo
	haxe build.hxml

Then start a simple web server with python:

	python -m SimpleHTTPServer 8000
	
Or run the the web server supplied with the Spaceport.io SDK, and change the served directory and port.

Then take your browser to:
	
	http://localhost:8000/index.html?platform=flash

## Your own games

You need to:

- import the spaceport haxelib in your .hxml build file
- remap 

	--remap flash:spaceport
	--remap fl:spaceport

- add a callback to flash.Lib to get notified when Spaceport.io is ready:

	flash.Lib.onSpaceportReady(function () :Void {
			new HelloWorld();
		});
		
That's it!  Now you have a multi-platform game, ready to go on the web, iOs, and Android.
		
		
		
	
	