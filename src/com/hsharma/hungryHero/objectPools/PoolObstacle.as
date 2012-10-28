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

package com.hsharma.hungryHero.objectPools
{
	import com.hsharma.hungryHero.gameElements.Obstacle;
	
	/**
	 * This class handles the Object Pooling for the obstacles.
	 *  
	 * @author hsharma
	 * 
	 */
	public class PoolObstacle {
		
		/** Minimum size of the pool. */
		private var _minSize:int;
		
		/** Maximum size of the pool. */
		private var _maxSize:int;
		
		/** Current size of the pool (list). */
		public var size:int = 0;
		
		/** Function to be called when the object is to be created. */
		public var create:Function;
		
		/** Function to be called when the object is to be cleaned. */
		public var clean:Function;
		
		/** Checked in objects count. */
		public var length:int = 0;
		
		/** Objects in the pool. */
		private var list:Vector.<Obstacle> = new Vector.<Obstacle>();
		
		/** If this pool has been disposed. */
		private var disposed:Boolean = false;
		
		/**
		* @param create This is the Function which should return a new Object to populate the Object pool
		* @param clean This Function will recieve the Object as a param and is used for cleaning the Object ready for reuse
		* @param minSize The initial size of the pool on Pool construction
		* @param maxSize The maximum possible size for the Pool
		*
		*/
		
		public function PoolObstacle(create:Function, clean:Function = null, minSize:int = 50, maxSize:int = 200)
		{
			this.create = create;
			this.clean = clean;
			this.minSize = minSize;
			this.maxSize = maxSize;
			
			// Create minimum number of objects now. Later in run-time, if required, more objects will be created < maximum number.
			for(var i:int = 0;i < minSize; i++) add();
		}
		
		/**
		 * Add new objects and check-in to the pool. 
		 * 
		 */
		private function add():void
		{
			list[length++] = create();
			size++;
		}
		
		/**
		 * Sets the minimum size for the Pool.
		 *
		 */
		public function set minSize(num:int):void
		{
			_minSize = num;
			if(_minSize > _maxSize) _maxSize = _minSize;
			if(_maxSize < list.length) list.splice(_maxSize, 1);
			size = list.length;
		}
		
		/**
		 * Gets the minimum size for the Pool.
		 *
		 */
		public function get minSize():int
		{
			return _minSize;
		}
		
		/**
		 * Sets the maximum size for the Pool.
		 *
		 */
		public function set maxSize(num:int):void
		{
			_maxSize = num;
			if(_maxSize < list.length) list.splice(_maxSize, 1);
			size = list.length;
			if(_maxSize < _minSize) _minSize = _maxSize;
		}
		
		/**
		 * Returns the maximum size for the Pool.
		 *
		 */
		public function get maxSize():int
		{
			return _maxSize;
		}
		
		/**
		 * Checks out an Object from the pool.
		 *
		 */
		public function checkOut():Obstacle
		{
			if(length == 0) {
				if(size < maxSize) {
					size++;
					return create();
				} else {
					return null;
				}
			}
			
			return list[--length];
		}
		
		/**
		 * Checks the Object back into the Pool.
		 * @param item The Object you wish to check back into the Object Pool.
		 *
		 */
		public function checkIn(item:Obstacle):void
		{
			if(clean != null) clean(item);
			list[length++] = item;
		}
		
		/**
		 * Disposes the Pool ready for GC.
		 *
		 */
		public function dispose():void
		{
			if(disposed) return;
			
			disposed = true;
			
			create = null;
			clean = null;
			list = null;
		}
	}
}