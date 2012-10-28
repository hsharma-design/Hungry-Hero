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
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.utils.deg2rad;
	
	/**
	 * This class defines the obstacles in the game.
	 *  
	 * @author hsharma
	 * 
	 */
	public class Obstacle extends Sprite
	{
		/** Type of the obstacle. */
		private var _type:int;
		
		/** Speed of the obstacle. */
		private var _speed:int;
		
		/** Distance after which the obstacle should appear on screen. */
		private var _distance:int;
		
		/** Look out sign status. */
		private var _showLookOut:Boolean;
		
		/** Has the hero already collided with the obstacle? */
		private var _alreadyHit:Boolean;
		
		/** Vertical position of the obstacle. */
		private var _position:String;
		
		/** Hit area of the obstacle. */
		private var _hitArea:Image;
		
		/** Visual art of the obstacle (static). */
		private var obstacleImage:Image;
		
		/** Visual art of the obstacle (animated). */
		private var obstacleAnimation:MovieClip;
		
		/** Visual art of the crashed obstacle. */
		private var obstacleCrashImage:Image;
		
		/** Look out sign animation. */
		private var lookOutAnimation:MovieClip;
		
		public function Obstacle(_type:int, _distance:int, _lookOut:Boolean = true, _speed:int = 0)
		{
			super();
			
			this.type = _type;
			this._distance = _distance;
			this._showLookOut = _lookOut;
			this._speed = _speed;
			
			_alreadyHit = false;
		}
		
		/**
		 * Create the art of the obstacle based on - animation/image and new/reused object. 
		 * 
		 */
		private function createObstacleArt():void
		{
			// Animated obstacle.
			if (_type == GameConstants.OBSTACLE_TYPE_4)
			{
				// If this is the first time the object is being used.
				if (obstacleAnimation == null)
				{
					obstacleAnimation = new MovieClip(Assets.getAtlas().getTextures("obstacle" + _type + "_0"), 10);
					this.addChild(obstacleAnimation);
					Starling.juggler.add(obstacleAnimation);
				}
				else
				{
					// If this object is being reused. (Last time also this object was an animation).
					obstacleAnimation.visible = true;
					Starling.juggler.add(obstacleAnimation);
				}
				
				obstacleAnimation.x = 0;
				obstacleAnimation.y = 0;
			}
			else
			{
				// Static obstacle.
				
				// If this is the first time the object is being used.
				if (obstacleImage == null)
				{
					obstacleImage = new Image(Assets.getAtlas().getTexture("obstacle" + _type));
					this.addChild(obstacleImage);
				}
				else
				{
					// If this object is being reused.
					obstacleImage.texture = Assets.getAtlas().getTexture("obstacle" + _type);
					obstacleImage.visible = true;
				}
				
				obstacleImage.readjustSize();
				obstacleImage.x = 0;
				obstacleImage.y = 0;
			}
		}
		
		/**
		 * Create the crash art of the obstacle based on - animation/image and new/reused object. 
		 * 
		 */
		private function createObstacleCrashArt():void
		{
			if (obstacleCrashImage == null)
			{
				// If this is the first time the object is being used.
				obstacleCrashImage = new Image(Assets.getAtlas().getTexture(("obstacle" + _type + "_crash")));
				this.addChild(obstacleCrashImage);
			}
			else
			{
				// If this object is being reused.
				obstacleCrashImage.texture = Assets.getAtlas().getTexture("obstacle" + _type + "_crash");
			}
			
			// Hide the crash image by default.
			obstacleCrashImage.visible = false;
		}
		
		/**
		 * Create the look out animation. 
		 * 
		 */
		private function createLookOutAnimation():void
		{
			if (lookOutAnimation == null)
			{
				// If this is the first time the object is being used.
				lookOutAnimation = new MovieClip(Assets.getAtlas().getTextures("watchOut_"), 10);
				this.addChild(lookOutAnimation);
				Starling.juggler.add(lookOutAnimation);
			}
			else
			{
				// If this object is being reused.
				lookOutAnimation.visible = true;
				Starling.juggler.add(lookOutAnimation);
			}
			
			// Reset the positioning of look-out animation based on the new obstacle type.
			if (_type == GameConstants.OBSTACLE_TYPE_4)
			{
				lookOutAnimation.x = -lookOutAnimation.texture.width;
				lookOutAnimation.y = obstacleAnimation.y + (obstacleAnimation.texture.height * 0.5) - (obstacleAnimation.texture.height * 0.5);
			}
			else
			{
				lookOutAnimation.x = -lookOutAnimation.texture.width;
				lookOutAnimation.y = obstacleImage.y + (obstacleImage.texture.height * 0.5) - (lookOutAnimation.texture.height * 0.5);
			}
			
			lookOutAnimation.visible = false;
		}
		
		/**
		 * If reusing, hide previous animation/image, based on what is necessary this time. 
		 * 
		 */
		private function hidePreviousInstance():void
		{
			// If this item is being reused and was an animation the last time, remove it from juggler.
			// Only don't remove it if it is an animation this time as well.
			if (obstacleAnimation != null && _type != GameConstants.OBSTACLE_TYPE_4)
			{
				obstacleAnimation.visible = false;
				Starling.juggler.remove(obstacleAnimation);
			}
			
			// If this item is being reused and was an image the last time, hide it.
			if (obstacleImage != null) obstacleImage.visible = false;
		}
		
		/**
		 * Set the art, crash art, hit area and Look Out animation based on the new obstacle type. 
		 * @param value
		 * 
		 */
		public function get type():int { return _type; }
		public function set type(value:int):void {
			_type = value;
			
			resetForReuse();
			
			// If reusing, hide previous animation/image, based on what is necessary this time.
			hidePreviousInstance();
			
			// Create Obstacle Art.
			createObstacleArt();
			
			// Create the Crash Art.
			createObstacleCrashArt();
			
			// Create look-out animation.
			createLookOutAnimation();
		}
		
		/**
		 * Look out sign status. 
		 * 
		 */
		public function get lookOut():Boolean { return _showLookOut; }
		public function set lookOut(value:Boolean):void
		{
			_showLookOut = value;
			
			if (lookOutAnimation)
			{
				if (value)
				{
					lookOutAnimation.visible = true;
				}
				else
				{
					lookOutAnimation.visible = false;
					Starling.juggler.remove(lookOutAnimation);
				}
			}
		}
		
		/**
		 * Has the hero collided with the obstacle? 
		 * 
		 */
		public function get alreadyHit():Boolean { return _alreadyHit; }
		public function set alreadyHit(value:Boolean):void
		{
			_alreadyHit = value;
			
			if (value)
			{
				obstacleCrashImage.visible = true;
				if (_type == GameConstants.OBSTACLE_TYPE_4)
				{
					obstacleAnimation.visible = false;
				}
				else
				{
					obstacleImage.visible = false;
					Starling.juggler.remove(obstacleAnimation);
				}
			}
		}
		
		/**
		 * Speed of the obstacle. 
		 * 
		 */
		public function get speed():int { return _speed; }
		public function set speed(value:int):void { _speed = value; }
		
		/**
		 * Distance after which the obstacle should appear on screen. 
		 * 
		 */
		public function get distance():int { return _distance; }
		public function set distance(value:int):void { _distance = value; }
		
		/**
		 * Vertical position of the obstacle. 
		 * 
		 */
		public function get position():String { return _position; }
		public function set position(value:String):void { _position = value; }
		
		public function get hitArea():Image { return _hitArea; }
		
		/**
		 * Width of the texture that defines the image of this Sprite. 
		 */
		override public function get width():Number {
			if (obstacleImage) return obstacleImage.texture.width;
			else return 0;
		}
		
		/**
		 * Height of the texture that defines the image of this Sprite. 
		 */
		override public function get height():Number
		{
			if (obstacleImage) return obstacleImage.texture.height;
			else return 0;
		}
		
		/**
		 * Reset the obstacle object for reuse. 
		 * 
		 */
		public function resetForReuse():void
		{
			this.alreadyHit = false;
			this.lookOut = true;
			this.rotation = deg2rad(0);
		}
	}
}

