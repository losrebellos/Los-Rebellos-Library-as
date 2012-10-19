package com.losrebellos.test.application
{
	import com.losrebellos.project.framework.robotlegs.application.RobotlegsApplication;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	[Frame(factoryClass="com.losrebellos.test.application.preloader.TestPreloader")]
	public final class TestMain extends RobotlegsApplication
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function TestMain()
		{
			super(TestContext);
		}
	}
}