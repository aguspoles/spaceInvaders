package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class GameOver extends FlxState
{
	private var gameOver:FlxSprite = new FlxSprite();
	 
	override public function create():Void
	{
		gameOver.loadGraphic(AssetPaths.game_over__png);
		add(gameOver);
		super.create();
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER)
		    FlxG.switchState(new MenuState());
		super.update(elapsed);
	}
	
}