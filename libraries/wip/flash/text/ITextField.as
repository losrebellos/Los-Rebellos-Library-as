package flash.text
{
	import flash.display.DisplayObject;
	import flash.display.IInteractiveObject;
	import flash.geom.Rectangle;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ITextField extends IInteractiveObject
	{
		function replaceText(beginIndex : int, endIndex : int, newText : String) : void;

		function get maxScrollH() : int;

		function get numLines() : int;

		function get scrollH() : int;

		function get caretIndex() : int;

		function get maxScrollV() : int;

		function getImageReference(id : String) : DisplayObject;

		function get scrollV() : int;

		function get border() : Boolean;

		function get text() : String;

		function get background() : Boolean;

		function getCharBoundaries(charIndex : int) : Rectangle;

		function set borderColor(value : uint) : void;

		function set scrollH(value : int) : void;

		function getFirstCharInParagraph(charIndex : int) : int;

		function get type() : String;

		function replaceSelectedText(value : String) : void;

		function getRawText() : String;

		function get alwaysShowSelection() : Boolean;

		function get sharpness() : Number;

		function get textColor() : uint;

		function set defaultTextFormat(format : TextFormat) : void;

		function get condenseWhite() : Boolean;

		function get autoSize() : String;

		function set scrollV(value : int) : void;

		function set border(value : Boolean) : void;

		function get styleSheet() : StyleSheet;

		function set background(value : Boolean) : void;

		function set embedFonts(value : Boolean) : void;

		function get displayAsPassword() : Boolean;

		function get antiAliasType() : String;

		function set multiline(value : Boolean) : void;

		function get selectionEndIndex() : int;

		function set styleSheet(value : StyleSheet) : void;

		function set mouseWheelEnabled(value : Boolean) : void;

		function get selectedText() : String;

		function get thickness() : Number;

		function getLineIndexAtPoint(x : Number, y : Number) : int;

		function appendText(newText : String) : void;

		function get selectionBeginIndex() : int;

		function set textColor(value : uint) : void;

		function set text(value : String) : void;

		function get bottomScrollV() : int;

		function get htmlText() : String;

		function set alwaysShowSelection(value : Boolean) : void;

		function set sharpness(value : Number) : void;

		function get selectable() : Boolean;

		function getLineIndexOfChar(charIndex : int) : int;

		function set restrict(value : String) : void;

		function set gridFitType(gridFitType : String) : void;

		function setSelection(beginIndex : int, endIndex : int) : void;

		function getTextFormat(beginIndex : int = -1, endIndex : int = -1) : TextFormat;

		function setTextFormat(format : TextFormat, beginIndex : int = -1, endIndex : int = -1) : void;

		function set type(value : String) : void;

		function get borderColor() : uint;

		function set condenseWhite(value : Boolean) : void;

		function get textWidth() : Number;

		function getTextRuns(beginIndex : int = 0, endIndex : int = 2147483647) : Array;

		function getLineOffset(lineIndex : int) : int;

		function get wordWrap() : Boolean;

		function get useRichTextClipboard() : Boolean;

		function set autoSize(value : String) : void;

		function get defaultTextFormat() : TextFormat;

		function get multiline() : Boolean;

		function set useRichTextClipboard(value : Boolean) : void;

		function set backgroundColor(value : uint) : void;

		function get embedFonts() : Boolean;

		function set selectable(value : Boolean) : void;

		function get textHeight() : Number;

		function getXMLText(beginIndex : int = 0, endIndex : int = 2147483647) : String;

		function set displayAsPassword(value : Boolean) : void;

		function getLineText(lineIndex : int) : String;

		function set maxChars(value : int) : void;

		function get mouseWheelEnabled() : Boolean;

		function get restrict() : String;

		function get gridFitType() : String;

		function getParagraphLength(charIndex : int) : int;

		function set antiAliasType(antiAliasType : String) : void;

		function get backgroundColor() : uint;

		function getCharIndexAtPoint(x : Number, y : Number) : int;

		function get maxChars() : int;

		function get length() : int;

		function set thickness(value : Number) : void;

		function insertXMLText(beginIndex : int, endIndex : int, richText : String, pasting : Boolean = false) : void;

		function set wordWrap(value : Boolean) : void;

		function set htmlText(value : String) : void;

		function getLineMetrics(lineIndex : int) : TextLineMetrics;

		function getLineLength(lineIndex : int) : int;
	}
}