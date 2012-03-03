define( [], function(){
  return sp.Class.create( "UIWrapper", {
    statics: {
      wrapButton: function wrapButton(button, callback){
        button.gotoAndStop("up");
        
        function onButtonDown(event){
          button.gotoAndStop("down");

          button.addEventListener( sp.MouseEvent.MOUSE_UP, onButtonUp );
          button.addEventListener( sp.TouchEvent.TOUCH_END, onButtonUp );

          if( button.stage ){
            button.stage.addEventListener( sp.MouseEvent.MOUSE_UP, onButtonUpStage );
            button.stage.addEventListener( sp.TouchEvent.TOUCH_END, onButtonUpStage );
          }
        }

        function removeEventListeners(){
          button.removeEventListener( sp.MouseEvent.MOUSE_UP, onButtonUp );
          button.removeEventListener( sp.TouchEvent.TOUCH_END, onButtonUp );

          if( button.stage ){
            button.stage.removeEventListener( sp.MouseEvent.MOUSE_UP, onButtonUp );
            button.stage.removeEventListener( sp.TouchEvent.TOUCH_END, onButtonUp );
          }
        }

        function onButtonUpStage(event){
          button.gotoAndStop("up");
          removeEventListeners();
        }

        function onButtonUp(event){
          button.gotoAndStop("up");
          removeEventListeners();
          callback();
        }
        
        button.addEventListener( sp.MouseEvent.MOUSE_DOWN, onButtonDown );
        button.addEventListener( sp.TouchEvent.TOUCH_BEGIN, onButtonDown );
      }
    }
  });
});
