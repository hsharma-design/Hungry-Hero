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

package com.hsharma.hungryHero.ui
{
	import flash.display.BitmapData;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * This class is the pause button for the in-game screen.
	 *  
	 * @author hsharma
	 * 
	 */
	public class PauseButton extends Button
	{
		/** Pause button image. */
		private var pauseImage:Image;
		
		public function PauseButton()
		{
			super(Texture.fromBitmapData(new BitmapData(Assets.getAtlas().getTexture("pauseButton").width, Assets.getAtlas().getTexture("pauseButton").height, true, 0)));
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			// Pause Image
			pauseImage = new Image(Assets.getAtlas().getTexture("pauseButton"));
			this.addChild(pauseImage);
		}
	}
}