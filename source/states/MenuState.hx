package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Personaje;
import flixel.group.FlxGroup;//para grupo de enemigos

class MenuState extends FlxState
{	
	private var charGroup:FlxGroup;//grupo de enemigos
	
	override public function create():Void
	{
		super.create();
		FlxG.switchState(new PlayState());
		
		/*for(i in 0...4){//hasta 4 exclusive
			var char:FlxSprite = new FlxSprite();
			charGroup.add(char);
		}*/
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
