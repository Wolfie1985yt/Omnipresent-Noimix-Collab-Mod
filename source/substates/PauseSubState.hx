package substates;

import backend.Controls;
import flixel.FlxG;
import openfl.utils.Assets as OpenFlAssets;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import flixel.ui.FlxBar;
import backend.Song.SwagSong;
import backend.Section.SwagSection;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.math.FlxMath;
import openfl.display.BlendMode;
import objects.HealthIcon as HealthIcon;
import states.StoryMenuState;
import states.FreeplayState;

class PauseSubState extends MusicBeatSubstate
{
	var menuItems:Array<String>;
	var curSelected:Int = 0;
	var pauseMusic:FlxSound;
	var panel:FlxSprite;
	var exit3:FlxSprite;
	var exit2:FlxSprite;
	var exit1:FlxSprite;
	var restart3:FlxSprite;
	var restart2:FlxSprite;
	var restart1:FlxSprite;
	var continue3:FlxSprite;
	var continue2:FlxSprite;
	var continue1:FlxSprite;
	var sPercent:Float = PlayState.instance.songPercent;
	var holdTime:Float = 0;

	public function new(x:Float, y:Float)
	{
		super();
		
		menuItems = ['Continue', 'Restart', 'Exit'];

		pauseMusic = new FlxSound().loadEmbedded(Paths.music('pause'), true, true);
		pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));
		FlxG.sound.list.add(pauseMusic);
		FlxG.sound.play(Paths.sound('pause', 'shared'), 0.7);
		
		panel = new FlxSprite(800, 0).loadGraphic(Paths.image('pauseStuff/bottomPanel'));
		panel.antialiasing = ClientPrefs.data.antialiasing;
		panel.scrollFactor.set();
		panel.screenCenter();
		add(panel);

		exit3 = new FlxSprite(1515, 635).loadGraphic(Paths.image('pauseStuff/graybut'));
		exit3.antialiasing = ClientPrefs.data.antialiasing;
		exit3.screenCenter();
		exit3.x += 250;
		exit3.scrollFactor.set();
		
		exit2 = new FlxSprite(1515, 635).loadGraphic(Paths.image('pauseStuff/blackbut'));
		exit2.antialiasing = ClientPrefs.data.antialiasing;
		exit2.screenCenter();
		exit2.x += 250;
		exit2.scrollFactor.set();
		
		exit1 = new FlxSprite(1540, 640).loadGraphic(Paths.image('pauseStuff/Exittomenu'));
		exit1.antialiasing = ClientPrefs.data.antialiasing;
		exit1.screenCenter();
		exit1.x += 250;
		exit1.scrollFactor.set();
		
		if (menuItems.contains('Exit')) {
			add(exit3);
			add(exit2);
			add(exit1);
		}
		
		restart3 = new FlxSprite(1600, 535).loadGraphic(Paths.image('pauseStuff/graybut'));
		restart3.antialiasing = ClientPrefs.data.antialiasing;
		restart3.scrollFactor.set();
		restart3.screenCenter();
		restart3.x += 340;
		add(restart3);
		
		restart2 = new FlxSprite(1600, 535).loadGraphic(Paths.image('pauseStuff/blackbut'));
		restart2.antialiasing = ClientPrefs.data.antialiasing;
		restart2.scrollFactor.set();
		restart2.screenCenter();
		restart2.x += 340;
		add(restart2);
		
		restart1 = new FlxSprite(1625, 540).loadGraphic(Paths.image('pauseStuff/RestartSong'));
		restart1.antialiasing = ClientPrefs.data.antialiasing;
		restart1.scrollFactor.set();
		restart1.screenCenter();
		restart1.x += 340;
		add(restart1);
		
		continue3 = new FlxSprite(1680, 435).loadGraphic(Paths.image('pauseStuff/graybut'));
		continue3.antialiasing = ClientPrefs.data.antialiasing;
		continue3.scrollFactor.set();
		continue3.screenCenter();
		continue3.x += 430;
		add(continue3);
		
		continue2 = new FlxSprite(1680, 435).loadGraphic(Paths.image('pauseStuff/blackbut'));
		continue2.antialiasing = ClientPrefs.data.antialiasing;
		continue2.scrollFactor.set();
		continue2.screenCenter();
		continue2.x += 430;
		add(continue2);
		
		continue1 = new FlxSprite(1705, 440).loadGraphic(Paths.image('pauseStuff/Resume'));
		continue1.antialiasing = ClientPrefs.data.antialiasing;
		continue1.scrollFactor.set();
		continue1.screenCenter();
		continue1.x += 430;
		add(continue1);

		changeSelection(0);
		TweenIn();

		FlxG.mouse.visible = false;

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
	}

	function ButtonsTween(elapsed:Float):Void
	{
		switch(curSelected) {
			case 0:
				continue1.y = FlxMath.lerp(continue1.y, 430, CoolUtil.boundTo(elapsed * 24, 0, 1));
				continue2.y = FlxMath.lerp(continue2.y, 425, CoolUtil.boundTo(elapsed * 24, 0, 1));
				continue3.y = FlxMath.lerp(continue3.y, 440, CoolUtil.boundTo(elapsed * 24, 0, 1));
				
				restart1.y = FlxMath.lerp(restart1.y, 540, CoolUtil.boundTo(elapsed * 24, 0, 1));
				restart2.y = FlxMath.lerp(restart2.y, 535, CoolUtil.boundTo(elapsed * 24, 0, 1));
				restart3.y = FlxMath.lerp(restart3.y, 535, CoolUtil.boundTo(elapsed * 24, 0, 1));
				
				exit1.y = FlxMath.lerp(exit1.y, 640, CoolUtil.boundTo(elapsed * 24, 0, 1));
				exit2.y = FlxMath.lerp(exit2.y, 635, CoolUtil.boundTo(elapsed * 24, 0, 1));
				exit3.y = FlxMath.lerp(exit3.y, 635, CoolUtil.boundTo(elapsed * 24, 0, 1));
			case 1:
				continue1.y = FlxMath.lerp(continue1.y, 440, CoolUtil.boundTo(elapsed * 24, 0, 1));
				continue2.y = FlxMath.lerp(continue2.y, 435, CoolUtil.boundTo(elapsed * 24, 0, 1));
				continue3.y = FlxMath.lerp(continue3.y, 435, CoolUtil.boundTo(elapsed * 24, 0, 1));
				
				restart1.y = FlxMath.lerp(restart1.y, 530, CoolUtil.boundTo(elapsed * 24, 0, 1));
				restart2.y = FlxMath.lerp(restart2.y, 525, CoolUtil.boundTo(elapsed * 24, 0, 1));
				restart3.y = FlxMath.lerp(restart3.y, 540, CoolUtil.boundTo(elapsed * 24, 0, 1));
				
				exit1.y = FlxMath.lerp(exit1.y, 640, CoolUtil.boundTo(elapsed * 24, 0, 1));
				exit2.y = FlxMath.lerp(exit2.y, 635, CoolUtil.boundTo(elapsed * 24, 0, 1));
				exit3.y = FlxMath.lerp(exit3.y, 635, CoolUtil.boundTo(elapsed * 24, 0, 1));
			case 2:
				continue1.y = FlxMath.lerp(continue1.y, 440, CoolUtil.boundTo(elapsed * 24, 0, 1));
				continue2.y = FlxMath.lerp(continue2.y, 435, CoolUtil.boundTo(elapsed * 24, 0, 1));
				continue3.y = FlxMath.lerp(continue3.y, 435, CoolUtil.boundTo(elapsed * 24, 0, 1));
				
				restart1.y = FlxMath.lerp(restart1.y, 540, CoolUtil.boundTo(elapsed * 24, 0, 1));
				restart2.y = FlxMath.lerp(restart2.y, 535, CoolUtil.boundTo(elapsed * 24, 0, 1));
				restart3.y = FlxMath.lerp(restart3.y, 535, CoolUtil.boundTo(elapsed * 24, 0, 1));
				
				exit1.y = FlxMath.lerp(exit1.y, 630, CoolUtil.boundTo(elapsed * 24, 0, 1));
				exit2.y = FlxMath.lerp(exit2.y, 625, CoolUtil.boundTo(elapsed * 24, 0, 1));
				exit3.y = FlxMath.lerp(exit3.y, 640, CoolUtil.boundTo(elapsed * 24, 0, 1));
		}
	}

	function TweenIn():Void
	{
		FlxTween.tween(panel, {x: 0}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(exit3, {x: 715}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(exit2, {x: 715}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(exit1, {x: 740}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(restart3, {x: 800}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(restart2, {x: 800}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(restart1, {x: 825}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(continue3, {x: 880}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(continue2, {x: 880}, 0.25, { ease: FlxEase.expoInOut });
		FlxTween.tween(continue1, {x: 905}, 0.25, { ease: FlxEase.expoInOut });
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		ButtonsTween(elapsed);
		
		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;
		if (controls.UI_UP_P)
		{
			changeSelection(-shiftMult);
			holdTime = 0;
		}
		if (controls.UI_DOWN_P)
		{
			changeSelection(shiftMult);
			holdTime = 0;
		}
		if (controls.UI_DOWN_P || controls.UI_UP_P)
		{
			var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
			holdTime += elapsed;
			var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);
			if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
			{
				changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
			}
		}
	
		#if desktop
		if (FlxG.mouse.wheel != 0)
		{
			changeSelection(-shiftMult * FlxG.mouse.wheel);
			holdTime = 0;
		}
		#end
		if (controls.BACK || #if desktop FlxG.mouse.justPressedRight #else FlxG.android.justReleased.BACK #end) {
			PlayState.destroyShaders = true;
			close();
			FlxG.sound.play(Paths.sound('unpause', 'shared'), 0.4);
			FlxG.mouse.visible = false;
		}
		var daSelected:String = menuItems[curSelected];
		if (controls.ACCEPT #if desktop || FlxG.mouse.justPressedMiddle || FlxG.mouse.justPressed #end)
		{
			switch (daSelected)
			{
				case "Continue":
					PlayState.destroyShaders = true;
					close();
					FlxG.sound.play(Paths.sound('unpause', 'shared'), 0.4);
					FlxG.mouse.visible = false;
				case "Restart":
					restartSong();
					FlxG.mouse.visible = false;
				case "Exit":
					PlayState.deathCounter = 0;
					PlayState.seenCutscene = false;
					if(PlayState.isStoryMode) {
						MusicBeatState.switchState(new StoryMenuState());
						FlxG.sound.playMusic(Paths.music('freakyMenu'));
						} else {
							MusicBeatState.switchState(new FreeplayState());
							FlxG.sound.playMusic(Paths.music('freakyMenu'));
						}
				}
			}
		}

	public static function restartSong(noTrans:Bool = false)
	{
		PlayState.instance.paused = true; // For lua
		FlxG.sound.music.volume = 0;
		PlayState.instance.vocals.volume = 0;

		if(noTrans)
		{
			FlxTransitionableState.skipNextTransOut = true;
			FlxG.resetState();
		}
		else
		{
			MusicBeatState.resetState();
		}
	}

	override function destroy()
	{
		pauseMusic.stop();
		ClientPrefs.saveSettings();
		pauseMusic.destroy();
		super.destroy();
	}

	function changeSelection(change:Int = 0, ?mouse:Bool = false):Void
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		if (!mouse) {
			curSelected += change;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
			if (curSelected >= menuItems.length)
				curSelected = 0;
		} else {
			curSelected = change;
		}
	}
}
