/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package com.hsharma.hungryHero.customObjects
{
	/**
	 * This class stores the properties of a font -
	 * 		Font Name
	 * 		Font Size
	 * 		Font Color
	 * 
	 * @author hsharma
	 * 
	 */
	public final class Font
	{
		private var _fontName:String;
		private var _fontSize:uint;
		private var _fontColor:uint;
		
		public function Font(fontName:String, fontSize:uint, fontColor:uint = 0xffffff)
		{
			this.fontName = fontName;
			this.fontSize = fontSize;
			this.fontColor = fontColor;
		}
		
		/**
		 * Font Color.
		 * @return 
		 * 
		 */
		public function get fontColor():uint
		{
			return _fontColor;
		}

		public function set fontColor(value:uint):void
		{
			_fontColor = value;
		}

		/**
		 * Font Size.
		 * @return 
		 * 
		 */
		public function get fontSize():uint
		{
			return _fontSize;
		}

		public function set fontSize(value:uint):void
		{
			_fontSize = value;
		}

		/**
		 * Font Name. 
		 * @return 
		 * 
		 */
		public function get fontName():String
		{
			return _fontName;
		}

		public function set fontName(value:String):void
		{
			_fontName = value;
		}
	}
}