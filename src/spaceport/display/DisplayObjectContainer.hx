// Adobe Documentation
// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/DisplayObjectContainer.html

// Original Package
// flash.display

package spaceport.display;

@:native("sp.DisplayObjectContainer")
extern class DisplayObjectContainer extends InteractiveObject 
{
	public var numChildren(default, null):Float;
	public var mouseChildren(default, default):Bool;

	public function new() :Void;

	public function removeChild(?arg0:DisplayObject):DisplayObject ;
	public function addChildAt(?arg0:DisplayObject, ?arg1:Float):DisplayObject ;
	public function swapChildren(?arg0:DisplayObject, ?arg1:DisplayObject):Void ;
	public function setChildIndex(?arg0:DisplayObject, ?arg1:Float):Void ;
	public function getObjectsUnderPoint(?point:Point):Array<Dynamic> ;
	public function swapChildrenAt(?arg0:Float, ?arg1:Float):Void ;
	public function getChildByName(?name:String):DisplayObject ;
	public function contains(?child:DisplayObject):Bool ;
	public function getChildAt(?index:Float):DisplayObject ;
	public function getChildIndex(?child:DisplayObject):Float ;
	public function addChild(?arg0:DisplayObject):DisplayObject ;
	public function removeChildAt(?arg0:Float):DisplayObject ;
}