 package;

 import flixel.FlxBasic;
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.text.FlxText;
 import flixel.util.FlxColor;
 import flixel.group.FlxGroup.FlxTypedGroup;
 using flixel.util.FlxSpriteUtil;

 class HUD extends FlxTypedGroup<FlxSprite>
 {
     private var _txtLife:FlxText;
     private var _txtScore:FlxText;
     private var _sprLife:FlxSprite;
     private var _sprScore:FlxSprite;

     public function new()
     {
         super();
         _txtLife = new FlxText(64, 2, 0, "Life: 3 / 3", 8);
         _txtLife.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
         _txtScore = new FlxText(0, 2, 0, "Score: 0", 8);
         _txtScore.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
         add(_txtScore);
         add(_txtLife);
     }

     public function updateHUD(Life:Int = 0, Score:Int = 0):Void
     {
         _txtLife.text = "Life: " + Std.string(Life) + " / 3";
         _txtScore.text = "Score: " + Std.string(Score);
     }
 }