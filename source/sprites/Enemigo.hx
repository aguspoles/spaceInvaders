package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.group.FlxGroup;//para grupo de enemigos

class Enemigo extends FlxSprite
{
	public static var velocidadX:Float = 0.5;
	public static var orientacion:Bool;
	
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
			   orientacion = true;
		   }
		   if (x <= 0)
		   {
			   orientacion = false;
		   }
			  
	}
}