package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.net.curl.CURLCode;
import flixel.FlxCamera;
import backend.Highscore;

using StringTools;

class StoryMenuState extends MusicBeatState
{
	var ezbg:FlxSprite;
	var bg:FlxSprite;
	var SelectedSongExe:Int = 0;
	var oneclickpls:Bool = true;
	var bfIDLELAWL:StoryModeMenuBFidle;
	var bfALTIDLELAWL:StoryModeMenuBFidle;
	var redBOX:FlxSprite;
	var selection:Int = 1;
	var songArrayExe = ['omnipresent'];
	var WeekSelected:String = 'exe';
	var staticscreen:FlxSprite;
	var portrait:FlxSprite;
	var greyBOX:FlxSprite;
	var yellowBOX:FlxSprite;
	var lock:FlxSprite;
	private var camGame:FlxCamera;
	var blackScreen:FlxSprite;
	var MouseSelection:Int = 0;
	
	var hitboxOne:FlxSprite;
	var hitboxTwo:FlxSprite;
	var hitboxThree:FlxSprite;
	
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;
	var scoreText:FlxText;
	
	public function preload(graphic:String, ?lib:String) {
        var newthing:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image(graphic, lib));
        newthing.visible = false;
        add(newthing);
        remove(newthing);
    }

	override public function create()
	{
		#if DISCORD_ALLOWED
		DiscordClient.changePresence("In the Story Menu", null);
		#end
		Paths.clearUnusedMemory();
		persistentUpdate = persistentDraw = true;
		FlxG.sound.playMusic(Paths.music('storymodemenumusic'), 0.7);
		songArrayExe = ['omnipresent'];

		camGame = new FlxCamera();
		FlxG.cameras.reset(camGame);
		FlxCamera.defaultCameras = [camGame];

		FlxG.sound.playMusic(Paths.music('storymode'), 0);
		FlxG.sound.music.fadeIn(0.5, 0, 0.6);

		bg = new FlxSprite(0, 0);
		bg.frames = Paths.getSparrowAtlas('story-mode/bg');
		bg.animation.addByPrefix('idlexd', "static", 24);
		bg.animation.play('idlexd');
		bg.alpha = 1;
		bg.antialiasing = true;
		bg.setGraphicSize(Std.int(bg.width));
		bg.updateHitbox();
		add(bg);

		greyBOX = new FlxSprite(147, 76).loadGraphic(Paths.image('story-mode/greybox'));
		greyBOX.antialiasing = true;
		greyBOX.updateHitbox();
		greyBOX.screenCenter(X);
		greyBOX.y += 50;
		add(greyBOX);

		bfIDLELAWL = new StoryModeMenuBFidle(120, 150);
		bfIDLELAWL.scale.x = .4;
		bfIDLELAWL.scale.y = .4;
		bfIDLELAWL.y += 100;
		bfIDLELAWL.antialiasing = true;
		bfIDLELAWL.animation.play('idleLAWLAW', true);
		bfIDLELAWL.screenCenter(X);
		add(bfIDLELAWL);

		portrait = new FlxSprite(150, 79).loadGraphic(Paths.image('story-mode/exe/omnipresent'));
		portrait.setGraphicSize(Std.int(portrait.width * 0.275));
		portrait.antialiasing = true;
		portrait.updateHitbox();
		portrait.screenCenter(X);
		portrait.y += 50;
		add(portrait);

		staticscreen = new FlxSprite(150, 0);
		staticscreen.frames = Paths.getSparrowAtlas('story-mode/static');
		staticscreen.animation.addByPrefix('screenstaticANIM', "screenSTATIC", 24);
		staticscreen.animation.play('screenstaticANIM');
		staticscreen.y += 129;
		staticscreen.alpha = 0.3;
		staticscreen.antialiasing = true;
		staticscreen.setGraphicSize(Std.int(staticscreen.width * 0.275));
		staticscreen.updateHitbox();
		staticscreen.screenCenter(X);
		add(staticscreen);

		yellowBOX = new FlxSprite(145, 77).loadGraphic(Paths.image('story-mode/yellowbox'));
		yellowBOX.alpha = 1;
		yellowBOX.antialiasing = true;
		yellowBOX.updateHitbox();
		yellowBOX.screenCenter(X);
		yellowBOX.y += 50;
		add(yellowBOX);

		redBOX = new FlxSprite(120, 56).loadGraphic(Paths.image('story-mode/redbox'));
		redBOX.alpha = 1;
		redBOX.antialiasing = true;
		redBOX.updateHitbox();
		redBOX.screenCenter(X);
		redBOX.y += 50;
		add(redBOX);

		hitboxOne = new FlxSprite(73,57).makeGraphic(521, 221, 0x00000000);
		hitboxOne.y += 50;
		hitboxOne.screenCenter(X);
		add(hitboxOne);
		hitboxTwo = new FlxSprite(73,309).makeGraphic(521, 261, 0x00000000);
		hitboxTwo.y += 50;
		hitboxTwo.screenCenter(X);
		add(hitboxTwo);
		hitboxThree = new FlxSprite(73,599).makeGraphic(521, 87, 0x00000000);
		hitboxThree.y += 50;
		hitboxThree.screenCenter(X);
		add(hitboxThree);

		scoreText = new FlxText(205, -5, 0, "SCORE: ", 55);
		scoreText.setFormat(Paths.font("advanced.ttf"), scoreText.size, 0xFFF0303A, CENTER);
		scoreText.setBorderStyle(SHADOW, 0xFF591F26, 4, 1);
		scoreText.screenCenter(X);
		scoreText.y += 50;
		add(scoreText);

		ScoreUPD();
		
		#if mobile
		addVirtualPad(LEFT_FULL, A_B);
		virtualPad.y = -26;
		#end
		super.create();
	}

	function ScoreUPD()
	{
		#if !switch
		intendedScore = Highscore.getScore(songArrayExe[SelectedSongExe], 2);
		intendedRating = Highscore.getRating(songArrayExe[SelectedSongExe], 2);
		#end
		scoreText.text = 'SCORE: ' + lerpScore;
		scoreText.screenCenter(X);
		if (selection == 1)
			scoreText.alpha = 1;
		else
			scoreText.alpha = 0;
	}

	override public function update(elapsed:Float)
	{
		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 24, 0, 1)));
		lerpRating = FlxMath.lerp(lerpRating, intendedRating, CoolUtil.boundTo(elapsed * 12, 0, 1));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		if (Math.abs(lerpRating - intendedRating) <= 0.01)
			lerpRating = intendedRating;
		ScoreUPD();

			if ((controls.BACK #if desktop || FlxG.mouse.justPressedRight #end) && oneclickpls)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.switchState(new MainMenuState());
				oneclickpls = false;
			}

			if (controls.ACCEPT #if desktop || (FlxG.mouse.overlaps(redBOX) && (FlxG.mouse.justPressedMiddle || FlxG.mouse.justPressed)) #end)
			{
				if (oneclickpls)
				{
					oneclickpls = false;
					FlxG.sound.play(Paths.sound('confirmMenu'));
					
							if (songArrayExe[SelectedSongExe] == 'omnipresent') PlayState.SONG = backend.Song.loadFromJson('omnipresent' + '-hard', 'omnipresent');
							PlayState.storyDifficulty = 2;
							PlayState.storyWeek = 1;
							PlayState.isStoryMode = true;
							new FlxTimer().start(1, function(tmr:FlxTimer) { LoadingState.loadAndSwitchState(new PlayState()); });
						}	
					FlxFlicker.flicker(redBOX, 1, 0.06, false, false, function(flick:FlxFlicker) {});
			}

		super.update(elapsed);
	}
}
