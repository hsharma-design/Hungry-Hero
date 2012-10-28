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

package com.hsharma.hungryHero.gameElements
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * This class defines the whole InGame background containing multiple background layers.
	 *  
	 * @author hsharma
	 * 
	 */
	public class GameBackground extends Sprite
	{
		/**
		 * Different layers of the background. 
		 */
		
		private var bgLayer1:BgLayer;
		private var bgLayer2:BgLayer;
		private var bgLayer3:BgLayer;
		private var bgLayer4:BgLayer;
		
		/** Current speed of animation of the background. */
		private var _speed:Number = 0;
		
		/** State of the game. */		
		private var _state:int;
		
		/** Game paused? */
		private var _gamePaused:Boolean = false;
		
		public function GameBackground()
		{
			super();
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
			
			bgLayer1 = new BgLayer(1);
			bgLayer1.parallaxDepth = 0.02;
			this.addChild(bgLayer1);
			
			bgLayer2 = new BgLayer(2);
			bgLayer2.parallaxDepth = 0.2;
			this.addChild(bgLayer2);
			
			bgLayer3 = new BgLayer(3);
			bgLayer3.parallaxDepth = 0.5;
			this.addChild(bgLayer3);
			
			bgLayer4 = new BgLayer(4);
			bgLayer4.parallaxDepth = 1;
			this.addChild(bgLayer4);
			
			// Start animating the background.
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		/**
		 * On every frame, animate each layer based on its parallax depth and hero's speed. 
		 * @param event
		 * 
		 */
		private function onEnterFrame(event:Event):void
		{
			if (!gamePaused)
			{
				// Background 1 - Sky
				bgLayer1.x -= Math.ceil(_speed * bgLayer1.parallaxDepth);
				// Hero flying left
				if (bgLayer1.x > 0) bgLayer1.x = -stage.stageWidth;
				// Hero flying right
				if (bgLayer1.x < -stage.stageWidth ) bgLayer1.x = 0;
				
				// Background 2 - Hills
				bgLayer2.x -= Math.ceil(_speed * bgLayer2.parallaxDepth);
				// Hero flying left
				if (bgLayer2.x > 0) bgLayer2.x = -stage.stageWidth;
				// Hero flying right
				if (bgLayer2.x < -stage.stageWidth ) bgLayer2.x = 0;
				
				// Background 3 - Buildings
				bgLayer3.x -= Math.ceil(_speed * bgLayer3.parallaxDepth);
				// Hero flying left
				if (bgLayer3.x > 0) bgLayer3.x = -stage.stageWidth;
				// Hero flying right
				if (bgLayer3.x < -stage.stageWidth ) bgLayer3.x = 0;
				
				// Background 4 - Trees
				bgLayer4.x -= Math.ceil(_speed * bgLayer4.parallaxDepth);
				// Hero flying left
				if (bgLayer4.x > 0) bgLayer4.x = -stage.stageWidth;
				// Hero flying right
				if (bgLayer4.x < -stage.stageWidth ) bgLayer4.x = 0;
			}
		}
		
		/**
		 * Game paused? 
		 * @return 
		 * 
		 */
		public function get gamePaused():Boolean { return _gamePaused; }
		public function set gamePaused(value:Boolean):void { _gamePaused = value; }
		
		/**
		 *  
		 * State of the game.
		 * 
		 */
		public function get state():int { return _state; }
		public function set state(value:int):void { _state = value; }

		/**
		 * Speed of the hero.
		 * 
		 */
		public function get speed():Number { return _speed; }
		public function set speed(value:Number):void { _speed = value; }
	}
}