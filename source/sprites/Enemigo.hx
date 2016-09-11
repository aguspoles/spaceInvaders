package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.group.FlxGroup;//para grupo de enemigos

class Enemigo extends FlxSprite
{
	private var dir:Int = 1;
	private var velocidadX:Float = 0.5;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
	}
	
	override public function update(elapsed:Float):Void
	{
	    super.update(elapsed);
			
		   if (x >= FlxG.width - width)
		   {
		       dir = -1;
			   y += 10;
		   }
		   if (x <= 0)
		   {
			   dir = 1;
			   y += 10;
		   }
			   
		x += dir * velocidadX;
	}
}