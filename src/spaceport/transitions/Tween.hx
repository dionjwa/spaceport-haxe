package spaceport.transitions;

import spaceport.events.EventDispatcher;

@:native("sp.Tween")
extern class Tween extends EventDispatcher 
{
	public var position(default, default):String;

	public function new(obj:Dynamic, prop:Dynamic, func:Dynamic, begin:Dynamic, finish:Dynamic, duration:Dynamic, useSeconds:Dynamic) :Void;

	public function stop():Dynamic ;
	public function yoyo():Dynamic ;
	public function continueTo(finish:Dynamic, duration:Dynamic):Dynamic ;
	public function prevFrame():Dynamic ;
	public function start():Dynamic ;
	public function resume():Dynamic ;
	public function nextFrame():Dynamic ;
	public function fforward():Dynamic ;
}