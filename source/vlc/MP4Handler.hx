package vlc;
#if desktop

import flixel.FlxG;
import hxcodec.openfl.Video;
import openfl.events.Event;
import sys.FileSystem;

class MP4Handler extends Video
{
	// Variables
	public var autoResize:Bool = true;

	public function new():Void
	{
		super();

		onOpening.add(function()
		{
			volume = Std.int((FlxG.sound.muted ? 0 : 1) * (FlxG.sound.volume * 170));
		});

		FlxG.addChildBelowMouse(this);
	}

	override public function play(location:String, shouldLoop:Bool = false):Int
	{
		if (FlxG.autoPause)
		{
			if (!FlxG.signals.focusGained.has(resume))
				FlxG.signals.focusGained.add(resume);

			if (!FlxG.signals.focusLost.has(pause))
				FlxG.signals.focusLost.add(pause);
		}

		FlxG.stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);

		if (FileSystem.exists(Sys.getCwd() + location))
			return super.play(Sys.getCwd() + location, shouldLoop);
		else
			return super.play(location, shouldLoop);
	}

	override public function dispose():Void
	{
		if (FlxG.autoPause)
		{
			if (FlxG.signals.focusGained.has(resume))
				FlxG.signals.focusGained.remove(resume);

			if (FlxG.signals.focusLost.has(pause))
				FlxG.signals.focusLost.remove(pause);
		}

		if (FlxG.stage.hasEventListener(Event.ENTER_FRAME))
			FlxG.stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);

		super.dispose();

		FlxG.removeChild(this);
	}

	@:noCompletion private function onEnterFrame(e:Event):Void
	{
		if (autoResize)
		{
			var aspectRatio:Float = FlxG.width / FlxG.height;

			if (FlxG.stage.stageWidth / FlxG.stage.stageHeight > aspectRatio)
			{
				// stage is wider than video
				width = FlxG.stage.stageHeight * aspectRatio;
				height = FlxG.stage.stageHeight;
			}
			else
			{
				// stage is taller than video
				width = FlxG.stage.stageWidth;
				height = FlxG.stage.stageWidth * (1 / aspectRatio);
			}
		}
		volume = Std.int((FlxG.sound.muted ? 0 : 1) * (FlxG.sound.volume * 170));
	}
}
#else //hxCodec 2.5.1

import openfl.events.Event;
import flixel.FlxG;
import vlc.bitmap.VlcBitmap;

/**
 * Play a video using cpp.
 * Use bitmap to connect to a graphic or use `MP4Sprite`.
 */
class MP4Handler extends VlcBitmap
{
	public var readyCallback:Void->Void;
	public var finishCallback:Void->Void;

	var pauseMusic:Bool;
	var SongName:String = '';

	public function new(width:Float = 320, height:Float = 240, autoScale:Bool = true)
	{
		super(width, height, autoScale);

		onVideoReady = onVLCVideoReady;
		onComplete = finishVideo;
		onError = onVLCError;

		FlxG.addChildBelowMouse(this);

		FlxG.stage.addEventListener(Event.ENTER_FRAME, update);

		FlxG.signals.focusGained.add(function()
		{
			resume();
		});
		FlxG.signals.focusLost.add(function()
		{
			pause();
		});
	}

	function update(e:Event)
	{
		if (ClientPrefs.showCutscene.contains(SongName) && ClientPrefs.cutsceneYouSaw.contains(SongName) && SongName != 'fatality-encore') {
			if ((FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressedMiddle || FlxG.mouse.justPressed) && isPlaying) finishVideo();
		} else {
			if ((ClientPrefs.StartVideo && ClientPrefs.StartVideoSaw && ClientPrefs.storyProgressExe != 3) || ClientPrefs.GalleryCanSkip) {
				if ((FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressedMiddle || FlxG.mouse.justPressed) && isPlaying) finishVideo();
			}
		}
		
		
		if (!ClientPrefs.GalleryCanSkip) {
			if (FlxG.sound.muted || FlxG.sound.volume <= 0)
				volume = 0;
			else
				volume = FlxG.sound.volume + 0.4;
		} else {
			FlxG.sound.music.volume = 0.00045;
		}
	}

	#if sys
	function checkFile(fileName:String):String
	{
		#if !android
		var pDir = "";
		var appDir = "file:///" + Sys.getCwd() + "/";

		if (fileName.indexOf(":") == -1) // Not a path
			pDir = appDir;
		else if (fileName.indexOf("file://") == -1 || fileName.indexOf("http") == -1) // C:, D: etc? ..missing "file:///" ?
			pDir = "file:///";

		return pDir + fileName;
		#else
		trace("file://" + fileName);
		return "file://" + fileName;
		#end
	}
	#end

	function onVLCVideoReady()
	{
		trace("Video loaded!");

		if (readyCallback != null)
			readyCallback();
	}

	function onVLCError()
	{
		// TODO: Catch the error
		throw "VLC caught an error!";
	}

	public function finishVideo()
	{
		if (FlxG.sound.music != null && pauseMusic)
			FlxG.sound.music.resume();

		FlxG.stage.removeEventListener(Event.ENTER_FRAME, update);

		dispose();

		if (FlxG.game.contains(this))
		{
			FlxG.game.removeChild(this);

			if (finishCallback != null)
				finishCallback();
		}
	}

	/**
	 * Native video support for Flixel & OpenFL
	 * @param path Example: `your/video/here.mp4`
	 * @param repeat Repeat the video.
	 * @param pauseMusic Pause music until done video.
	 */
	public function playVideo(path:String, ?repeat:Bool = false, ?pauseMusic:Bool = false, ?song:String = '')
	{
		this.pauseMusic = pauseMusic;
		SongName = song;

		trace(path);

		if (FlxG.sound.music != null && pauseMusic)
			FlxG.sound.music.pause();

		#if sys
		play(checkFile(path));
		trace(checkFile(path));

		this.repeat = repeat ? -1 : 0;
		#else
		throw "Doesn't support sys";
		#end
	}
}
#end