package vtn.main
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Nick Pettyjohn
	 */
	public class Main extends Engine
	{
		public function Main()
		{

			super(Consts.GAME_WIDTH, Consts.GAME_HEIGHT, 60, false);
			FP.world = new MainMenuWorld;
			
			// TODO: Make these configurable
			Input.define(Keys.UP,		Key.UP);
			Input.define(Keys.DOWN,		Key.DOWN);
			Input.define(Keys.LEFT,		Key.LEFT);
			Input.define(Keys.RIGHT,	Key.RIGHT);
			Input.define(Keys.ACTION1,	Key.A);
			Input.define(Keys.ACTION2,	Key.Z);
			Input.define(Keys.CONFIRM,	Key.S);
			Input.define(Keys.CANCEL,	Key.A);
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
	}
	
}