package states;

import flixel.FlxSubState;

import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;

import system.SystemInfo;

class WarningState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var RAMAgain:Float;
	
	var warnText:FlxText;
	override function create()
	{
		super.create();

		RAMAgain = Math.round(SystemInfo.getTotalRAM());

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			" Hey, you are seeing this message because your PC doesnt meet the mod requirements!\n
			 This Mod requires at least 16GB of RAM, or a really good GPU (4 or more GB of VRAM).\n
			 According to the mod, you have about " + RAMAgain + "GB of usable RAM.\n
			 There is a setting in the options called Smart Caching, which you can use if you have a good GPU to decrease lag.\n
			 You can still try to play but no guarantees!\n
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
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				FlxG.sound.play(Paths.sound('confirmMenu'));
				FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
					new FlxTimer().start(0.5, function (tmr:FlxTimer) {
						MusicBeatState.switchState(new TitleState());
					});
				});
			}
		}
		super.update(elapsed);
	}
}
