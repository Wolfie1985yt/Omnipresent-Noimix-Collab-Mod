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
#if desktop
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
	#if desktop
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
		#if desktop
		video = new VideoHandler();
		#else
		video = new MP4Handler();
		#end
		switch(FlxG.random.int(1, 100)) {
			case 100:
				video.playVideo(Paths.video('tune this out bitch'));
				#if desktop
				video.volume = 100;
				#end
			
			case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99:	
				if (opponentName == 'tailsdoll' || opponentName == 'tailsdoll-flipped') {
					video.playVideo(Paths.video('test1'));
					#if desktop
					video.volume = 100;
					#end
				}
				if (opponentName == 'BEAST-Enc' && gfName == 'Tails-Encore') {
					video.playVideo(Paths.video('sonic_jacking_off'));
					#if desktop
					video.volume = 100;
					#end
				}
				if (bfName == 'bf-encore-small' && opponentName == 'BEAST-Enc' && gfName == 'Needlemouse' || bfName == 'bf-encore-pixel-smaller' || bfName == 'bf-needle-encore-small' || bfName == 'bf-john9doe-3d-small') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							video.playVideo(Paths.video('YEAAAAAAAAAAAAAAAAAAAAAAAAA'));

						case 2:
							video.playVideo(Paths.video('bfhair'));

					}
				}
				if (opponentName == 'Chaotix' || opponentName == 'wechBeast' || opponentName == 'Knuckles-Encore' || opponentName == 'wechBeast-flipped') {
					video.playVideo(Paths.video('i am wechidn-asdfl;'));
					#if desktop
					video.volume = 100;
					#end
				}
				if (opponentName == 'Satanos' || opponentName == 'Eggman-Encore' || opponentName == 'Eggman-Encore-flipped' || opponentName == 'wechBeast-flipped') {
					video.playVideo(Paths.video('EGGMAN NO'));
					#if desktop
					video.volume = 100;
					#end
				}
				if (opponentName == 'exe-encore') {
					video.playVideo(Paths.video('Googoogaagaa'));
					#if desktop
					video.volume = 100;
					#end
				}
				if (opponentName == 'fleetway' || opponentName == 'fleetway-anims2' || opponentName == 'fleetway-anims3' || opponentName == 'fleetwaylaser') {
					video.playVideo(Paths.video('fleetgeta'));
					#if desktop
					video.volume = 100;
					#end
				}
				if (opponentName == 'sunky' || opponentName == 'coldsteel' || opponentName == 'coldsteel_guitar' || opponentName == 'sanic' || opponentName == 'coldsteel-flipped' || opponentName == 'sanic-flipped') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							video.playVideo(Paths.video('gettrolled'));

						case 2:
							video.playVideo(Paths.video('Sunky Chad'));

					}
				}
				if (opponentName == 'hog') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							video.playVideo(Paths.video('HogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHog'));

						case 2:
							video.playVideo(Paths.video('hogToaster'));

					}
				}
				if (opponentName == 'lordxEncore') {
					video.playVideo(Paths.video("HUEHUEHUE'D"));
					#if desktop
					video.volume = 100;
					#end
				}
				if (opponentName == 'Needlemouse' || opponentName == 'Needlemouse-flipped' || opponentName == 'Needlemouse-p2' || opponentName == 'Needlemouse-p2-flipped' || opponentName == 'Tails-Encore' || opponentName == 'Tails-Encore-flipped') {
					video.playVideo(Paths.video('he has a point'));
					#if desktop
					video.volume = 100;
					#end
				}
				if (opponentName == 'xterion-first' || opponentName == 'xterion-second') {
					video.playVideo(Paths.video('what'));
					#if desktop
					video.volume = 100;
					#end
				}
				if (opponentName == 'scorched' || opponentName == 'scorched-flipped') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							video.playVideo(Paths.video('MWAHAHAHA'));

						case 2:
							video.playVideo(Paths.video('Scorched Yes'));

					}
				}
				if (opponentName == 'faker-encore' || opponentName == 'faker_pixel') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							video.playVideo(Paths.video('imbouttocuuuuuuuuuuuuuuuuuuu'));

						case 2:
							video.playVideo(Paths.video('its his mic fr'));

					}
				}
				if (opponentName == 'majin' || opponentName == 'majin-flipped') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							video.playVideo(Paths.video('Mother I have shidded the bed.'));

						case 2:
							video.playVideo(Paths.video('bitchless'));

					}
				}
				if (opponentName == 'fatal-sonic' || opponentName == 'true-fatal') {
					switch(FlxG.random.int(1, 2)) {
						case 1:
							video.playVideo(Paths.video('Fatal Error Singing'));

						case 2:
							video.playVideo(Paths.video('howitfeelstochew5gums'));

					}
				}
				if (opponentName == 'BEAST-Enc' && gfName == 'gf' || opponentName == 'sonicexe' || opponentName == 'ycr-cherribun' || opponentName == 'ycr-mad-cherribun') {
					switch(FlxG.random.int(1, 4)) {
						case 1:
							video.playVideo(Paths.video('forkliftcertified'));

						case 2:
							video.playVideo(Paths.video('omg sonic'));

						case 3:
							video.playVideo(Paths.video('myfinger'));

						case 4:
							video.playVideo(Paths.video('no_ice_cream'));

					}
				}
		}
		video.finishCallback = function() { videoIsFinished = true; endBullshit(); }
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
