package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		
		Reg.highscore = 100;
		
		var s:FlxSprite = new FlxSprite(50, 50);
		s.makeGraphic(16, 16);
		add(s);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
