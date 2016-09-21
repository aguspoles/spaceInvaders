package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;

class Enemigo extends FlxSprite
{
	public static var velocidadX:Float = 0.2;
	public static var orientacion:Bool;
	public static var bala:Bullet;
	public static var cuantosMurieron:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.ratata__png, true, 16, 16);
		animation.add("ratatat", [0,1], 15, true);
	}
	
	public function dispara():Void
	{
		bala = new Bullet(x + width / 2 - 8, y + height);
		bala.velocity.y *= -1;
		bala.loadGraphic(AssetPaths.disparoenemigo__png, false, 4, 4);
		bala.updateHitbox();
		FlxG.state.add(bala);
	}
	
	override public function update(elapsed:Float):Void
	{
	    super.update(elapsed);
		
		animation.play("ratatat");
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