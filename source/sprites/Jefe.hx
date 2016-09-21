package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxObject;


class Jefe extends FlxSprite
{
	public static var velocidadX:Float = 1;
	public static var orientacion:Bool;
	public static var bala:Bullet;
	private var tiempo:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.zubat__png, true, 32, 32);
		updateHitbox();
		animation.add("vuela", [0, 1], 15, true);
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
		
	    animation.play("vuela");
			
		   if (x >= FlxG.width)
		   {
			   this.destroy();
			   this.active = false;
		   }
			  
	}
}