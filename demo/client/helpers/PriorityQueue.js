define( function(){
	return sp.Class.create('PriorityQueue', {
        constructor: function PriorityQueue(sortOn){
			this._sortOn = sortOn;
			this._data = [];
		},
		properties: {
			"_sortOn": 'score',
			"_data": null
		},
		methods: {
			empty: function empty(){
				return (this._data.length === 0);
			},
			best: function best(){
				var sortOn = this._sortOn;
				
				var bestNode = null;
				var bestScore = Infinity;
				this._data.forEach( function(node){
					if( node[sortOn] < bestScore ){
						bestNode = node;
						bestScore = node[sortOn];
					}
				} );
				return bestNode;
			},
			contains: function contains( test ){
				for( var i = 0; i < this._data.length; i++ ){
					var node = this._data[i];
					if( test.x == node.x && test.y == node.y )
						return true;
				}
				return false;
			},
			add: function add( node ){
				this._data.push( node );
			},
			indexOf: function indexOf( test ){
				for( var i = 0; i < this._data.length; i++ ){
					var node = this._data[i];
					if( test.x == node.x && test.y == node.y )
						return i;
				}
				return -1;
			},
			remove: function remove( test ){
				var index = this.indexOf( test );
				if( index != -1 )
					this._data.splice( index, 1 );
			}
		}
	});
});