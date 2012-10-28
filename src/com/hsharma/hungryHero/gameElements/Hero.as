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
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * This class is the hero character.
	 *  
	 * @author hsharma
	 * 
	 */
	public class Hero extends Sprite
	{
		/** Hero character animation. */
		private var heroArt:MovieClip;
		
		/** State of the hero. */
		private var _state:int;
		
		public function Hero()
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
			
			// Set the game state to idle.
			this.state = GameConstants.GAME_STATE_IDLE;
			
			// Initialize hero art and hit area.
			createHeroArt();
		}
		
		/**
		 * Create hero art/visuals. 
		 * 
		 */
		private function createHeroArt():void
		{
			heroArt = new MovieClip(Assets.getAtlas().getTextures("fly_"), 20);
			heroArt.x = Math.ceil(-heroArt.width/2);
			heroArt.y = Math.ceil(-heroArt.height/2);
			starling.core.Starling.juggler.add(heroArt);
			this.addChild(heroArt);
		}
		
		/**
		 * State of the hero. 
		 * @return 
		 * 
		 */
		public function get state():int { return _state; }
		public function set state(value:int):void { _state = value; }

		/**
		 * Set hero animation speed. 
		 * @param speed
		 * 
		 */
		public function setHeroAnimationSpeed(speed:int):void {
			if (speed == 0) heroArt.fps = 20;
			else heroArt.fps = 60;
		}

		override public function get width():Number
		{
			if (heroArt) return heroArt.texture.width;
			else return NaN;
		}

		override public function get height():Number
		{
			if (heroArt) return heroArt.texture.height;
			else return NaN;
		}
	}
}