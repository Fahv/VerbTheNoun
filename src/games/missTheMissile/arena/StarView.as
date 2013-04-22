package games.missTheMissile.arena 
{
	import core.Random;
	import core.ui.View;
	import core.util.camera.Camera;
	import core.util.camera.ParallaxCamera;
	import core.util.camera.ViewCamera;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import games.missTheMissile.entities.Star;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class StarView extends View 
	{
		private var parallaxCamera:Camera;
		
		public function StarView(arena:Arena, mainCamera:Camera, distance:Number)
		{			
			super(new BitmapData(Consts.GAME_WIDTH, Consts.GAME_HEIGHT, true, 0));
			
			var distanceFalloff:Number = Math.pow(Math.E, -distance);
			
			var followSpeed:Number	= (distanceFalloff + 2) / 3;
			parallaxCamera			= new ParallaxCamera(mainCamera, followSpeed, new ViewCamera(this));
			
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
		
		override public function update():void 
		{
			super.update();
			parallaxCamera.update();
		}
		
		override public function render():void 
		{
			buffer.fillRect(new Rectangle(0, 0, Consts.GAME_WIDTH, Consts.GAME_HEIGHT), 0);
			super.render();
		}
	}

}