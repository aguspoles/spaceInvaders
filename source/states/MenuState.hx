package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import states.PlayState.Playstate;

class MenuState extends FlxState
{	
	private var menu:FlxSprite = new FlxSprite();
	 
	override public function create():Void
	{
		FlxG.sound.playMusic(AssetPaths.pokemon__wav, 1, true);
		menu.loadGraphic(AssetPaths.Titulo__png);
		add(menu);
		super.create();
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER)
		    FlxG.switchState(new Playstate());
		super.update(elapsed);
	}
}
