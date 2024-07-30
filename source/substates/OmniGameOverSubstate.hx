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

import vlc.MP4Handler as VideoHandler;

class OmniGameOverSubstate extends MusicBeatSubstate
{
	public static var instance:OmniGameOverSubstate;

	var coolcamera:FlxCamera;
	var blackScreen:FlxSprite;
	var opponentName:String;
	var gfName:String;
	var video:VideoHandler;
	var videoIsFinished:Bool = false;
	
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
		video = new VideoHandler();

		switch(FlxG.random.int(1, 100)) {			
		case 100:
			video.playVideo(Paths.video('tune this out bitch'));
			#if desktop
			video.volume = 300;
			#end
		case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99:
			if (opponentName == 'tailsdoll') {
				video.playVideo(Paths.video('test1'));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'xterion-first') {
				video.playVideo(Paths.video('what'));
				#if desktop
				video.volume = 300;
				#end
			}
			if (gfName == 'sonic' || opponentName == 'fleetway') {
				video.playVideo(Paths.video('fleetgeta'));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'Chaotix' || opponentName == 'wechBeast' || opponentName == 'Knuckles-Encore') {
				video.playVideo(Paths.video('i am wechidn-asdfl;'));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'Satanos' || opponentName == 'Eggman-Encore') {
				video.playVideo(Paths.video('EGGMAN NO'));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'sonicexe') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video.playVideo(Paths.video('omg sonic'));
						#if desktop
						video.volume = 300;
						#end
					
					case 2:
						video.playVideo(Paths.video('myfinger'));
						#if desktop
						video.volume = 300;
						#end
				}
			}
			if (opponentName == 'lordxEncore') {
				video.playVideo(Paths.video("HUEHUEHUE'D"));
				#if desktop
				video.volume = 300;
				#end
			}	
			if (opponentName == 'Tails-Encore' || opponentName == 'Needlemouse' && gfName == 'gf' || opponentName == 'Needlemouse' && gfName == 'Tails-Encore') {
				video.playVideo(Paths.video("he has a point"));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'sunky' || opponentName == 'sanic') {
				video.playVideo(Paths.video("Sunky Chad"));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'BEAST-Enc' || gfName == 'Tails-Encore') {
				video.playVideo(Paths.video("sonic_jacking_off"));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'majin') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video.playVideo(Paths.video('bitchless'));
						#if desktop
						video.volume = 300;
						#end
					
					case 2:
						video.playVideo(Paths.video('Mother I have shidded the bed.'));
						#if desktop
						video.volume = 300;
						#end
				}
			}
			if (opponentName == 'BEAST-Enc' && gfName == 'gf') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video.playVideo(Paths.video('forkliftcertified'));
						#if desktop
						video.volume = 300;
						#end
				
					case 2:
						video.playVideo(Paths.video('no_ice_cream'));
						#if desktop
						video.volume = 300;
						#end
				}
			}
			if (opponentName == 'coldsteel' || opponentName == 'guitar') {
				video.playVideo(Paths.video("gettrolled"));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'faker-encore') {
				video.playVideo(Paths.video("imbouttocuuuuuuuuuuuuuuuuuuu"));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'faker_pixel') {
				video.playVideo(Paths.video("its his mic fr"));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'exe-encore') {
				video.playVideo(Paths.video("Googoogaagaa"));
				#if desktop
				video.volume = 300;
				#end
			}
			if (opponentName == 'fatal-sonic') {
				switch(FlxG.random.int(1, 10)) {
					case 1, 2, 3, 4, 5, 6, 7, 8, 9:
						video.playVideo(Paths.video('howitfeelstochew5gum'));
						#if desktop
						video.volume = 300;
						#end
					
					case 10:
						video.playVideo(Paths.video('Fatal Error Singing'));
						#if desktop
						video.volume = 300;
						#end
				}
			}
			if (opponentName == 'gf') {
				switch(FlxG.random.int(1, 10)) {
					case 1, 2, 3, 4, 5, 6, 7, 8, 9:
						video.playVideo(Paths.video('YEAAAAAAAAAAAAAAAAAAAAAAAAA'));
						#if desktop
						video.volume = 300;
						#end
					
					case 10:
						video.playVideo(Paths.video('bfhair'));
						#if desktop
						video.volume = 300;
						#end
				}
			}
			if (opponentName == 'hog') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video.playVideo(Paths.video('HogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHog'));
						#if desktop
						video.volume = 300;
						#end
					
					case 2:
						video.playVideo(Paths.video('hogToaster'));
						#if desktop
						video.volume = 300;
						#end
				}
			}
			if (opponentName == 'scorched') {
				switch(FlxG.random.int(1, 2)) {
					case 1:
						video.playVideo(Paths.video('Scorched Yes'));
						#if desktop
						video.volume = 300;
						#end
					
					case 2:
						video.playVideo(Paths.video('MWAHAHAHA'));
						#if desktop
						video.volume = 300;
						#end
				}
			}
		}
		video.finishCallback = function() { videoIsFinished = true; }
		
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

