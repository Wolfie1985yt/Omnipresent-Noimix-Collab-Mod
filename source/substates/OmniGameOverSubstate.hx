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
import states.PlayState;
import objects.Character;
#if hxvlc
import vlc.MP4Handler as VideoHandler;
#else
import vlc.MP4Handler as MP4Handler;
#end

class OmniGameOverSubstate extends MusicBeatSubstate
{
	public static var instance:OmniGameOverSubstate;

	var coolcamera:FlxCamera;
	var blackScreen:FlxSprite;
	var opponentName:String;
	var gfName:String;
	var bfName:String;
	#if hxvlc
	var video:VideoHandler = new VideoHandler();
	#else
	var video:MP4Handler;
	#end
	var videoIsFinished:Bool = false;

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
		bfName = playStateInstance.boyfriend.curCharacter;
		
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
		#if hxvlc
		video = new VideoHandler();
		#else
		video = new MP4Handler();
		#end
		switch(FlxG.random.int(1, 100)) {
			case 100:
				#if hxvlc video.play #else video.playVideo #end(Paths.video('tune this out bitch'));
				#if hxvlc
				video.volume = 100;
				#end
			
			case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99:	
				if (opponentName == 'tailsdoll' || opponentName == 'tailsdoll-flipped') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video('test1'));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (opponentName == 'BEAST-Enc' && gfName == 'Tails-Encore') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video('sonic_jacking_off'));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (bfName == 'bf-encore-small' && opponentName == 'BEAST-Enc' && gfName == 'Needlemouse' || bfName == 'bf-encore-pixel-smaller' || bfName == 'bf-needle-encore-small' || bfName == 'bf-john9doe-3d-small') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('YEAAAAAAAAAAAAAAAAAAAAAAAAA'));
							#if hxvlc
							video.volume = 100;
							#end
						case 2:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('bfhair'));
							#if hxvlc
							video.volume = 100;
							#end
					}
				}
				if (opponentName == 'Chaotix' || opponentName == 'wechBeast' || opponentName == 'Knuckles-Encore' || opponentName == 'wechBeast-flipped') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video('i am wechidn-asdfl;'));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (opponentName == 'Satanos' || opponentName == 'Eggman-Encore' || opponentName == 'Eggman-Encore-flipped' || opponentName == 'wechBeast-flipped') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video('EGGMAN NO'));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (opponentName == 'exe-encore') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video('Googoogaagaa'));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (opponentName == 'fleetway' || opponentName == 'fleetway-anims2' || opponentName == 'fleetway-anims3' || opponentName == 'fleetwaylaser') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video('fleetgeta'));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (opponentName == 'sunky' || opponentName == 'coldsteel' || opponentName == 'coldsteel_guitar' || opponentName == 'sanic' || opponentName == 'coldsteel-flipped' || opponentName == 'sanic-flipped') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('gettrolled'));
							#if hxvlc
							video.volume = 100;
							#end
						case 2:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('Sunky Chad'));
							#if hxvlc
							video.volume = 100;
							#end
					}
				}
				if (opponentName == 'hog') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('HogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHog'));
							#if hxvlc
							video.volume = 100;
							#end
						case 2:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('hogToaster'));
							#if hxvlc
							video.volume = 100;
							#end
					}
				}
				if (opponentName == 'lordxEncore') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video("HUEHUEHUE'D"));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (opponentName == 'Needlemouse' || opponentName == 'Needlemouse-flipped' || opponentName == 'Needlemouse-p2' || opponentName == 'Needlemouse-p2-flipped' || opponentName == 'Tails-Encore' || opponentName == 'Tails-Encore-flipped') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video('he has a point'));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (opponentName == 'xterion-first' || opponentName == 'xterion-second') {
					#if hxvlc video.play #else video.playVideo #end(Paths.video('what'));
					#if hxvlc
					video.volume = 100;
					#end
				}
				if (opponentName == 'scorched' || opponentName == 'scorched-flipped') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('MWAHAHAHA'));
							#if hxvlc
							video.volume = 100;
							#end
						case 2:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('Scorched Yes'));
							#if hxvlc
							video.volume = 100;
							#end
					}
				}
				if (opponentName == 'faker-encore' || opponentName == 'faker_pixel') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('imbouttocuuuuuuuuuuuuuuuuuuu'));
							#if hxvlc
							video.volume = 100;
							#end
						case 2:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('its his mic fr'));
							#if hxvlc
							video.volume = 100;
							#end
					}
				}
				if (opponentName == 'majin' || opponentName == 'majin-flipped') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('Mother I have shidded the bed.'));
							#if hxvlc
							video.volume = 100;
							#end
						case 2:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('bitchless'));
							#if hxvlc
							video.volume = 100;
							#end
					}
				}
				if (opponentName == 'fatal-sonic' || opponentName == 'true-fatal') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('Fatal Error Singing'));
							#if hxvlc
							video.volume = 100;
							#end
						case 2:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('howitfeelstochew5gums'));
							#if hxvlc
							video.volume = 100;
							#end
					}
				}
				if (opponentName == 'BEAST-Enc' && gfName == 'gf' || opponentName == 'sonicexe' || opponentName == 'ycr-cherribun' || opponentName == 'ycr-mad-cherribun') {
					switch(FlxG.random.int(1, 4)) {
						case 1:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('forkliftcertified'));
							#if hxvlc
							video.volume = 100;
							#end
						case 2:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('omg sonic'));
							#if hxvlc
							video.volume = 100;
							#end
						case 3:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('myfinger'));
							#if hxvlc
							video.volume = 100;
							#end
						case 4:
							#if hxvlc video.play #else video.playVideo #end(Paths.video('no_ice_cream'));
							#if hxvlc
							video.volume = 100;
							#end
					}
				}
		}
		#if hxvlc
		video.onEndReached.add(function() { videoIsFinished = true; video.dispose(); endBullshit(); }, true);
		#else
		video.finishCallback = function() { videoIsFinished = true; endBullshit(); }
		#end
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					MusicBeatState.resetState();
				});
			});
			PlayState.instance.callOnLuas('onGameOverConfirm', [true]);
		}
	}
}
