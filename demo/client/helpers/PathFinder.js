define( ['client/helpers/PriorityQueue'], function(PriorityQueue) {
    return sp.Class.create('PathFinder', {
        constructor: function PathFinder(connectivity){
            this._connectivity = connectivity;
        },
		properties: {
			"_connectivity": "4"
		},
        methods: {
			neighbors: function( pt ){
				var neighbors = [{"x":pt.x - 1, "y":pt.y}, {"x":pt.x, "y":pt.y - 1}, {"x":pt.x + 1, "y":pt.y}, {"x":pt.x, "y":pt.y + 1}];
				if( this._connectivity == "8" ){
					return neighbors.concat( {"x":pt.x - 1, "y":pt.y - 1}, {"x":pt.x + 1, "y":pt.y - 1}, {"x":pt.x + 1, "y":pt.y + 1}, {"x":pt.x - 1, "y":pt.y + 1} );
				}
				return neighbors;
			},
			reconstructPath: function reconstructPath( cameFrom, node ){
				var path = [];
				while( node ){
					path.push( new sp.Point(node.x, node.y) );
					node = cameFrom[node.key];
				}
				return path.reverse();
			},
			routeAStar: function routeAStar( start, goal, occupiedRegions ){
				start = addProperties({"x":start.x, "y":start.y, "gScore":0});
				goal = addProperties({"x":goal.x, "y":goal.y});
				
				if( start.x != Math.floor(start.x) || start.y != Math.floor(start.y) )
					throw new Error("Invalid start coordinate for routing");
				if( goal.x != Math.floor(goal.x) || goal.y != Math.floor(goal.y) )
					throw new Error("Invalid goal coordinate for routing");
				
				if( occupiedRegions[start.key] || occupiedRegions[goal.key] ){
					return null;
				}
								
				function addProperties( pt ){
					pt.key = pt.x.toString(10) + "," + pt.y.toString(10);
					pt.fScore = Math.sqrt( (pt.x - goal.x)*(pt.x - goal.x) + (pt.y - goal.y)*(pt.y - goal.y) );
					return pt;
				}
				
				var closedSet = {};
				var cameFrom = {};
				var openSet = new PriorityQueue('fScore');
				openSet.add( start );
				
				while( !openSet.empty() ){
					var x = openSet.best();
					if( x.x == goal.x && x.y == goal.y ){
						return this.reconstructPath( cameFrom, x );
					}
					
					openSet.remove( x );
					closedSet[ x.key ] = true;

					var neighbors = this.neighbors(x);
					for( var i = 0; i < neighbors.length; i++ ){
						var y = addProperties(neighbors[i]);
						if( occupiedRegions[y.key] || closedSet[y.key] )
							continue;
						
						var tentativeGScore = x.gScore + Math.sqrt( (x.x-y.x)*(x.x-y.x) + (x.y-y.y)*(x.y-y.y) );
						
						var tentativeIsBetter = false;
						if( !openSet.contains(y) ){
							openSet.add( y );
							tentativeIsBetter = true;
						}else if( tentativeGScore < y.gScore ){
							tentativeIsBetter = true;
						}
						
						if( tentativeIsBetter ){
							cameFrom[y.key] = x;
							y.gScore = tentativeGScore;
							y.hScore = Math.sqrt( (y.x-goal.x)*(y.x-goal.x) + (y.y-goal.y)*(y.y-goal.y) );
							y.fScore = y.gScore + y.hScore;
						}
					}
				}
				return null;
			}
        }
    });
});