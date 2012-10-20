package com.losrebellos.project.media.player.events 
{
	import com.losrebellos.events.EventPlus;

	import flash.events.Event;

	/*
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static const PLAY:String			= "VideoEvent/play";
		public static const COMPLETE:String		= "VideoEvent/complete";
		public static const BUFFERING:String	= "VideoEvent/buffering";
		public static const BUFFER_FULL:String	= "VideoEvent/bufferFull";
		public static const ERROR:String		= "VideoEvent/error";
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public var data:String = "";
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		{
			this.data = data;
			

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CLONE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function clone():Event
		{
			return new VideoEvent(this.type, this.data, this.bubbles, this.cancelable);
		}
	}