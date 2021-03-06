package games.missTheMissile.views 
{
	import core.GameConsts;
	import core.Random;
	import core.ui.View;
	import core.util.camera.Camera;
	import core.util.camera.decorators.ParallaxCamera;
	import core.util.camera.concrete.ViewCamera;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.entities.Star;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class StarView extends View 
	{		
		public function StarView(arena:Arena, mainCamera:Camera, distance:Number)
		{			
			super(GameConsts.WIDTH, GameConsts.HEIGHT);
			
			var distanceFalloff:Number = Math.pow(Math.E, -distance);
			
			var followSpeed:Number	= (distanceFalloff + 2) / 3;
			updateables.add(new ParallaxCamera(mainCamera, followSpeed, new ViewCamera(this)));
			
			var minNumberOfStars:uint	= 100 + distanceFalloff * 100,
				maxNumberOfStars:uint	= 200 + distanceFalloff * 200,
				numberOfStars:uint		= Random.intInRange(minNumberOfStars, maxNumberOfStars);
				
			for (var i:uint = 0; i < numberOfStars; ++i) {
				
				var	x:Number = Random.inRange(0, arena.width),
					y:Number = Random.inRange(0, arena.height);
					
				add(new Star(x, y));
			}
			
			updateLists();
		}
	}

}