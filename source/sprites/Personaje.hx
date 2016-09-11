package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

class Personaje extends FlxSprite
{
	public static var balasEnPantalla:Int = 0;
	public static var bala:Bullet;
	private var key_right:Bool;
	private var key_left:Bool;
	private var move:Int;
	private var velocidadX:Int = 2;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16, 0xFFFF0000);
	}
	
	override public function update(elapsed:Float):Void
	{	
		super.update(elapsed);
		
		//movimiento
		key_right = FlxG.keys.pressed.RIGHT;
		key_left = FlxG.keys.pressed.LEFT;
		
		if(key_right && !key_left && x < FlxG.width - width)
		   move = 1;
		else if (!key_right && key_left && x > 0)
		         move = -1;
		else
		    move = 0;
		
	    x += move * velocidadX;
		   
		//disparo
		if (FlxG.keys.justPressed.SPACE)
		{
			if (balasEnPantalla == 0)
			{
			   bala = new Bullet(x + width / 2, y - height);
			   FlxG.state.add(bala);
			   balasEnPantalla++;
			}
		}
		
		
		}
	}