/**
 * Import this class in your index.html before your main haxe-generated game script.
 */

if(typeof haxe=='undefined') haxe = {}
haxe.Spaceport = function() { }
haxe.Spaceport.__name__ = ["haxe","Spaceport"];
haxe.Spaceport.ready = false;
haxe.Spaceport.readyCallbacks = [];
haxe.Spaceport.stage = null;
haxe.Spaceport.onSpaceportReady = function(cb) {
	if (haxe.Spaceport.ready) {
		cb();
	} else {
		haxe.Spaceport.readyCallbacks.push(cb);
	}
}
haxe.Spaceport.main = function(stage) {
	haxe.Spaceport.ready = true;
	haxe.Spaceport.stage = stage;
	while (haxe.Spaceport.readyCallbacks.length > 0) {
		haxe.Spaceport.readyCallbacks.pop()();
	}
}

function main (stage) {
	haxe.Spaceport.main(stage);
}
