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

		#if windows
		RAM = SystemInfo.getTotalRAM();
		
		if (RAM < 7) {
			Incompatible = true;
		}
		//trace('Total RAM on Device: ' + RAM + ' GB, Max Needed: 7 GB');
		#end

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Hey, watch out!\n
			This Mod contains some flashing lights!\n
			And, this WILL lag, there is no getting around that. Some of it is intentional though.\n
			Press button A to start the game\n
			Press button B to start the game and disable flashing lights\n
			You've been warned!",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);

		#if mobile addVPad(NONE, A_B); isSubState = false; #end
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT || controls.BACK) {
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(controls.BACK) {
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
