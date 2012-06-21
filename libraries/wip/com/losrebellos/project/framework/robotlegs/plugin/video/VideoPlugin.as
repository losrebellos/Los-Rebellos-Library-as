package com.losrebellos.project.framework.robotlegs.plugin.video
{
	import com.losrebellos.project.framework.robotlegs.plugin.RobotlegsPlugin;
	import com.losrebellos.project.framework.robotlegs.plugin.video.service.INetConnectionService;
	import com.losrebellos.project.framework.robotlegs.plugin.video.service.NetConnectionService;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class VideoPlugin extends RobotlegsPlugin
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function VideoPlugin()
		{
			super();
		}
		override public function init():void
		{
			injector.mapSingletonOf(INetConnectionService, NetConnectionService);
		}
	}
}