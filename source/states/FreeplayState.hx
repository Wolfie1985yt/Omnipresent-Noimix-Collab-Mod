package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.display.FlxTiledSprite;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.net.curl.CURLCode;
import flixel.FlxCamera;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import substates.GameplayChangersSubstate;
import substates.ResetScoreSubState;

import flixel.math.FlxMath;

using StringTools;

class FreeplayState extends MusicBeatState
{
	var BG:FlxSprite;
	var art:FlxSprite;
	var stati:FlxSprite;
	var cover:FlxSprite;
	var charText:FlxText;
	var songText:FlxText;
	
	var scoreText:FlxText;
	var diffText:FlxText;
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;
	
	public var omniBeaten:Bool = ClientPrefs.data.omnipresentBeat;
	var select:Bool = false;
	var loading:Bool = false;
	
	private var camGame:FlxCamera;
	
	override public function create()
	{
		#if DISCORD_ALLOWED
		DiscordClient.changePresence("In the Freeplay Menu", null); 
		#end
		
		Paths.clearUnusedMemory();
		FlxG.sound.playMusic(Paths.music('freeplaymode'), 0.7);

		camGame = new FlxCamera();
		FlxG.cameras.reset(camGame);
		FlxCamera.defaultCameras = [camGame];
		
		if (!ClientPrefs.data.lowQuality) {
			BG = new FlxSprite(0, 0);
			BG.frames = Paths.getSparrowAtlas('mainmenu/bg');
			BG.antialiasing = false;
			BG.animation.addByPrefix('bgAnim', 'BG instance 1', 24);
			BG.setGraphicSize(Std.int(BG.width * 1));
			BG.animation.play('bgAnim');
			BG.updateHitbox();
			BG.screenCenter();
			add(BG);
		} else {
			BG = new FlxSprite(0, 0);
			BG.frames = Paths.getSparrowAtlas('blank');
			BG.antialiasing = false;
			BG.animation.addByPrefix('bgAnim', 'fun', 24);
			BG.setGraphicSize(Std.int(BG.width * 1));
			BG.animation.play('bgAnim');
			BG.updateHitbox();
			BG.screenCenter();
			add(BG);
		}

		art = new FlxSprite(-325, 0);
		if (omniBeaten) {
			art.loadGraphic(Paths.image('freeplay-encore/freeplay/omnipresent'));
		} else {
			art.loadGraphic(Paths.image('freeplay-encore/freeplay/uncompleted'));
		}
		art.visible = true;
		art.screenCenter(Y);
		art.scale.set(0.55, 0.55);
		add(art);

		cover = new FlxSprite(-325, 0);
		cover.loadGraphic(Paths.image('freeplay-encore/FreeBox'));
		cover.visible = true;
		cover.screenCenter(Y);
		cover.scale.set(0.55, 0.55);
		
		stati = new FlxSprite(0, 0);
		stati.frames = Paths.getSparrowAtlas('freeplay-encore/static');
		stati.animation.addByPrefix('stat', 'static', 24);
		stati.animation.play('stat');
		stati.visible = true;
		stati.screenCenter(Y);
		stati.alpha = 0.3;
		stati.x = 5;
		stati.antialiasing = false;
		stati.scale.set(0.56, 0.56);
		
		add(stati);
		add(cover);

		songText = new FlxText(0 , 25, 0, "", 32); 
		songText.setFormat(Paths.font("sonic-cd-menu-font.ttf"), songText.size, FlxColor.WHITE, CENTER);
		songText.screenCenter(X);
		songText.color = 0xFF232323;
		if (omniBeaten) {
			songText.text = 'omnipresent';
		} else {
			songText.text = '???';
		}
		songText.screenCenter(X);
		songText.screenCenter(Y);
		songText.x += 325;
		add(songText);

		charText = new FlxText(0 , 25, 0, "", 32); 
		charText.setFormat(Paths.font("sonic-cd-menu-font.ttf"), charText.size, FlxColor.WHITE, CENTER);
		charText.screenCenter(X);
		if (omniBeaten) {
			charText.text = 'fucked';
		} else {
			charText.text = '???';
		}
		charText.screenCenter(X);
		add(charText);

		scoreText = new FlxText(FlxG.width * 0.7, charText.y + 65, 0, "", 16);
		scoreText.setFormat(Paths.font("sonic-cd-menu-font.ttf"), scoreText.size, FlxColor.WHITE, RIGHT);
		scoreText.screenCenter(X);
		scoreText.x -= 98;
		add(scoreText);
		
		ScoreUPD();
		
		super.create();
	}

	function ScoreUPD()
	{
		#if !switch
		intendedScore = Highscore.getScore('omnipresent-fucked', 2);
		#end
		scoreText.text = 'SCORE: ' + lerpScore;
		scoreText.screenCenter(X);
	}

    override public function update(elapsed:Float)
    {    
        super.update(elapsed); // Ensure the base class update method is called first
        
        intendedScore = Highscore.getScore('omnipresent-fucked', 2);
        lerpScore = Math.floor(FlxMath.lerp(intendedScore, lerpScore, Math.exp(-elapsed * 24)));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		ScoreUPD();

        scoreText.text = 'Score: ' + lerpScore;

        if (controls.ACCEPT || TouchInput.justPressed(art) && select && !loading && omniBeaten) {
            FlxG.sound.play(Paths.sound('confirmMenu'));
            loading = true;
            PlayState.SONG = backend.Song.loadFromJson('omnipresent-fucked' + '-hard', 'omnipresent-fucked');
            PlayState.storyDifficulty = 2;
            PlayState.storyWeek = 2;
            PlayState.isStoryMode = false;
			new FlxTimer().start(1, function(tmr:FlxTimer) { LoadingState.loadAndSwitchState(new PlayState()); });
        }
		if (controls.ACCEPT || TouchInput.justPressed(art) && select && !loading && !omniBeaten) {
			FlxG.sound.play(Paths.sound('deniedMOMENT'), 1);
		}
        if (controls.ACCEPT || TouchInput.justPressed(art) && !select && !loading) {
            FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			select = true;
            songText.color = 0xFFFFFFFF;
        }
        if (controls.BACK && !select && !loading) {
            loading = true;
            FlxG.sound.play(Paths.sound('cancelMenu'));
            FlxG.switchState(new MainMenuState());
        }
        if (controls.BACK && select && !loading) {
            FlxG.sound.play(Paths.sound('cancelMenu'));
			select = false;
            songText.color = 0xFF232323;
        }
    }
}
