package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

class Casas extends FlxSprite
{
	private var dmg:Int = 0;
	private var i:Int = 1;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.obstaculo__png, true, 16, 16);
		updateHitbox();
		animation.add("destruyen", [0, 1, 2, 3, 4, 5, 6], 60, true);
	}
	
	override public function update(elapsed:Float):Void
		{
			if ((FlxG.overlap(Enemigo.bala, this) && Enemigo.bala != null) || (FlxG.overlap(Personaje.bala, this) && Personaje.bala != null))
			{
				animation.play("destruyen",true,false,i);
				i++;
				FlxG.sound.play(AssetPaths.hit_obstaculo__wav, 1, false);
			}
			
			if (FlxG.overlap(Enemigo.bala, this) && Enemigo.bala != null)
			{
				Enemigo.bala.destroy();
			}
			
			if (FlxG.overlap(Personaje.bala, this) && Personaje.bala != null)
			{
				Personaje.bala.destroy();
				Personaje.balasEnPantalla = 0;
			}
			
			if (i >= 7)
			{
				this.destroy();
			}
			
		}
}