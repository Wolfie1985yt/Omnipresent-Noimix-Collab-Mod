package substates;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxCamera;
import states.StoryMenuState;
import states.FreeplayState;
import objects.Character;
import backend.Song;
import haxe.Json;
import states.PlayState as PlayState;

import hxvlc.flixel.FlxVideoSprite;

class OmniGameOverSubstate extends MusicBeatSubstate
{
	public static var instance:OmniGameOverSubstate;

	var coolcamera:FlxCamera;
	var blackScreen:FlxSprite;
	var opponentName:String;
	var gfName:String;
	var videoIsFinished:Bool = false;
	
	var video:FlxVideoSprite;
	
	public static var SONG:SwagSong = null;

	override function create()
	{
		instance = this;
		PlayState.instance.callOnLuas('onGameOverStart', []);

		super.create();
	}

	public function new()
	{
		super();

		var playStateInstance = PlayState.instance;

		opponentName = playStateInstance.dad.curCharacter;
		gfName = playStateInstance.gf.curCharacter;
    
		trace(playStateInstance.dad.curCharacter);

		PlayState.instance.setOnLuas('inGameOver', true);

		Conductor.songPosition = 0;

		coolcamera = new FlxCamera();
		coolcamera.bgColor.alpha = 0;
		FlxG.cameras.add(coolcamera);

		FlxG.camera.scroll.set();
		FlxG.camera.target = null;
		
		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(blackScreen);
		blackScreen.cameras = [coolcamera];

		switch(FlxG.random.int(1, 100)) {			
		case 100:
			video = new FlxVideoSprite(0, 0);
			video.updateHitbox();
			video.load(Paths.video('tune this out bitch'));
			add(video);
			video.play();
			video.bitmap.onEndReached.add(function() 
			{
				video.destroy();
				endBullshit();
			});
		case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99:
			if (opponentName == 'tailsdoll') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('test1'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'xterion-first') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('what'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (gfName == 'sonic' || opponentName == 'fleetway') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('fleetgeta'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'Chaotix' || opponentName == 'wechBeast' || opponentName == 'Knuckles-Encore') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('i am wechidn-asdfl;'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'Satanos' || opponentName == 'Eggman-Encore') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('EGGMAN NO'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'sonicexe') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('omg sonic'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
						
					case 2:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('myfinger'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
				}
			}
			if (opponentName == 'lordxEncore') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video("HUEHUEHUE'D"));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}	
			if (opponentName == 'Tails-Encore' || opponentName == 'Needlemouse' && gfName == 'gf' || opponentName == 'Needlemouse' && gfName == 'Tails-Encore') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('he has a point'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'sunky' || opponentName == 'sanic') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('Sunky Chad'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'BEAST-Enc' || gfName == 'Tails-Encore') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('sonic_jacking_off'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'majin') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('bitchless'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
					
					case 2:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('Mother I have shidded the bed.'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
				}
			}
			if (opponentName == 'BEAST-Enc' && gfName == 'gf') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('forkliftcertified'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
				
					case 2:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('no_ice_cream'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
				}
			}
			if (opponentName == 'coldsteel' || opponentName == 'guitar') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('gettrolled'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'faker-encore') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('imbouttocuuuuuuuuuuuuuuuuuuu'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'faker_pixel') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('its his mic fr'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'exe-encore') {
				video = new FlxVideoSprite(0, 0);
				video.updateHitbox();
				video.load(Paths.video('Googoogaagaa'));
				add(video);
				video.play();
				video.bitmap.onEndReached.add(function() 
				{
					video.destroy();
					endBullshit();
				});
			}
			if (opponentName == 'fatal-sonic') {
				switch(FlxG.random.int(1, 10)) {
					case 1, 2, 3, 4, 5, 6, 7, 8, 9:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('howitfeelstochew5gum'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
					
					case 10:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('Fatal Error Singing'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
				}
			}
			if (opponentName == 'gf') {
				switch(FlxG.random.int(1, 10)) {
					case 1, 2, 3, 4, 5, 6, 7, 8, 9:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('YEAAAAAAAAAAAAAAAAAAAAAAAAA'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
					
					case 10:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('bfhair'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
				}
			}
			if (opponentName == 'hog') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('HogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHog'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
					
					case 2:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('hogToaster'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
				}
			}
			if (opponentName == 'scorched') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('Scorched Yes'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
					
					case 2:
						video = new FlxVideoSprite(0, 0);
						video.updateHitbox();
						video.load(Paths.video('MWAHAHAHA'));
						add(video);
						video.play();
						video.bitmap.onEndReached.add(function() 
						{
							video.destroy();
							endBullshit();
						});
				}
			}
		}
		#if mobile
		addVirtualPad(NONE, A_B);
		addHitboxCamera();
		#end
	}

	override function update(elapsed:Float)
	{
	
		super.update(elapsed);

		PlayState.instance.callOnLuas('onUpdate', [elapsed]);

		if (controls.ACCEPT && videoIsFinished || controls.BACK && videoIsFinished)
		{
			endBullshit();
		}
		
		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
		PlayState.instance.callOnScripts('onUpdatePost', [elapsed]);
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				#if android
				FlxTween.tween(virtualPad, {alpha: 0}, 2); //mariomaster was here
				#end
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					MusicBeatState.resetState();
				});
			});
			PlayState.instance.callOnLuas('onGameOverConfirm', [true]);
		}
	}

	override function destroy()
	{
		instance = null;
		super.destroy();
	}
}

