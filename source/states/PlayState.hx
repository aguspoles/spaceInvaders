package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Personaje;
import sprites.Enemigo;
import flixel.group.FlxGroup;//para grupo de enemigos

class PlayState extends FlxState
{
	private var player:Personaje;
	private var enemyGroup:FlxGroup = new FlxGroup();
	private static var enemyArray = new Array<Enemigo>();
	private static var totalEnemigos:Int = 17;
	
	override public function create():Void
	{
		player = new Personaje(FlxG.width / 2, FlxG.height - 16);
		add(player);
			
		var enemigo:Enemigo;
		var f:Int = 20;
		var c:Int = 20;
		for (i in 0...totalEnemigos)
		{
			if (f >= (FlxG.width - player.width - 32))
			{
			   f = 20;
			   c += 20;
			   enemigo = new Enemigo(f, c);
			}
			   else
			   {
				   enemigo = new Enemigo(f, c); 
				   f += 20;
			   }
			//enemyGroup.add(enemigo);
			enemyArray.push(enemigo);
			add(enemyArray[i]);
		}
		
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		for (i in 0...enemyArray.length){
			
			//si colisionan bala y enemigo se destruyen
			if (FlxG.overlap(enemyArray[i], Personaje.bala))
			{
				Personaje.bala.destroy();
				enemyArray[i].destroy();
				Personaje.balasEnPantalla = 0;
			}
			
			//cambio direccion cunado tocan bordes de pantalla
			if (Enemigo.orientacion)
			{
			   enemyArray[i].x -= Enemigo.velocidadX;
			}
			else
			{
			   enemyArray[i].x += Enemigo.velocidadX;
			}
		}
	}

	
}
