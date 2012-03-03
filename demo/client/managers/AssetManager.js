define( function(){
	var AssetManager = sp.Class.create( 'AssetManager', {
		statics: {
		  cachedAssets: {},
		  loadingAssets: {},
		  getAsset: function getAsset( assetPath, callback ){
		    var loaderInfo = AssetManager.cachedAssets[assetPath];
		    if( loaderInfo ){
		      callback( loaderInfo );
	      }else if( AssetManager.loadingAssets[assetPath] ){
	        loaderInfo = AssetManager.loadingAssets[assetPath];
	        loaderInfo.addEventListener( sp.Event.COMPLETE, function(event){
	          loaderInfo.removeEventListener( sp.Event.COMPLETE, arguments.callee );
	          callback( loaderInfo );
          });
        }else{
	        var loader = new sp.Loader();
	        
	        loaderInfo = loader.contentLoaderInfo;
	        AssetManager.loadingAssets[ assetPath ] = loaderInfo;
	        loaderInfo.addEventListener( sp.Event.COMPLETE, function(event){
	          loaderInfo.removeEventListener( sp.Event.COMPLETE, arguments.callee );
	          AssetManager.cachedAssets[ assetPath ] = loaderInfo;
	          delete AssetManager.loadingAssets[ assetPath ];
	          callback( loaderInfo );
          });
          loader.load( new sp.URLRequest(assetPath) );
        }
	    },
	    preLoadAssets: function preLoadAssets( assetPaths, callback ){
	      function finishedLoading(){
	        return assetPaths.every( function(path){
	          return AssetManager.cachedAssets[path];
          });
        }
        function onAssetLoaded(ignored){
          if( finishedLoading() ){
            callback();
          }
        }
	      assetPaths.forEach( function(path){
	        AssetManager.getAsset( path, onAssetLoaded);
        });
      }
		}
	});
	return AssetManager;
});