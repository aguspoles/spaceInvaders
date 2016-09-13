package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;


class Jefe extends FlxSprite
{

	public static var velocidadX:Float = 1;
	public static var orientacion:Bool;
	public static var bala:Bullet;
	public static var impacto:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 32, FlxColor.BROWN);
		
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
			   impacto = true;
	    	   Personaje.balasEnPantalla = 0;
		   }
			  
	}
}