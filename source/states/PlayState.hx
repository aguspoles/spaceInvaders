package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Personaje;

class PlayState extends FlxState
{
	private var player:Personaje;
	
	override public function create():Void
	{
		super.create();
	    player = new Personaje(FlxG.width / 2, FlxG.height - 16);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
