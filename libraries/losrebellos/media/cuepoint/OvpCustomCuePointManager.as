//
// Copyright (c) 2009-2010, the Open Video Player authors. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without 
// modification, are permitted provided that the following conditions are 
// met:
//
//    * Redistributions of source code must retain the above copyright 
//		notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above 
//		copyright notice, this list of conditions and the following 
//		disclaimer in the documentation and/or other materials provided 
//		with the distribution.
//    * Neither the name of the openvideoplayer.org nor the names of its 
//		contributors may be used to endorse or promote products derived 
//		from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

package losrebellos.media.cuepoint
{
	import losrebellos.events.OvpCuePointEvent;
	import losrebellos.media.cuepoint.utils.OvpCuePointsParser;
	import losrebellos.media.cuepoint.vo.IOvpCustomCuePointVO;

	import org.openvideoplayer.events.OvpError;
	import org.openvideoplayer.events.OvpEvent;
	import org.openvideoplayer.net.OvpNetStream;

	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	//-----------------------------------------------------------------
	//
	// Events
	//
	//-----------------------------------------------------------------

	/**
	 * Dispatched when an OVP error condition has occurred. The OvpEvent object contains a data
	 * property.  The contents of the data property will contain the error number and a description.
	 * 
	 * @see org.openvideoplayer.events.OvpError
	 * @see org.openvideoplayer.events.OvpEvent
	 */
	[Event (name="error", type="org.openvideoplayer.events.OvpEvent")]

	/**
	 * The OvpCuePointManager class allows you to add cue points with ActionScript
	 * and have them fire at specified times in the stream.
	 * 
	 * This type of cue point is considered an ActionScript cue point, as opposed to
	 * an embedded cue point added at encoding time.
	 */
	public class OvpCustomCuePointManager extends EventDispatcher
	{
		/*
		 * 
		 * CONSTANTS
		 * 
		 */
		private static const _DEFAULT_INTERVAL_:Number = 20;	// The default interval (in milliseconds) at which 
																// the class will check for cue points
		
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		private var _intervalTimer:Timer;
		private var _checkInterval:Number;		
		private var _restartTimer:Boolean;
		private var _ns:OvpNetStream;
		private var _cuePoints:Array;
		private var _tolerance:Number;
		private var _lastFiredCuePointIndex:int;
		private var _enabled:Boolean;

		
		//-------------------------------------------------------------------
		// 
		// Constructor
		//
		//-------------------------------------------------------------------

		/**
		 * Constructs a new OvpCuePointManager object, with the OvpNetStream object it will use.
		 * The OvpNetStream object can also be set via the <code>netStream</code> property.
		 * 
		 * @param ns The OvpNetStream object the class should use.
		 */
		public function OvpCustomCuePointManager(ns:OvpNetStream = null)
		{
			_enabled = true;
			_cuePoints = [];
			
			_checkInterval = _DEFAULT_INTERVAL_;
			_intervalTimer = new Timer(_checkInterval);
			_intervalTimer.addEventListener(TimerEvent.TIMER, onIntervalTimer);
			
			if(!ns) 
			{
				reset();
			}
			else 
			{
				this.netStream = ns;			
			}
		}

		
		//-------------------------------------------------------------------
		//
		// Properties
		//
		//-------------------------------------------------------------------
		
		/**
		 * Set the OvpNetStream object this class will use.
		 */
		public function set netStream(ns:OvpNetStream):void 
		{		
			if(!ns || !(ns is OvpNetStream)) 
			{
				this.dispatchEvent(new OvpEvent(OvpEvent.ERROR, new OvpError(OvpError.STREAM_NOT_DEFINED)));
				return;
			}
			
			_ns = ns;
			_ns.addEventListener(NetStatusEvent.NET_STATUS, onStreamStatus);
			
			_tolerance = (_checkInterval * 5) / 1000;
			
			reset();
		}

		
		/** 
		 * Get the sorted, cue point array.
		 * 
		 * Please consider the returned array to be "read-only", modifying this array
		 * directly will lead to unexpected behavior.
		 */
		public function get cuePoints():Array 
		{
			return _cuePoints;
		}		

		
		//-------------------------------------------------------------------
		//
		// Public methods
		//
		//-------------------------------------------------------------------
		
		/**
		 * Add a single cue point as an object.  The object must contain the following properties:
		 * <ul>
		 * <li> time: Number in seconds.</li>
		 * <li> name: String naming the cue point.</li>
		 * </ul>
		 * 
		 * @see #addCuePoints()
		 * 
		 * @return True if the cue point passed in is valid and was successfully added to the class' 
		 * internal collection of cue points.  Otherwise, returns False.
		 */
		public function addCustomCuePoint(cuePoint:IOvpCustomCuePointVO):Boolean
		{
			var _cuePoint:IOvpCustomCuePointVO = cuePoint;
			
			if(isNaN(_cuePoint.time) || _cuePoint.time < 0) 
			{
				this.dispatchEvent(new OvpEvent(OvpEvent.ERROR, new OvpError(OvpError.INVALID_CUEPOINT_TIME)));
				return false;
			}
						
			if(!_cuePoint.name) 
			{
				this.dispatchEvent(new OvpEvent(OvpEvent.ERROR, new OvpError(OvpError.INVALID_CUEPOINT_NAME)));
				return false;
			}
									
			if(!_cuePoints.length) 
			{
				_cuePoints[0] = [_cuePoint];
				return true;
			}
			
			// Find the index where we should insert this cue point
			var index:int = findCuePoint(0, _cuePoints.length - 1, _cuePoint.time);
			if(index < 0)
			{
				index *= -1;
			}
			
			///////////////
			//create the Array
			if(!_cuePoints[index])
				_cuePoints[index] = [];
			
			//add the cuePoint
			var localCuePoints:Array = _cuePoints[index];
			localCuePoints.push(_cuePoint);
			///////////////
			
			return true;
		}
		public function addCustomCuePointFromXML(xml:XML, split:Boolean = false, delimit:String = "/"):Boolean
		{
			return addCustomCuePoint(OvpCuePointsParser.parseCuePointFromXML(xml, split, delimit));
		}

		
		/**
		 * Add an array of cue points.  Each object in the array must contain the following properties:
		 * <ul>
		 * <li> time: Number in seconds.</li>
		 * <li> name: String naming the cue point.</li>
		 * </ul>
		 * 
		 * @see #addCuePoint()
		 * 
		 * @return True if the array of cue points passed in is valid and each object
		 * in the array was successfully added.  Otherwise, returns False.
		 */
		public function addCustomCuePoints(cuePoints:Array):Boolean 
		{	
			if(!cuePoints || !cuePoints.length) 
			{
				this.dispatchEvent(new OvpEvent(OvpEvent.ERROR, new OvpError(OvpError.INVALID_CUEPOINT)));
				return false;
			} 
			
			var _retVal:Boolean = true;
			for each(var cp:IOvpCustomCuePointVO in cuePoints) 
			{
				_retVal = addCustomCuePoint(cp);
				if(!_retVal) 
				{
					break;
				}
			}
			
			return _retVal;
		}
		public function addCustomCuePointsFromXML(xml:XML, split:Boolean = false, delimit:String = "/"):Boolean
		{
			var cps:Array = OvpCuePointsParser.parseCuePointsFromXML(xml, split, delimit);
			if(cps.length > 0)
			{
				return addCustomCuePoints(cps);
			}
			
			return false;
		}

		
		/**
		 * Removes all cue points.
		 */
		public function removeAllCuePoints():void 
		{
			_cuePoints.length = 0;
			_cuePoints = [];
		}

		
		/**
		 * Enables/disables cue point events. Useful for features such as toggling closed captioning.
		 */
		public function enableCuePoints(enable:Boolean):void 
		{
			reset();
			
			_enabled = enable;
			if(enable) 
			{
				_intervalTimer.start();
			}
			else 
			{
				_intervalTimer.stop();
			}
		}

		
		//-------------------------------------------------------------------
		//
		// Private Methods
		//
		//-------------------------------------------------------------------
		
		/**
		 * Perform a reset on the class instance, i.e., after a seek.
		 */
		private function reset():void 
		{
			_lastFiredCuePointIndex = -1;
			
			_restartTimer = true;
			_intervalTimer.reset();
			_intervalTimer.delay = _checkInterval;
		}

		
		/**
		 * Returns the index of the cue point object matching the time. If no match is found, returns
		 * the index where the value should be inserted as a negative number.
		 */
		private function findCuePoint(firstIndex:int, lastIndex:int, time:Number):int 
		{
			if(firstIndex <= lastIndex) 
			{
				var mid:int = (firstIndex + lastIndex) / 2;	// divide and conquer
				var _cuePoint:IOvpCustomCuePointVO = _cuePoints[mid][0];
				if (time == _cuePoint.time) 
				{
					return mid;
				}
				else if (time < _cuePoint.time) 
				{
					// search the lower part
					return findCuePoint(firstIndex, mid - 1, time);
				}
				else 
				{
					// search the upper part
					return findCuePoint(mid + 1, lastIndex, time);
				}
			}
			
			return -firstIndex;
		}

		
		/**
		 * Checks for cue points around the current play time and dispatches 
		 * an event if a cue point is found.  The event is dispatched by the 
		 * OvpNetStream object.
		 * 
		 */
		private function checkForCuePoints(e:TimerEvent):void 
		{
			
			if(!_ns || _ns.isBuffering || !(_ns is OvpNetStream)) 
			{
				return;
			}
			
			var now:Number = _ns.time;
			
			// Let's find a cue point, we'll start looking one index past the last one we found
			var index:int = findCuePoint(_lastFiredCuePointIndex + 1, _cuePoints.length - 1, now);
			
			// A negative index value means it doesn't exist in the array and the absolute value is the
			// index where it should be inserted.  Therefore, to get the closest match, we'll look at the index
			// before this one.  A positive index means an exact match was found.
			if(index < 0)
			{
				index *= -1;
				index--;
			}
			
			// See if the value at this index is within our tolerance
			if(!checkCuePoint(index, now) && ((index + 1) < _cuePoints.length)) 
			{
				// Look at the next one, see if it is close enough to fire
				checkCuePoint(index + 1, now);
			}
		}

		
		/**
		 * Checks the cue point at the index passed in with the time passed in.
		 * If the cue point is within the class' tolerance, a cue point event is fired.
		 * 
		 * Returns True if a cue point is fired, otherwise False.
		 */
		private function checkCuePoint(index:int, now:Number):Boolean 
		{
			if(!_cuePoints || !_cuePoints.length) 
			{
				return false;
			}
			
			var nextTime:Number = _cuePoints[((index + 1) < _cuePoints.length) ? (index + 1) : (_cuePoints.length - 1)][0]["time"];
			var _cuePoint:IOvpCustomCuePointVO = _cuePoints[index][0];
			
			if((_cuePoint.time >= (now - _tolerance)) && (_cuePoint.time <= (now + _tolerance)) && (index != _lastFiredCuePointIndex)) 
			{
				_lastFiredCuePointIndex = index;
				
				var localCuePoints:Array = _cuePoints[index];
				var l: int = localCuePoints.length;
				for(var i:int = 0; i<l; i++)
				{
					if(localCuePoints[i] is IOvpCustomCuePointVO)
					{
						this.dispatchEvent(new OvpCuePointEvent(OvpCuePointEvent.NETSTREAM_CUEPOINT, localCuePoints[i]));
						this.dispatchEvent(new OvpEvent(OvpEvent.NETSTREAM_CUEPOINT, localCuePoints[i]));
					}
				}
				
				// Adjust the timer interval if necessary
				var thisTime:Number = _cuePoint.time;
				var newDelay:Number = ((nextTime - thisTime) * 1000) / 4;
				newDelay = (newDelay > _checkInterval) ? newDelay : _checkInterval;
								
				// If no more cuepoints, stop the timer
				if(thisTime == nextTime) 
				{
					_intervalTimer.stop();
					_restartTimer = false;
				}
				else if(newDelay != _intervalTimer.delay) 
				{
					_intervalTimer.reset();
					_intervalTimer.delay = newDelay;
					_intervalTimer.start();
				}
				return true;
			}
			
			// If we've optimized the interval time by reseting the delay, we could miss a cue point
			//    if it happens to fall between this check and next one.
			// See if we are going to miss a cuepoint (meaning there is one between now and the 
			//    next interval timer event).  If so, drop back down to the default check interval.
			if((_intervalTimer.delay != _checkInterval) && ((now + (_intervalTimer.delay / 1000)) > nextTime)) 
			{
				this._intervalTimer.reset();
				this._intervalTimer.delay = _checkInterval;
				this._intervalTimer.start();
			}
			return false;				
		}

		
		//-------------------------------------------------------------------
		//
		// Event Handlers
		//
		//-------------------------------------------------------------------
		
		/**
		 * The interval timer event handler.
		 */
		private function onIntervalTimer(event:TimerEvent):void 
		{
			this.checkForCuePoints(event);
		}

		
		/**
		 * The stream status handler.
		 */
		private function onStreamStatus(e:NetStatusEvent):void 
		{
			switch (e.info["code"]) 
			{
				case "NetStream.Play.Start":
				case "NetStream.Buffer.Full":
				case "NetStream.Unpause.Notify":
					if(_restartTimer && _enabled) 
					{
						_intervalTimer.start();
					}
					break;
				
				case "NetStream.Buffer.Empty":
				case "NetStream.Play.Stop":
				case "NetStream.Pause.Notify":
					_intervalTimer.stop();
					break;
				
				case "NetStream.Seek.Notify":
					_intervalTimer.stop();
					this.reset();
					break;
			}
		}
	}
}