package losrebellos.media.image {	import losrebellos.display.SpritePlus;	import losrebellos.events.IMGEvent;	import losrebellos.media.Library;		import flash.display.Loader;	import flash.events.ErrorEvent;	import flash.events.Event;	import flash.events.IOErrorEvent;	import flash.events.ProgressEvent;	import flash.events.SecurityErrorEvent;	import flash.net.URLRequest;	import flash.system.LoaderContext;		/*	 *	 * @author los rebellos	 *	 */	public class IMG extends SpritePlus 	{		/*		 * 		 * VARIABLES		 * 		 */		private var url:String;		private var loader:Loader;		private var context:LoaderContext;				//elements		private var container:SpritePlus;						/*		 * 		 * CONSTRUCTOR		 * 		 */		public function IMG()		{			super();		}		public function initialize():void		{					}		public function finalize():void		{//			loader.close();						removeEvents();		}						/*		 * 		 * CONTENT		 * 		 */		override protected function createContent():void		{			loader = new Loader;						container = new SpritePlus;		}		override protected function addContent():void		{			this.addChild(container);		}		public function load(_url:String, _context:LoaderContext):void		{			url = _url;			context = _context;						if(Library.instance.hasItem(url))			{				putImg();			}			else			{				addEvents();				loader.load(new URLRequest(url), context);			}		}		protected function putImg():void		{			container.addChild(Library.instance.getItemAsBitmap(url));						this.dispatchEvent(new IMGEvent(IMGEvent.COMPLETE));		}				/*		 * 		 * EVENTS		 * 		 */		protected function addEvents():void		{			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progressHandler);			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);			loader.contentLoaderInfo.addEventListener(ErrorEvent.ERROR,errorHandler);			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);		}		protected function removeEvents():void		{			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,progressHandler);			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,completeHandler);			loader.contentLoaderInfo.removeEventListener(ErrorEvent.ERROR,errorHandler);			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);			loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);		}						/*		 * 		 * HANDLERS		 * 		 */		protected function progressHandler(e:ProgressEvent):void		{			this.dispatchEvent(new IMGEvent(IMGEvent.PROGRESS, e.bytesLoaded / e.bytesTotal));		}		protected function completeHandler(e:Event):void		{			removeEvents();						Library.instance.addItem(url, loader.content);						putImg();		}		protected function errorHandler(e:Event):void		{			removeEvents();						this.dispatchEvent(new IMGEvent(IMGEvent.ERROR, ">>>>> IMG error: " + url + "(" + e.type + ")"));		}	}}