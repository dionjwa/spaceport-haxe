define( [], function(){
  return sp.Class.create("AllocationPool", {
    constructor: function AllocationPool( definition ){
      this._definition = definition;
    },
    properties: {
      "_pool": [],
      "_definition": null,
      "_totalInCirculation": 0
    },
    methods: {
      getItem: function getItem(){
        var item = this._pool.pop();
        if( !item ){
          item = new this._definition();
          this._totalInCirculation += 1;
        }
        return item;
      },
      returnItem: function returnItem(item){
        if( !(item instanceof this._definition) ){
          throw new Error("you can't return that, it's the wrong kind of thing");
        }
        this._pool.push( item );
      }
    }
  });
});