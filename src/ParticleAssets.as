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

package 
{
	/**
	 * This class holds all particle files.  
	 * 
	 * @author hsharma
	 * 
	 */
	public class ParticleAssets
	{
		/**
		 * Particle 
		 */
		[Embed(source="../media/particles/particleCoffee.pex", mimeType="application/octet-stream")]
		public static var ParticleCoffeeXML:Class;
		
		[Embed(source="../media/particles/particleMushroom.pex", mimeType="application/octet-stream")]
		public static var ParticleMushroomXML:Class;
		
		[Embed(source="../media/particles/texture.png")]
		public static var ParticleTexture:Class;
	}
}
