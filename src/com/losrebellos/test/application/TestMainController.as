package com.losrebellos.test.application
{
	import com.losrebellos.project.framework.robotlegs.mvcs.BaseController;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public final class TestMainController extends BaseController
	{
		[Inject]
		public var view:TestMain;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function TestMainController()
		{
			super();
		}
	}
}