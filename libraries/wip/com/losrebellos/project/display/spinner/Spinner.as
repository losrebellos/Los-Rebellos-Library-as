package com.losrebellos.project.display.spinner {	import com.losrebellos.display.base.SpritePlus;	import com.losrebellos.math.MathUtils;	import flash.display.DisplayObject;	import flash.errors.IllegalOperationError;	import flash.events.Event;	/*	 *	 * @author los rebellos	 *	 */	public class Spinner extends SpritePlus implements ISpinner	{		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////		public function Spinner(petal:Class = null, num:int = 9)		{			_petal = petal ? petal : Petal;			_num = num;						super();						checkPetal();			createContent();						this.mouse = false;			this.visible = false;		}						////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROPERTIES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////		protected var _speed:int = 1;		public function set speed(value:int):void		{			_speed = value;		}		protected var _circle:Number = 1;		public function set circle(value:int):void		{			_circle = value;		}						////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTENT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////		private var _petal:Class;		private var _petals:Vector.<IPetal>;		protected function checkPetal():void		{			if(!(new _petal() is IPetal))			{				throw new IllegalOperationError(">>>>> your petal class need to implement IPetal");			}		}		protected function createContent():void		{			_petals = new Vector.<IPetal>();						var petal:IPetal;			for(var i:int = 0; i<_num; i++)			{				_petals.push(petal = new _petal());								petal.rotation = i * 360 / _num;				petal.enable();				this.addChild(petal as DisplayObject);			}			_petals.fixed = true;		}						////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// START / STOP
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////		public function enable():void		{			_frameCounter = 0;						this.visible = true;			this.addEventListener(Event.ENTER_FRAME, spinHandler);		}		public function disable():void		{			this.visible = false;			this.removeEventListener(Event.ENTER_FRAME, spinHandler);		}		private var _frameCounter:int = 0;		private var _currentPetal:int = 0;		private var _num:int;		protected function spinHandler(e:Event):void		{			_frameCounter++;						if(_frameCounter % _speed == 0)			{				var petal:IPetal;								// go throught the CIRCLE petals				var _petalCounter:int = 0;				var _tabPetalsLength:int = _petals.length;				var _circlePetalsLength:int = MathUtils.round(_circle * _tabPetalsLength);				for(var i:int = 0; i<_circlePetalsLength; i++)				{					petal = _petals[_currentPetal + _petalCounter];					petal.update(i / (_circlePetalsLength - 1));										_petalCounter++;					if(_currentPetal + _petalCounter >= _tabPetalsLength)					{						_petalCounter = -_currentPetal;					}				}								// targetted petal				_currentPetal++;				if(_currentPetal > _num - 1)				{					_currentPetal = 0;				}			}		}				////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////		override public function dispose(e:Event = null):void		{			var petal:IPetal;			for each(petal in _petals)			{				petal.disable();				petal.dispose(e);				petal = null;			}						super.dispose(e);		}	}}