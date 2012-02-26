// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/text/StaticText.html

// Original Package
// flash.text

package spaceport.text;

import spaceport.display.DisplayObject;

@:native("sp.StaticText")
extern class StaticText extends DisplayObject 
{
	public var text(default, null):String;

	public function new() :Void;
}