package states;

import flixel.FlxSubState;

import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;

import states.WarningState;
import system.SystemInfo;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var RAM:Float = 0;
	var Incompatible:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		RAM = SystemInfo.getTotalRAM();
		
		if (RAM < 15) {
			Incompatible = true;
		}
		trace('Total RAM on Device: ' + RAM + ' GB, Max Needed: 15 GB');

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Hey, watch out!\n
			This Mod contains some flashing lights!\n
			Press ENTER to disable them now or go to Options Menu.\n
			Press ESCAPE to ignore this message.\n
			You've been warned!",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(!back) {
					ClientPrefs.data.flashing = false;
					ClientPrefs.saveSettings();
					FlxG.sound.play(Paths.sound('confirmMenu'));
					FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							if (Incompatible) {
								leftState = false;
								MusicBeatState.switchState(new WarningState());
							} else {
								leftState = true;
								MusicBeatState.switchState(new TitleState());
							}
						});
					});
				} else {
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(warnText, {alpha: 0}, 1, {
						onComplete: function (twn:FlxTween) {
							if (Incompatible) {
								leftState = false;
								MusicBeatState.switchState(new WarningState());
							} else {
								leftState = true;
								MusicBeatState.switchState(new TitleState());
							}
						}
					});
				}
			}
		}
		super.update(elapsed);
	}
}
