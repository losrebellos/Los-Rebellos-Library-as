package losrebellos.media.players 
{
	import losrebellos.display.SpritePlus;
	import losrebellos.events.StreamEvent;
	import losrebellos.media.players.IPlayer;
	import losrebellos.media.stream.IStream;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class Player extends SpritePlus implements IPlayer 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var stream:IStream;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function Player()
		{
			super();
		}
		
		
		/*
		 * 
		 * DATA
		 * 
		 */
		public function get state():String
		{
			return stream.state;
		}
		public function getPercentLoaded():Number
		{
			return stream.getPercentLoaded();
		}
		public function getPercentPlayed():Number
		{
			return stream.getPercentPlayed();
		}

		
		/*
		 * 
		 * LOAD
		 * 
		 */
		public function load(_stream:IStream):void
		{
			stream = _stream;
			stream.addEventListener(StreamEvent.STREAM_INITIALIZED, streamInitializeHandler);
			
			stream.load();
		}
		
		
		/*
		 * 
		 * STREAM
		 * 
		 */
		protected function streamInitializeHandler(e:StreamEvent):void
		{
			stream.removeEventListener(StreamEvent.STREAM_INITIALIZED, streamInitializeHandler);
		}
		
		
		/*
		 * 
		 * CONTROLS
		 * 
		 */
		public function play(percent:Number = 0, loop:int = -1):void
		{
			stream.play(percent, loop);
		}
		public function resume():void
		{
			stream.resume();
		}
		public function pause():void
		{
			stream.pause();
		}
		public function stop():void
		{
			stream.stop();
		}
		public function seek(percent:Number):void
		{
			stream.seek(percent);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public function destroyStream():void
		{
			stream.destroy();
		}
	}
}
