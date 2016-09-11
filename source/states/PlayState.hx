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
	
	override public function create():Void
	{
		player = new Personaje(FlxG.width / 2, FlxG.height - 16);
		add(player);
			
		var enemigo:Enemigo;
		var f:Int = 20;
		var c:Int = 20;
		for (i in 0...17)
		{
			if (f >= FlxG.width-player.width-32)
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
			enemyGroup.add(enemigo);
		}

		add(enemyGroup);
		
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		//si colisionan bala y enemigo se destruyen
		for(i in 0...17){
			if (FlxG.overlap(enemyGroup.members[i], Personaje.bala))
			{
				Personaje.bala.destroy();
				enemyGroup.members[i].destroy();
				Personaje.balasEnPantalla = 0;
			}
		}
	}

	
}
