package losrebellos.lospistoleros.components.application {	import losrebellos.lospistoleros.core.model.PModelURLLoader;	import losrebellos.lospistoleros.vo.StageVO;	/*	 *	 * @author los rebellos	 *	 */	public class PSimpleApplicationModel extends PModelURLLoader 	{		/*		 * 		 * VARIABLES		 * 		 */		protected var stage_vo:StageVO = StageVO.TOP_LEFT_NO_SCALE_BEST;						/*		 *		 * CONSTRUCTOR		 *		 */		public function PSimpleApplicationModel()		{			super();		}						/*		 * 		 * DATA		 * 		 */		public function getStage():StageVO		{			return stage_vo;		}						/*		 * 		 * UTILS		 * 		 */		protected function calculatePercent(p:Number):Number		{			return Math.round( 100 * p );		}	}}