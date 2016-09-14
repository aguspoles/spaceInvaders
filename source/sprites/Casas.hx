package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

class Casas extends FlxSprite
{
	private var dmg:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic (32, 16);
	}
	override public function update(elapsed:Float):Void
		{
			if (FlxG.overlap(Enemigo.bala, this) && Enemigo.bala != null)
			{
				Enemigo.bala.destroy();
				dmg ++;
			}
			if (FlxG.overlap(Personaje.bala, this) && Personaje.bala != null)
			{
				dmg++;
				Personaje.balasEnPantalla = 0;
				Personaje.bala.destroy();
			}
			
			if (dmg >= 3)
			{
				this.destroy();
			}
		}
}