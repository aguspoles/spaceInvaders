package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;


class Bullet extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		velocity.y = -100;
	}
	
	override public function update(elapsed:Float):Void
	{	
		super.update(elapsed);
		
		if (y <= 0)//para bala del player
		{  
		    destroy();
		    Personaje.balasEnPantalla = 0;
	    }
		
		if (y >= FlxG.height)//para bala enemiga
		    destroy();
		
	}
}