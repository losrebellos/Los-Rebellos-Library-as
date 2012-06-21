package com.losrebellos.project.framework.robotlegs.plugin.domain
{
	import com.losrebellos.project.framework.robotlegs.plugin.RobotlegsPlugin;

	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class DomainPlugin extends RobotlegsPlugin
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function DomainPlugin(checkPolicyFile:Boolean, applicationDomain:ApplicationDomain, securityDomain:SecurityDomain)
		{
			super();
			
			_checkPolicyFile = checkPolicyFile;
			_applicationDomain = applicationDomain;
			_securityDomain = securityDomain;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INIT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _checkPolicyFile:Boolean;
		private var _applicationDomain:ApplicationDomain;
		private var _securityDomain:SecurityDomain;
		override public function init():void
		{
			injector.mapValue(LoaderContext, new LoaderContext(_checkPolicyFile, _applicationDomain, _securityDomain));
			injector.mapValue(ApplicationDomain, _applicationDomain);
			injector.mapValue(SecurityDomain, _securityDomain);
		}
	}
}