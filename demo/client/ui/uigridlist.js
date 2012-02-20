define(function() {
  var FORCE_OF_FRICTION = 0.001;
  var SPRING_FORCE = 0.01;
  var DEBUG_SLOWING_FACTOR = 1;
  var MAX_OVERSHOOT = 960;
  var MAX_BOUNCE_DURATION = 300;
  
  return sp.Class.create('UIGridList', sp.EventDispatcher, {
    properties: {
      'originalTouchPointID': -1,
      'stage': null,
      'offset': 0,
      'view': null,
      'grid': [],
      'data': [],
      'fit': null,
      'cleanup': [],
      'inputBeginPosition': null,
      'lastTime': 0,
      'velocity': null,
      'tween': null,
      'delta': null,
      'dragOffset': 0,
      'padding': null,
      'AssetClass': null,
      'threshold': 0,
      'direction': 'y',
      'helperObjects': [],
      'dragged': false
    },
    /**
     * Config:
     *  * cls: Art class
     *  * worker: function that takes model and fills the view
     *  * data: List of models for the gridlist
     *  * scrollArea: DisplayObjectContainer as parent and bounding area
     *  * direction: x or y
     */
    constructor: function(config) {
      this.view = new sp.Sprite();
      
      this.inputBeginPosition = new sp.Point();
      this.delta = new sp.Point();
      this.velocity = new sp.Point();

      this.worker = config.worker;
      this.AssetClass = config.cls;

      var sizingInfo = new this.AssetClass();
      var scrollArea = config.scrollArea;
      
      // Bounds
      this.itemBounds = sizingInfo.getBounds(sizingInfo);
      this.areaBounds = scrollArea.getBounds(scrollArea);

      // Area
      var parent = scrollArea.parent;
      this.container = new sp.Sprite();
      this.container.x = scrollArea.x;
      this.container.y = scrollArea.y;
      parent.addChildAt(this.container, parent.getChildIndex(scrollArea));
      parent.removeChild(scrollArea);
      
      // How many we can fit in a page
      this.fit = new sp.Point(
        Math.floor(this.areaBounds.width  / this.itemBounds.width),
        Math.floor(this.areaBounds.height / this.itemBounds.height)
      );
      
      // Padding between edges and items
      this.padding = new sp.Point(
        (this.areaBounds.width  - (this.itemBounds.width  * this.fit.x)) / (this.fit.x + 1),
        (this.areaBounds.height - (this.itemBounds.height * this.fit.y)) / (this.fit.y + 1)
      );
      
      // Total size of the whole virtual grid
      this.totalBounds = new sp.Rectangle(
        0, 0,
        this.padding.x + (this.padding.x + this.itemBounds.width ) * this.fit.x,
        this.padding.y + (this.padding.y + this.itemBounds.height) * this.fit.y
      );
      
      // Size of a cell + padding
      this.cellSize = new sp.Point(
        this.padding.x + this.itemBounds.width,
        this.padding.y + this.itemBounds.height
      );
      
      this.direction = config.direction;
      if(this.direction.indexOf('x') !== -1)
        this.fit.x += 1;
      if(this.direction.indexOf('y') !== -1)
        this.fit.y += 1;

      this.container.addChild(this.view);
      
      this.pageSize = this.fit.x * this.fit.y;
      for(var x=0; x<this.fit.x; ++x) {
        for(var y=0; y<this.fit.y; ++y) {
          var item = new this.AssetClass();
          item.x = this.padding.x + (this.padding.x + this.itemBounds.width ) * x;
          item.y = this.padding.y + (this.padding.y + this.itemBounds.height) * y;
          this.view.addChild(item);
          
          var index;
          if(this.direction === 'y') {
            index = x + y * this.fit.x;
          } else {
            index = y + x * this.fit.y;
          }
          
          this.grid[index] = item;
          this.cleanup[index] = {
            children: [],
            listeners: []
          };
        }     
      }
      
      for(var i=0; i<this.pageSize; ++i) {
        this.helperObjects[i] = {
          addAutoListener: this.createAutoListenerCallback(this.cleanup[i]),
          addAutoChild: this.createAutoChildCallback(this.cleanup[i]),
          addAutoChildAt: this.createAutoChildAtCallback(this.cleanup[i])
        };
      }
      
      sizingInfo.destroy(true);
      
      this.resetData(config.data);
      
      this.container.addEventListener(sp.Event.ADDED_TO_STAGE, this.onAddedToStage);
      this.container.addEventListener(sp.MouseEvent.MOUSE_DOWN, this.onInputBegin);
      this.container.addEventListener(sp.TouchEvent.TOUCH_BEGIN, this.onInputBegin);
    },
    prebound: {
      onAddedToStage: function onAddedToStage(event) {
        var matrix = this.container.transform.concatenatedMatrix;
        
        this.stage = event.target.stage;
        this.scale = new sp.Point(matrix.a, matrix.d);
      },
      onInputBegin: function onInputBegin(event) {
        if(this.originalTouchPointID === -1)
          this.originalTouchPointID = event.touchPointID;
        else if(this.originalTouchPointID !== event.touchPointID)
          return;

        if(this.tween) {
          this.tween.removeEventListener( sp.TweenEvent.MOTION_FINISH, this.settleBack );
          this.tween.stop();
        }
        
        this.inputBeginPosition.x = event.stageX;
        this.inputBeginPosition.y = event.stageY;
        
        this.velocity.x = 0;
        this.velocity.y = 0;
        this.lastTime = Date.now();
        
        this.dragOffset = this.scrollValue;
        this.dragged = false;
        
        this.stage.addEventListener(sp.MouseEvent.MOUSE_MOVE, this.onInputMove);
        this.stage.addEventListener(sp.TouchEvent.TOUCH_MOVE, this.onInputMove);
        
        this.stage.addEventListener(sp.MouseEvent.MOUSE_UP , this.onInputEnd, true);
        this.stage.addEventListener(sp.TouchEvent.TOUCH_END, this.onInputEnd, true);
        
        // If you drag off of the edge of the uigridlist and the MOUSE_UP event occurs directly on the stage itself,
        // then there is no event in the capture phase.  
        // To account for this case, we ALSO have to listen for a mouse up on the stage during the target and bubbling phases
        this.stage.addEventListener(sp.MouseEvent.MOUSE_UP , this.onInputEnd);
        this.stage.addEventListener(sp.TouchEvent.TOUCH_END, this.onInputEnd);
      },
      onInputMove: function onInputMove(event) {
        if(this.originalTouchPointID !== event.touchPointID)
          return;
        
        var newDeltaX = event.stageX - this.inputBeginPosition.x;
        var newDeltaY = event.stageY - this.inputBeginPosition.y;
        
        var currentTime = Date.now();
        var dt = Math.max(15, currentTime - this.lastTime);
        this.lastTime = currentTime;
        this.velocity.x = (newDeltaX - this.delta.x)/dt;
        this.velocity.y = (newDeltaY - this.delta.y)/dt;
        
        this.delta.x = newDeltaX;
        this.delta.y = newDeltaY;
        
        if( !this.dragged ){
          if( this.delta.length > 10 ){
            this.dragged = true;
          }else{
            return;
          }
        }
        
        var value = this.dragOffset + this.delta[this.direction] / this.scale[this.direction];
        
        this.scrollValue = value;
      },
      onInputEnd: function onInputEnd(event) {
        if(this.originalTouchPointID !== event.touchPointID) {
          event.stopImmediatePropagation();
          return;
        }
        
        var self = this;
        
        this.stage.removeEventListener(sp.MouseEvent.MOUSE_MOVE, this.onInputMove);
        this.stage.removeEventListener(sp.TouchEvent.TOUCH_MOVE, this.onInputMove);
        
        this.stage.removeEventListener(sp.MouseEvent.MOUSE_UP , this.onInputEnd, true);
        this.stage.removeEventListener(sp.TouchEvent.TOUCH_END, this.onInputEnd, true);
        
        this.stage.removeEventListener(sp.MouseEvent.MOUSE_UP , this.onInputEnd);
        this.stage.removeEventListener(sp.TouchEvent.TOUCH_END, this.onInputEnd);
        
        if(this.dragged)
          event.stopImmediatePropagation();
        
        this.originalTouchPointID = -1;
        
        var pos = this.scrollValue;
        if(pos > this.upperBound()) {
          if(this.tween)
            this.tween.stop();
          
          this.tween = new sp.Tween(this, 'scrollValue', sp.easing.Quartic.easeInOut, this.scrollValue, this.upperBound(), 0.3, true);
        } else if(pos < this.lowerBound()) {
          if(this.tween)
            this.tween.stop();
          
          this.tween = new sp.Tween(this, 'scrollValue', sp.easing.Quartic.easeInOut, this.scrollValue, this.lowerBound(), 0.3, true);
        } else {
          var speed = this.velocity[this.direction];
          var force = (speed > 0) ? -FORCE_OF_FRICTION : FORCE_OF_FRICTION;
          var duration = this.predictedGlideTime(speed, force);
          
          if(!duration)
            return;

          this.tween = new sp.Tween(this, 'scrollValue', sp.easing.Quadratic.easeOut, this.scrollValue, this.predictedStopLocation(pos, speed, force), DEBUG_SLOWING_FACTOR*duration/1000, true);
          this.tween.addEventListener(sp.TweenEvent.MOTION_CHANGE, function(event) {
            if(event.position > self.lowerBound() && event.position < self.upperBound())
              return;
              
            var direction = 'upperBound';
            if(event.position < self.lowerBound())
              direction = 'lowerBound';
            
            event.target.removeEventListener(event.type, arguments.callee);

            var currentSpeed = self.velocity[self.direction] + force * self.tween.time;
            var springForce = currentSpeed > 0 ? -SPRING_FORCE : SPRING_FORCE;
            var predictedStop = self.predictedStopLocation(self.tween.position, currentSpeed, force + springForce);
            var newDuration = self.predictedGlideTime(currentSpeed, springForce);
            if(predictedStop > self.upperBound() + MAX_OVERSHOOT) {
              predictedStop = self.upperBound() + MAX_OVERSHOOT;
              newDuration = MAX_BOUNCE_DURATION;
            } else if(predictedStop < self.lowerBound() - MAX_OVERSHOOT) {
              predictedStop = self.lowerBound() - MAX_OVERSHOOT;
              newDuration = MAX_BOUNCE_DURATION;
            }
            
            newDuration = Math.min(newDuration, MAX_BOUNCE_DURATION);
            
            self.tween.func = sp.easing.Quadratic.easeOut;
            self.tween.continueTo(predictedStop, newDuration / 1000);
            self.tween.addEventListener(sp.TweenEvent.MOTION_FINISH, function(event) {
              event.target.removeEventListener(event.type, arguments.callee);
              
              self.tween.continueTo(self[direction](), newDuration / 2000);
            });
          });
        }
      }
    },
    methods: {
      predictedStopLocation: function predictedStopLocation(position, velocity, force){
        return position - velocity*velocity/(2*force);
      },
      predictedGlideTime: function predictedGlideTime(velocity, force) {
        if(force === 0)
          return 0;
        
        return Math.abs(velocity / force);
      },
      scrollValue: {
        set: function set_scrollValue(value) {
          var oldValue = this.view[this.direction];
          
          if( value < this.lowerBound() ){
            value = this.lowerBound() - (this.lowerBound() - value)/2;
          }else if( value > this.upperBound() ){
            value = this.upperBound() + (value - this.upperBound())/2;
          }
          this.view[this.direction] = value;

          if( (value > this.threshold) && (this.offset > 0) ) {
            this.shiftCells(-1);
          }else if( (value < this.threshold - this.cellSize[this.direction]) && (this.offset + this.pageSize < this.data.length) ){
            this.shiftCells(1);
          }
        },
        get: function get_scrollValue() {
          var value = this.view[this.direction];
          if( value < this.lowerBound() ){
            return this.lowerBound() - 2*(this.lowerBound() - value);
          }else if( value > this.upperBound() ){
            return this.upperBound() + 2*(value - this.upperBound());
          }
          
          return this.view[this.direction];
        }
      },
      minorDirection: {
        get: function get_minorDirection() {
          if(this.direction == 'x')
            return 'y';
          
          return 'x';
        }
      },
      lowerBound: function lowerBound() {
        if( this.data.length <= (this.pageSize - this.fit[this.minorDirection]) )
          return 0;
        
        var uncroppedLength = Math.ceil(this.data.length / this.fit[this.minorDirection]) * this.cellSize[this.direction] + this.padding[this.direction];
        if(this.direction === "y")
          return this.areaBounds.height - uncroppedLength;

        return this.areaBounds.width - uncroppedLength;
      },
      upperBound: function upperBound() {
        return 0;
      },
      shiftArray: function shiftArray(array, start, count, sign) {
        extracted = array.splice(start, count);
        if(sign > 0)
          return array.concat(extracted);
          
        return extracted.concat(array);
      },
      shiftCells: function shiftCells(sign) {
        var numShifted = this.fit[this.minorDirection];
        var startIndex = (sign > 0) ? 0 : this.pageSize - numShifted;
        
        var size = this.cellSize[this.direction];
        for(i=0; i<numShifted; ++i) {
          var idx = this.offset + startIndex + i;
          var view = this.grid[startIndex + i];
          
          if(idx + sign*this.pageSize >= this.data.length) {
            view.visible = false;
          }else{
            this.fillSingle(idx + sign*this.pageSize, startIndex + i);
            view.visible = true;
          }

          view[this.direction] += sign*(this.fit[this.direction] * size);
        }
        this.offset += sign*numShifted;
        this.threshold -= sign*size;
        
        this.grid = this.shiftArray(this.grid, startIndex, numShifted, sign);
        this.cleanup = this.shiftArray(this.cleanup, startIndex, numShifted, sign);
        this.helperObjects = this.shiftArray(this.helperObjects, startIndex, numShifted, sign);
      },
      fillSingle: function fillSingle(dataIndex, gridIndex) {
        var toClean = this.cleanup[gridIndex];
        while(toClean.children.length) {
          var infoObject = toClean.children.pop();
          
          var child = infoObject.child;
          var parent = infoObject.parent;
          child.parent.removeChild(child);
        }
        while(toClean.listeners.length) {
          var listener = toClean.listeners.pop();
          listener.dispatcher.removeEventListener(listener.type, listener.callback);
        }
        
        this.currentItem = gridIndex;
        if(this.worker)
          this.worker.call(null, this.data[dataIndex], this.grid[gridIndex], this.helperObjects[gridIndex]);
      },
      resetData: function resetData(data) {
        if(this.tween) {
          this.tween.stop();
          this.tween.removeEventListener( sp.TweenEvent.MOTION_FINISH, this.settleBack );
        }
        
        this.scrollValue = this.scrollValue;
        var i;

        this.data = data;

        this.view.y = 0;
        this.offset = 0;
        this.threshold = 0;
        
        var baseOffset = this.offset + this.pageSize;
        for(i=0; i<this.pageSize; ++i) {
          this.grid[i][this.direction] = this.padding[this.direction] + Math.floor(i / this.fit[this.minorDirection]) * this.cellSize[this.direction];
          this.grid[i].visible = true;
        }

        var actualFill = Math.min(this.data.length, this.pageSize);
        
        this.page = 0;
        for(i=0; i<actualFill; ++i)
          this.fillSingle(i, i, this);
        for(i=actualFill; i<this.pageSize; ++i)
          this.grid[i].visible = false;
      },
      createAutoListenerCallback: function createAutoListenerCallback(helperObject) {
        return function addAutoListener(dispatcher, types, callback) {
          types = [].concat(types);
          while(types.length) {
            var type = types.shift();
            dispatcher.addEventListener(type, callback);

            helperObject.listeners.push({
              dispatcher: dispatcher,
              type: type,
              callback: callback
            });
          }
        };
      },
      createAutoChildCallback: function createAutoChildCallback(helperObject) {
        return function addAutoChild(parent, child) {
          parent.addChild(child);
        
          helperObject.children.push({
            child: child,
            parent: parent
          });
        };
      },
      createAutoChildAtCallback: function createAutoChildAtCallback(helperObject) {
        return function addAutoChildAt(parent, child, index) {
          parent.addChildAt(child, index);

          helperObject.children.push({
            child: child,
            parent: parent
          });
        };
      }
    }
  });
});
