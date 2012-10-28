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

package com.hsharma.hungryHero.events
{
	import starling.events.Event;
	
	/**
	 * This class defines custom events for navigation in the game. 
	 * @author hsharma
	 * 
	 */
	public class NavigationEvent extends Event
	{
		/** Change of a screen. */		
		public static const CHANGE_SCREEN:String = "changeScreen";
		
		/** Custom object to pass parameters to the screens. */
		public var params:Object;
		
		public function NavigationEvent(type:String, _params:Object, bubbles:Boolean=false)
		{
			super(type, bubbles);
			params = _params;
		}
	}
}