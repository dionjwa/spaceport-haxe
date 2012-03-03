define( function(){
	return sp.Class.create('UIScaleHelper', {
		constructor: function UIScaleHelper(){
			
		},
		statics:{
			resizeThing: function resizeThing( thing, fromResolution, toResolution ){
				var scale = Math.max(toResolution.x / fromResolution.x, toResolution.y / fromResolution.y);
				
				for( var i = 0; i < thing.numChildren; i++ ){

					var child = thing.getChildAt(i);
					child.scaleX = scale;
					child.scaleY = scale;
					
					if( child.name == 'titleSafe' ){
						child.x -= (fromResolution.x*scale - toResolution.x)/2;
						child.y -= (fromResolution.y*scale - toResolution.y)/2;
					}else{
						var matchData = /^([a-z]*)([A-Z][a-z]*)(Anim)?$/.exec( child.name );
						if( !matchData ){
							alert("No match for: " + child.name + ", please make it camelCase.");
						}
						var xPosition = matchData[1];
						var yPosition = matchData[2];
						var animating = matchData[3];

						if( !animating ){
							child.cacheAsBitmap = true;
						}

						if( xPosition == "left" ){
							child.x = 0;
						}else if( xPosition == "center" ){
							child.x = toResolution.x/2;
						}else if( xPosition == "right" ){
							child.x = toResolution.x;
						}
						
						if( yPosition == "Top" ){
							child.y = 0;
						}else if( yPosition == "Center" ){
							child.y = toResolution.y/2;
						}else if( yPosition == "Bottom" ){
							child.y = toResolution.y;
						}
					}
				}
			}
		}
	});
});