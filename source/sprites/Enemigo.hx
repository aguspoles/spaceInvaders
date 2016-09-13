package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;//para grupo de enemigos

class Enemigo extends FlxSprite
{
	public static var velocidadX:Float = 0.5;
	public static var orientacion:Bool;
	public static var bala:Bullet;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16, FlxColor.BLUE);
		//loadGraphic(AssetPaths.player__png, true, 16, 16);
		//animation.add("lr", [3, 4, 3, 5], 6, false);
	}
	
	public function dispara():Void
	{
		bala = new Bullet(x + width / 2, y + height);
		bala.velocity.y *= -1;
		FlxG.state.add(bala);
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
		   
		   //si colisionan bala y enemigo se destruyen
		   if (FlxG.overlap(this, Personaje.bala))
		   {
			   Personaje.bala.destroy();
			   this.destroy();
	    	   Personaje.balasEnPantalla = 0;
		   }
			  
	}
}