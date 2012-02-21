// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/DisplayObjectContainer.html

// Original Package
// flash.display

package spaceport.display;

import spaceport.geom.Point;

@:native("sp.DisplayObjectContainer")
extern class DisplayObjectContainer extends InteractiveObject 
{
	public var numChildren(default, null):Int;
	public var mouseChildren(default, default):Bool;

	public function new() :Void;

	public function removeChild(?arg0:DisplayObject):DisplayObject ;
	public function addChildAt(?arg0:DisplayObject, ?arg1:Int):DisplayObject ;
	public function swapChildren(?arg0:DisplayObject, ?arg1:DisplayObject):Void ;
	public function setChildIndex(?arg0:DisplayObject, ?arg1:Int):Void ;
	public function getObjectsUnderPoint(?point:Point):Array<Dynamic> ;
	public function swapChildrenAt(?arg0:Int, ?arg1:Int):Void ;
	public function getChildByName(?name:String):DisplayObject ;
	public function contains(?child:DisplayObject):Bool ;
	public function getChildAt(?index:Int):DisplayObject ;
	public function getChildIndex(?child:DisplayObject):Int;
	public function addChild(?arg0:DisplayObject):DisplayObject ;
	public function removeChildAt(?arg0:Int):DisplayObject ;
}