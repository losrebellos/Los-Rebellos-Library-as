package losrebellos.lospistoleros.components.application {	import losrebellos.lospistoleros.core.model.PModel;	import losrebellos.lospistoleros.vo.StageVO;	/*	 *	 * @author los rebellos	 *	 */	public class PApplicationModel extends PModel 	{		/*		 * 		 * VARIABLES		 * 		 */		protected var stage_vo:StageVO = StageVO.TOP_LEFT_NO_SCALE_BEST;						/*		 * 		 * DATA		 * 		 */		public function getStage():StageVO		{			return stage_vo;		}	}}