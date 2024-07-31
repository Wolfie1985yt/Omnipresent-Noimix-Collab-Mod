package states;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
#if desktop
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;
#end
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;
import flixel.addons.display.FlxBackdrop; 
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import sys.FileSystem; 
import flixel.ui.FlxBar;
import flixel.input.mouse.FlxMouseEventManager;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7.3';
	public static var curSelected:Int = 0;

	var Buttons:FlxTypedSpriteGroup<FlxSprite>;
	private var camGame:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'credits',
		'options'
	];

	var debugKeys:Array<FlxKey>;
	var BG:FlxSprite;
	
	public var lockedControl:Bool = false;
	public var selectedSomethin:Bool = false;
	public static var instance:MainMenuState;
	public static var scrollsDown:Bool = false;
	var Accepted:Bool = false;
	var IhateThatFuckingShitCode:Bool = false;
	public var lockMouseSelection:Bool = false;	
	
	public var blackScreen:FlxSprite;
	
	var ButtonsBG:FlxSprite;
	var ArrowUp:FlxSprite;
	var ArrowDown:FlxSprite;
	var ArrowUpSel:FlxSprite;
	var ArrowDownSel:FlxSprite;
	var FGup:FlxSprite;
	var FGdown:FlxSprite;
	var PressAlt:FlxSprite;
	var InCustomCursor:Bool = false;
	
	public var offButtonsThing:Bool = false;
	public var coolKeybindsArrows:Bool = false;
	var cursorArrowsFix:Bool = false;
	var secondPage:Bool = false;

	public function preload(graphic:String, ?lib:String) {
        var newthing:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image(graphic, lib));
        newthing.visible = false;
        add(newthing);
        remove(newthing);
    }

	override function create()
	{
		instance = this;
		if (lockMouseSelection) lockMouseSelection = false;
		FlxG.sound.playMusic(Paths.music('storymodemenumusic'), 0.7);

		camGame = new FlxCamera();
		FlxG.cameras.reset(camGame);
		FlxCamera.defaultCameras = [camGame];
		
		FlxTransitionableState.skipNextTransIn = false;
		
		persistentUpdate = persistentDraw = true;

		BG = new FlxSprite(0, 0);
		BG.frames = Paths.getSparrowAtlas('mainmenu/bg');
		BG.antialiasing = false;
		BG.animation.addByPrefix('bgAnim', 'BG instance 1', 24);
		BG.setGraphicSize(Std.int(BG.width * 1));
		BG.animation.play('bgAnim');
		BG.updateHitbox();
		BG.screenCenter();
		add(BG);

		Buttons = new FlxTypedSpriteGroup<FlxSprite>();
		add(Buttons);

		for (i in 0...optionShit.length)
		{			
			var Button:FlxSprite = new FlxSprite(0, 0);
			Button.frames = Paths.getSparrowAtlas('mainmenu/buttons/' + optionShit[i]);
			Button.animation.addByIndices('idle', optionShit[i], [0], "", 24);
			Button.animation.addByIndices('sel', optionShit[i], [1], "", 24);
			Button.animation.addByIndices('epilepsy', optionShit[i], [0,1], "", 24);
			Button.animation.play('idle');
			Button.antialiasing = true;
			Button.updateHitbox();
			Button.scrollFactor.set();
			Button.ID = i;
			switch(i) {
				case 0:
					Button.setPosition(735, 105);
				case 1:
					Button.setPosition(770, 217);
				case 2:
					Button.setPosition(805, 329);
				case 3:
					Button.setPosition(840, 441);
				case 4:
					Button.setPosition(875, 553);
					Button.alpha = 0;
				case 5:
					Button.setPosition(910, 665);
					Button.alpha = 0;
				case 6:
					Button.setPosition(945, 777);
					Button.alpha = 0;
			}
			Buttons.add(Button);
		}
		ArrowUp = new FlxSprite(0,0).loadGraphic(Paths.image('mainmenu/arrow-up'));
		ArrowUp.antialiasing = ClientPrefs.data.antialiasing;
		ArrowUp.screenCenter();
		add(ArrowUp);
		
		ArrowDown = new FlxSprite(0,10).loadGraphic(Paths.image('mainmenu/arrow-down'));
		ArrowDown.antialiasing = ClientPrefs.data.antialiasing;
		ArrowDown.screenCenter();
		add(ArrowDown);
		
		ArrowUpSel = new FlxSprite(0,0).loadGraphic(Paths.image('mainmenu/arrow-up-sel'));
		ArrowUpSel.antialiasing = ClientPrefs.data.antialiasing;
		ArrowUpSel.screenCenter();
		add(ArrowUpSel);
		ArrowUpSel.alpha = 0;
		
		ArrowDownSel = new FlxSprite(0,10).loadGraphic(Paths.image('mainmenu/arrow-down-sel'));
		ArrowDownSel.antialiasing = ClientPrefs.data.antialiasing;
		ArrowDownSel.screenCenter();
		add(ArrowDownSel);
		ArrowDownSel.alpha = 0;
		
		PressAlt = new FlxSprite(949, 676).loadGraphic(Paths.image('mainmenu/press-alt'));
		PressAlt.antialiasing = ClientPrefs.data.antialiasing;
		PressAlt.scrollFactor.set();
		PressAlt.alpha = 0;
		add(PressAlt);
		
		//ETC
		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		blackScreen.alpha = 0;
		add(blackScreen);
		
		#if mobile
			addVirtualPad(UP_DOWN, A_B_C_D);
			virtualPad.y = -150;
		#end

		var psychVer:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		psychVer.scrollFactor.set();
		psychVer.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(psychVer);
		var fnfVer:FlxText = new FlxText(12, FlxG.height - 24, 0, "Omnipresent Noimix v" + Application.current.meta.get('version'), 12);
		fnfVer.scrollFactor.set();
		fnfVer.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(fnfVer);
		
		select(false);
		super.create();
	}

	#if desktop
	#if UPDATE_CHANGELOG
	var UpdInfoOnOrOffRN:Bool = false;
	function newUpdateLightOnOff(on:Bool) {
		if (on) {
			if (!UpdInfoOnOrOffRN) {
				onoff = true;
				UpdInfoOnOrOffTween = new FlxTimer().start(0.75, function(tmr:FlxTimer) {
					if (!onoff) {
						UpdInfoNewDark.alpha = 1;
						UpdInfoNew.alpha = 0;
					} else {
						UpdInfoNewDark.alpha = 0;
						UpdInfoNew.alpha = 1;
					}
					onoff = !onoff;
					tmr.reset(0.75);
				});
			}
			UpdInfoOnOrOffRN = true;
		} else {
			UpdInfoOnOrOffTween.cancel();
			UpdInfoOnOrOffRN = false;
		}
	}
	#end
	#end
	
	function select(SoundPlay:Bool = true, num:Int = 0, ?Pressed:String = '', ?mouse:Bool = false)
	{
		if (SoundPlay) FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		if (!mouse) {
			curSelected += num;
			if (curSelected >= Buttons.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = Buttons.length - 1;
		} else {
			if (curSelected != num) curSelected = num;
		}
		if (!cursorArrowsFix) {
			if (Pressed == 'up') {
				scrollsDown = false;
				ArrowUp.alpha = 0;
				ArrowUpSel.alpha = 1;
				ArrowUp.y = -10;
				ArrowUpSel.y = -10;
			}
			if (Pressed == 'down') {
				scrollsDown = true;
				ArrowDown.alpha = 0;
				ArrowDownSel.alpha = 1;
				ArrowDown.y = 20;
				ArrowDownSel.y = 20;
			}
		}
		
		Buttons.forEach(function(spr:FlxSprite)
		{
			switch (spr.ID)
			{
				default:
					if (spr.ID == curSelected) {
						spr.animation.play('sel');
					} else {
						spr.animation.play('idle');
					}
			}
			spr.updateHitbox();
		});
	}
	
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		ArrowUp.y = FlxMath.lerp(ArrowUp.y, 0, CoolUtil.boundTo(elapsed * 12, 0, 1));
		ArrowUpSel.y = FlxMath.lerp(ArrowUpSel.y, 0, CoolUtil.boundTo(elapsed * 12, 0, 1));
		ArrowDown.y = FlxMath.lerp(ArrowDown.y, 10, CoolUtil.boundTo(elapsed * 12, 0, 1));
		ArrowDownSel.y = FlxMath.lerp(ArrowDownSel.y, 10, CoolUtil.boundTo(elapsed * 12, 0, 1));
		
		if (FlxG.sound.music.volume < 0.8)
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		
		if (!selectedSomethin && !lockedControl) {
			var shiftMult:Int = 1;
			if(FlxG.keys.pressed.SHIFT) shiftMult = 3;
				if (controls.UI_UP_P)
				{
					select(true,-shiftMult,'up');
					holdTime = 0;
				}
				if (controls.UI_DOWN_P)
				{
					select(true,shiftMult,'down');
					holdTime = 0;
				}
				if (controls.UI_DOWN_P || controls.UI_UP_P)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						if (controls.UI_UP_P) select(true,(checkNewHold - checkLastHold) * (controls.UI_UP_P ? -shiftMult : shiftMult), 'up');
						if (controls.UI_DOWN_P) select(true,(checkNewHold - checkLastHold) * (controls.UI_UP_P ? -shiftMult : shiftMult), 'down');
					}
				}
				if (FlxG.mouse.wheel != 0)
				{
					if (FlxG.mouse.wheel > 0) select(true,-shiftMult * FlxG.mouse.wheel,'up');
					if (FlxG.mouse.wheel < 0) select(true,-shiftMult * FlxG.mouse.wheel,'down');
					holdTime = 0;
				}
			
			if ((controls.ACCEPT) || (FlxG.mouse.overlaps(Buttons) && (FlxG.mouse.justReleased) || (FlxG.mouse.justPressedMiddle) && !FlxG.mouse.overlaps(PressAlt))) {
					#if desktop
					lockMouseSelection = true;
					#end
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'), 0.4);

					Buttons.forEach(function(spr:FlxSprite)
					{
						Accepted = true;
						if (!IhateThatFuckingShitCode) accept();
						new FlxTimer().start(1, function(hello:FlxTimer)
						{
							var daChoice:String = optionShit[curSelected];
							switch (daChoice)
							{
								case 'story_mode':
									MusicBeatState.switchState(new StoryMenuState());
								case 'freeplay':
									MusicBeatState.switchState(new FreeplayState());
								case 'credits':
									MusicBeatState.switchState(new CreditsState());
								case 'options':
									MusicBeatState.switchState(new options.OptionsState());
							}
						});
					});
				}
		}
	}
	
	function accept()
	{
		if (Accepted) {
			#if desktop
			if (!FlxG.mouse.overlaps(Buttons)) {
				if (scrollsDown) {
					Buttons.forEach(function(spr:FlxSprite) {
						switch (curSelected) {
							case 0:
								if (spr.ID == 0) spr.animation.play('epilepsy');
								if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 1:
								if (spr.ID == 1) spr.animation.play('epilepsy');
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 2:
								if (spr.ID == 2) spr.animation.play('epilepsy');
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 3:
								if (spr.ID == 3) spr.animation.play('epilepsy');
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 4:
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) spr.animation.play('epilepsy');
								if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 5:
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) spr.animation.play('epilepsy');
								if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 6:
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 6) spr.animation.play('epilepsy');
						}
					});
				} else {
					Buttons.forEach(function(spr:FlxSprite) {
						switch (curSelected) {
							case 0:
								if (spr.ID == 0) spr.animation.play('epilepsy');
								if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 1:
								if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 1) spr.animation.play('epilepsy');
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 2:
								if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 2) spr.animation.play('epilepsy');
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 3:
								if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) spr.animation.play('epilepsy');
							case 4:
								if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) spr.animation.play('epilepsy');
							case 5:
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) spr.animation.play('epilepsy');
							case 6:
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 6) spr.animation.play('epilepsy');
						}
					});
				}
			} else {
				if (!secondPage) {
					Buttons.forEach(function(spr:FlxSprite) {
						switch (curSelected) {
							case 0:
								if (spr.ID == 0) spr.animation.play('epilepsy');
								if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 1:
								if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 1) spr.animation.play('epilepsy');
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 2:
								if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 2) spr.animation.play('epilepsy');
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 3:
								if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 3) spr.animation.play('epilepsy');
						}
					});
				} else {
					Buttons.forEach(function(spr:FlxSprite) {
						switch (curSelected) {
							case 3:
								if (spr.ID == 3) spr.animation.play('epilepsy');
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 4:
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) spr.animation.play('epilepsy');
								if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 5:
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) spr.animation.play('epilepsy');
								if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							case 6:
								if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
								if (spr.ID == 6) spr.animation.play('epilepsy');
						}
					});
				}
			}
			#else
			if (scrollsDown) {
				Buttons.forEach(function(spr:FlxSprite) {
					switch (curSelected) {
						case 0:
							if (spr.ID == 0) spr.animation.play('epilepsy');
							if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 1:
							if (spr.ID == 1) spr.animation.play('epilepsy');
							if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 2:
							if (spr.ID == 2) spr.animation.play('epilepsy');
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 3:
							if (spr.ID == 3) spr.animation.play('epilepsy');
							if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 4:
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 4) spr.animation.play('epilepsy');
							if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 5:
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 5) spr.animation.play('epilepsy');
							if (spr.ID == 6) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 6:
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 6) spr.animation.play('epilepsy');
					}
				});
			} else {
				Buttons.forEach(function(spr:FlxSprite) {
					switch (curSelected) {
						case 0:
							if (spr.ID == 0) spr.animation.play('epilepsy');
							if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 1:
							if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 1) spr.animation.play('epilepsy');
							if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 2:
							if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 2) spr.animation.play('epilepsy');
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
						case 3:
							if (spr.ID == 0) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 3) spr.animation.play('epilepsy');
						case 4:
							if (spr.ID == 1) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 4) spr.animation.play('epilepsy');
						case 5:
							if (spr.ID == 2) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 5) spr.animation.play('epilepsy');
						case 6:
							if (spr.ID == 3) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 4) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 5) FlxTween.color(spr, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
							if (spr.ID == 6) spr.animation.play('epilepsy');
					}
				});
			}
			#end
		}
		if (!cursorArrowsFix) {
			FlxTween.color(ArrowUp, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
			FlxTween.color(ArrowDown, 0.3, 0xFFFFFFFF, 0xFF515151, {ease: FlxEase.quadOut});
		}
		IhateThatFuckingShitCode = true;
	}
}