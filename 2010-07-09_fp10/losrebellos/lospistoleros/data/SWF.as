package losrebellos.lospistoleros.data {	import org.bytearray.explorer.SWFExplorer;	import flash.utils.ByteArray;	/*	 *	 * @author los rebellos	 *	 */	public class SWF 	{		/*		 * 		 * just a simple version of SWFExplorer Class from Thibault Imbert		 * because I'm not using its loading options		 * 		 */		public static function parse(ba:ByteArray):Array		{			var parser:SWFExplorer = new SWFExplorer();			return parser.parse(ba);		}	}}