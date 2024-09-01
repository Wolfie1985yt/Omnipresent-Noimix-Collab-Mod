package states.stages;

import states.stages.objects.*;
import flixel.graphics.frames.FlxAtlasFrames;
import backend.ClientPrefs;
import openfl.Assets;
import sys.io.Process;
import objects.Character;
import states.PlayState as PlayState;
import hxvlc.flixel.FlxVideoSprite;

class OmniFucked extends BaseStage
{
	var gpuCache:Bool = false;
	var lowQuality:Bool = false;
	var ringStarted:Bool = false;

	//For Philly Glow events
	var blammedLightsBlack:FlxSprite;
	var phillyGlowGradient:PhillyGlowGradient;
	var phillyGlowParticles:FlxTypedGroup<PhillyGlowParticle>;
	var curLightEvent:Int = -1;
	var phillyLightsColors:Array<FlxColor>;

	var sunkyTransition:FlxSprite;
	var daJumpscare:FlxSprite;
	var ring:FlxSprite;
	var wechJump:FlxSprite;

	var tailsdoll_floor:FlxSprite;
	
	var xterion_floor:FlxSprite;
	
	var needleMoutains:BGSprite;
	var needleBuildings:BGSprite;
	var conkCreet:BGSprite;
	var needleFg:FlxSprite;
	
	var tails_sky:FlxSprite;
	var tails_fg:FlxSprite;
	var tails_trees1:FlxSprite;
	var tails_trees2:FlxSprite;
	var tails_floor:FlxSprite;
	
	var fleetwaybgshit:FlxSprite;
	var emeraldbeamyellow:FlxSprite;
	var emeralds:FlxSprite;
	var thechamber:FlxSprite;
	var chamberFront:FlxSprite;
	var fleetwayMoment = false;

	var fucklesBGPixel:BGSprite;
	var fucklesFGPixel:BGSprite;
	var fucklesAmyBg:FlxSprite;
	var fucklesVectorBg:FlxSprite;
	var fucklesKnuxBg:FlxSprite;
	var fucklesEspioBg:FlxSprite;
	var fucklesCharmyBg:FlxSprite;
	var fucklesMightyBg:FlxSprite;
	var fucklesBeats:Bool = true;
	var whiteFuck:FlxSprite;
	
	var knuckles_bg:FlxSprite;
	var knuckles_city2:FlxSprite;
	var knuckles_floor:FlxSprite;
	
	var wechidna_sky:FlxSprite;
	var wechidna_building1:FlxSprite;
	var wechidna_building2:FlxSprite;
	var wechidna_floor:FlxSprite;
	var wechidna_treesFG:FlxSprite;
	var wechidna_thingFG:FlxSprite;
	var wechidna_grassFG:FlxSprite;
	
	var satanos_sky:FlxSprite;
	var satanos_trees:FlxSprite;
	var satanos_floor:FlxSprite;
	var satanos_rock:FlxSprite;
	
	var eggman_bg:FlxSprite;
	var eggman_eys:FlxSprite;
	
	var sonic_bg:FlxSprite;
	var sonic_ground:FlxSprite;

	var lordx_sky:BGSprite;
	var lordx_floor:BGSprite;
	var lordx_eyeflower:BGSprite;
	var lordx_notknuckles:BGSprite;
	var lordx_bfsmallflower:BGSprite;
	var lordx_tree:BGSprite;
	
	var domain:FlxSprite;
	var domain2:FlxSprite;
	
	var xeno_fg:FlxSprite;
	var xeno_floor:FlxSprite;

	var majin_sky:BGSprite;
	var majin_bush:BGSprite;
	var majin_pillars2:BGSprite;
	var majin_bush2:BGSprite;
	var majin_pillars1:BGSprite;
	var majin_floor:BGSprite;
	var majin_fgmajin:BGSprite;
	var majin_fgmajin2:BGSprite;
	
	var sunky_bg:BGSprite;
	var sunky_balls:FlxSprite;
	var sunky_stage:BGSprite;
	var sunky_speakers:FlxSprite;
	var sunky_milk:FlxSprite;
	var sunky_cereal:FlxSprite;
	var sunkyMoment:Bool = false;
	
	var sanic_bg:BGSprite;
	
	var coldsteel_whiteFuck:FlxSprite;
	var coldsteel_shadow:FlxSprite;
	
	var guitar:FlxSprite;
	
	var faker_sky:FlxSprite;
	var faker_eclipse:FlxSprite;
	var faker_moutains:FlxSprite;
	var faker_rings:FlxSprite;
	var faker_bg:FlxSprite;
	
	var hogBg:BGSprite;
	var hogMotain:BGSprite;
	var hogWaterFalls:FlxSprite;
	var hogFloor:FlxSprite;
	var hogLoops:FlxSprite;
	var hogTrees:BGSprite;
	var hogRocks:BGSprite;
	var hogOverlay:BGSprite;
	
	var faker_sky2:FlxSprite;
	var faker_eclipse2:FlxSprite;
	var faker_moutains2:FlxSprite;
	var faker_rings2:FlxSprite;
	var faker_bg2:FlxSprite;
	var faker_overlay:FlxSprite;
	var exeDie:FlxSprite;
	
	var scorchedBg:BGSprite;
	var scorchedMotain:BGSprite;
	var scorchedWaterFalls:FlxSprite;
	var scorchedFloor:FlxSprite;
	var scorchedMonitor:FlxSprite;
	var scorchedHills:FlxSprite;
	var scorchedTrees:BGSprite;
	var scorchedRocks:BGSprite;
	
	var vignette:FlxSprite;
	var circle:FlxSprite;
	
	var char1:FlxSprite;
	var char2:FlxSprite;
	var char3:FlxSprite;
	var char4:FlxSprite;
	var char5:FlxSprite;
	var char6:FlxSprite;
	var char7:FlxSprite;
	var char8:FlxSprite;
	var char9:FlxSprite;
	var char10:FlxSprite;
	var char12:FlxSprite;
	var char13:FlxSprite;
	var char14:FlxSprite;
	var char16:FlxSprite;
	var char17:FlxSprite;
	var char18:FlxSprite;
	var char19:FlxSprite;
	var char20:FlxSprite;
	var char21:FlxSprite;
	var char22:FlxSprite;
	var char24:FlxSprite;
	var char25:FlxSprite;
	var char26:FlxSprite;
	var char27:FlxSprite;
	var char28:FlxSprite;
	var char29:FlxSprite;
	var char30:FlxSprite;
	var char31:FlxSprite;
	var char32:FlxSprite;
	var char33:FlxSprite;
	var char34:FlxSprite;
	var char35:FlxSprite;
	var char36:FlxSprite;
	var char37:FlxSprite;
	var char38:FlxSprite;
	var char39:FlxSprite;
	var char40:FlxSprite;
	var char41:FlxSprite;
	var char42:FlxSprite;

	var video:FlxVideoSprite;

	var monitorCounter:Int = 0;
	var theThing:Int = 1;
	var monitorAnims:Array<String> = ["fatal", "nmi", "needle", "starved", "idle"];

	var phillyGlow:Bool = false;

	public function preload(graphic:String) {
        var newthing:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image(graphic, 'shared'));
        newthing.screenCenter();
		add(newthing);
		remove(newthing);
    }
	
	public function preloadVideo(graphic:String) {
		video = new FlxVideoSprite(0, 0);
		video.updateHitbox();
		video.screenCenter();
		video.load(Paths.video(graphic));
		add(video);
		video.play();
		video.pause();
		video.destroy();
		trace("Video Preloaded Successfully: " + graphic + ".mp4");
    }

	override function create()
	{
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Loading Assets 0%", null);
		#end

		Paths.clearStoredMemory();
		if (ClientPrefs.data.lowQuality) {
			lowQuality = true;
		}
		
		if (ClientPrefs.data.smartCache && !lowQuality) {
			gpuCache = true;
		}
		//Gpu stuff
		if (gpuCache)
		{
			ClientPrefs.data.cacheOnGPU = true;
			backend.ClientPrefs.saveSettings();
			
			preload('characters/BF/HD/needle-bf-encore');
			preload('characters/FakerAndExe/faker-exe-encore');
			preload('characters/Fleetway/Fleetway_Super_Sonic');
			preload('characters/Fleetway/fleetway1');
			preload('characters/HogAndScorched/scorched');
			preload('characters/LordX/lordxEncore');
			preload('characters/Majin/SonicFunAssets');
			preload('characters/Sanic/sanic');
			preload('characters/Satanos/Satanos');
			preload('characters/Tails/tails-encore');
			preload('characters/Wechidna/wechBeast');
			preload('characters/XenoAndGrimbo/HD/Beast');
			preload('characters/XenoAndGrimbo/HD/sonicexe');
			preload('bgs/Chamber/Emeralds');
			preload('bgs/Chamber/FleetwayBGshit');
			preload('bgs/faker-encore/moutainsP1');
			preload('bgs/faker-encore/moutainsP2');
			preload('bgs/faker-encore/skyP1');
			preload('bgs/faker-encore/skyP2');
			preload('bgs/FunInfiniteStage/overlay');
			preload('bgs/FunInfiniteStage/floor BG');
			preload('bgs/FunInfiniteStage/Bush2');
			preload('bgs/FunInfiniteStage/Majin Boppers Front');
			preload('bgs/FunInfiniteStage/Majin Boppers Back');
			preload('bgs/hog/HillsandHills');
			preload('bgs/hog/overlay');
			preload('bgs/hog/Waterfalls');
			preload('bgs/hog/bg');
			preload('bgs/hog/blast/Waterfalls');
			preload('bgs/hog/blast/Sunset');
			preload('bgs/hog/blast/Hills');
			preload('bgs/LordXStage/NotKnuckles_Assets');
			preload('bgs/LordXStage/sky');
			preload('bgs/LordXStage/WeirdAssFlower_Assets');
			preload('bgs/needlemouse-p2/mountains');
			preload('bgs/satanos-bg/gamemasters');
			preload('bgs/satanos-bg/Sky');
			preload('bgs/satanos-bg/Trees');
			preload('bgs/sunky/hang');
			preload('bgs/sunky/sunky BG');
			preload('bgs/too-slow-encore/ground');
			preload('bgs/triple-trouble-encore/knuckles/kn_bg');
			preload('bgs/triple-trouble-encore/tails/ts_trees1');
			preload('bgs/triple-trouble-encore/tails/ts_floor');
			preload('bgs/triple-trouble-encore/xeno/xeno_floor');
			preload('bgs/Wechidna/floor');
			preload('bgs/Wechidna/building');
			preload('bgs/Wechidna/bg-building');
			preload('philly/particle');
		}
		
		
		if (gpuCache) {
			ClientPrefs.data.cacheOnGPU = false;
			backend.ClientPrefs.saveSettings();
		}
			
		//Characters
		preload('characters/Wechidna/wechBeast');
		preload('characters/BF/HD/Sonic');
		preload('characters/Fleetway/Fleetway_Super_Sonic');
		preload('characters/Fleetway/fleetway1');
		preload('characters/HogAndScorched/scorched');
		preload('characters/Satanos/Satanos');
		preload('characters/TailsDoll/3D/Tails_Doll');
		preload('characters/NeedlemouseSarahShadowmouseLutherSunter/Needlemouse');
		preload('characters/BF/HD/needle-bf-encore');
		preload('characters/Sanic/sanic');
		preload('characters/LordX/lordxEncore');
		preload('characters/Majin/SonicFunAssets');
		preload('characters/XenoAndGrimbo/HD/Beast');
		preload('characters/XenoAndGrimbo/HD/sonicexe');
		preload('characters/Fleetway/fleetway3');
		preload('characters/FakerAndExe/faker-exe-encore');
		preload('characters/FakerAndExe/faker_encore');
		preload('characters/Coldsteel/coldsteel_assets');
		preload('characters/Coldsteel/coldsteel_guitar');
		preload('characters/Eggman/eggman-encore');
		preload('characters/Tails/tails-encore');
		preload('characters/BF/HD/BF_Requital');
		preload('characters/BF/HD/encoreBF');
		preload('characters/BF/HD/encoreBF-blackTint');
		preload('characters/BF/HD/encoreBF-majin');
		preload('characters/BF/HD/encoreBF-redTint');
		preload('characters/HogAndScorched/Hog');
		preload('characters/Knuckles/knux-encore');
		preload('characters/Sunky/Sunky');
		preload('characters/BF/3D/bf-3d');
		preload('characters/XTerion/3D/xterion-first');
		preload('characters/ChotixXenotixAndChaotix/HD/chaotix-hd');
		preload('characters/XenoAndGrimbo/HD/YCR-Mad-Cherribun');
		preload('characters/XenoAndGrimbo/HD/YCR-Cherribun');
		preload('characters/ChotixXenotixAndChaotix/Pixel/faker_chaotix');
		preload('characters/FatalAndCritical/fatal-error-sonic');
		preload('characters/FatalAndCritical/true-fatal');
		preload('characters/BF/Pixel/bf-encore-pixel');
		preload('characters/BF/Pixel/pixel-normal');
		preload('characters/FakerAndExe/faker_pixel');
		
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Loading Assets 20%", null);
		#end
		
		//Stages
		preload('bgs/Chamber/Emerald Beam Charged');
		preload('bgs/Chamber/Emeralds');
		preload('bgs/Chamber/FleetwayBGshit');
		preload('bgs/Chamber/The Chamber');
		preload('bgs/LordXStage/floor');
		preload('bgs/LordXStage/NotKnuckles_Assets');
		preload('bgs/LordXStage/sky');
		preload('bgs/LordXStage/smallflower');
		preload('bgs/LordXStage/tree');
		preload('bgs/LordXStage/WeirdAssFlower_Assets');
		preload('bgs/satanos-bg/FRock');
		preload('bgs/satanos-bg/gamemasters');
		preload('bgs/satanos-bg/Sky');
		preload('bgs/satanos-bg/Trees');
		preload('bgs/triple-trouble-encore/xeno/xeno_floor');
		preload('bgs/triple-trouble-encore/xeno/xeno_fg');
		preload('bgs/triple-trouble-encore/knuckles/kn_bg');
		preload('bgs/triple-trouble-encore/knuckles/kn_city2');
		preload('bgs/triple-trouble-encore/knuckles/kn_floor');
		preload('bgs/triple-trouble-encore/tails/ts_fg');
		preload('bgs/triple-trouble-encore/tails/ts_floor');
		preload('bgs/triple-trouble-encore/tails/ts_sky');
		preload('bgs/triple-trouble-encore/tails/ts_trees1');
		preload('bgs/triple-trouble-encore/tails/ts_trees2');
		preload('bgs/Wechidna/floor');
		preload('bgs/Wechidna/bg-building');
		preload('bgs/Wechidna/building');
		preload('bgs/Wechidna/fg-grass');
		preload('bgs/Wechidna/fg-smth');
		preload('bgs/Wechidna/fg-trees');
		preload('bgs/Wechidna/sky');
		preload('bgs/faker-encore/bgP1');
		preload('bgs/faker-encore/bgP2');
		preload('bgs/faker-encore/eclipiceP1');
		preload('bgs/faker-encore/eclipiceP2');
		preload('bgs/faker-encore/moutainsP1');
		preload('bgs/faker-encore/moutainsP2');
		preload('bgs/faker-encore/ringsP1');
		preload('bgs/faker-encore/ringsP2');
		preload('bgs/faker-encore/skyP1');
		preload('bgs/faker-encore/skyP2');
		preload('bgs/faker-encore/jover');
		preload('bgs/faker-encore/fakerpixel');
		preload('bgs/FunInfiniteStage/Bush 1');
		preload('bgs/FunInfiniteStage/Bush2');
		preload('bgs/FunInfiniteStage/floor BG');
		preload('bgs/FunInfiniteStage/Majin Boppers Back');
		preload('bgs/FunInfiniteStage/Majin Boppers Front');
		preload('bgs/FunInfiniteStage/majin FG1');
		preload('bgs/FunInfiniteStage/majin FG2');
		preload('bgs/FunInfiniteStage/overlay');
		preload('bgs/FunInfiniteStage/sonicFUNsky');
		preload('bgs/hog/bg');
		preload('bgs/hog/floor');
		preload('bgs/hog/HillsandHills');
		preload('bgs/hog/motains');
		preload('bgs/hog/overlay');
		preload('bgs/hog/rocks');
		preload('bgs/hog/trees');
		preload('bgs/hog/Waterfalls');
		preload('bgs/hog/blast/Floor');
		preload('bgs/hog/blast/Hills');
		preload('bgs/hog/blast/Monitor');
		preload('bgs/hog/blast/Mountains');
		preload('bgs/hog/blast/Plants');
		preload('bgs/hog/blast/Rocks');
		preload('bgs/hog/blast/Sunset');
		preload('bgs/hog/blast/Waterfalls');
		preload('bgs/too-slow-encore/ground');
		preload('bgs/sunky/ceral');
		preload('bgs/sunky/floor');
		preload('bgs/sunky/hang');
		preload('bgs/sunky/milk');
		preload('bgs/sunky/speakers');
		preload('bgs/sunky/sunkTransition');
		preload('bgs/sunky/sunky BG');
		preload('bgs/needlemouse-p2/buildings');
		preload('bgs/needlemouse-p2/CONK_CREET');
		preload('bgs/needlemouse-p2/fg');
		preload('bgs/needlemouse-p2/mountains');
		preload('bgs/triple-trouble-encore/eggman/egg_bg');
		preload('bgs/triple-trouble-encore/eggman/egg_eys');
		preload('bgs/sanic/sanicbg');
		preload('bgs/digitalized/bg');
		preload('bgs/digitalized/ring');
		preload('bgs/tails-doll/bg');
		preload('bgs/void/shadow');
		preload('bgs/fatal/domain');
		preload('bgs/fatal/domain2');
		preload('bgs/chaotix/horizonFg');
		preload('bgs/chaotix/horizonsky');
		preload('bgs/chaotix/BG_amy');
		preload('bgs/chaotix/BG_charmy');
		preload('bgs/chaotix/BG_espio');
		preload('bgs/chaotix/BG_knuckles');
		preload('bgs/chaotix/BG_mighty');
		preload('bgs/chaotix/BG_vector');
		
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Loading Assets 40%", null);
		#end
		
		//Other used stuff
		preload('Phase3Static');
		preload('sonicJUMPSCARE');
		preload('epicjump');
		preload('wechidna');
		preload('exedeath');
		preload('WhiteVG');
		preload('bad');
		preload('blank');
		preload('box');
		preload('circleshit');
		preload('error_popups');
		preload('good');
		preload('guitar');
		preload('healthBar');
		preload('num0');
		preload('num1');
		preload('num2');
		preload('num3');
		preload('num4');
		preload('num5');
		preload('num6');
		preload('num7');
		preload('num8');
		preload('num9');
		preload('shit');
		preload('sick');
		preload('noteSplashes/noteSplashes-Bloodsplash');
		preload('ring');
		preload('STATICNOTE_assets');
		preload('PHANTOMNOTE_assets');
		preload('hitStatic');
		preload('spacebar_icon');
		preload('StartScreens/Text1-omnipresent');
		preload('StartScreens/Text2-omnipresent');
		preload('characters/GF_assets');
		preload('healthBar');
		preload('hpR-dark');
		preload('timeBar');
		preload('tbR-dark');
		
		//Icons
		preload('icons/icon-xterion-first');
		preload('icons/icon-needlemouse-p2');
		preload('icons/icon-bf-needlemouse');
		preload('icons/icon-tails-encore');
		preload('icons/icon-bunfriend');
		preload('icons/icon-fleetway');
		preload('icons/icon-chaotix-pixel');
		preload('icons/icon-pixel-bunfriend');
		preload('icons/icon-knuckles-encore');
		preload('icons/icon-wechBeast');
		preload('icons/icon-satanos');
		preload('icons/icon-egg-encore');
		preload('icons/icon-sonicexe');
		preload('icons/icon-lordx-encore');
		preload('icons/icon-fatal-sonic');
		preload('icons/icon-ycr');
		preload('icons/icon-BEAST');
		preload('icons/icon-majin');
		preload('icons/icon-sunky');
		preload('icons/icon-sanic');
		preload('icons/icon-fatal-glitched');
		preload('icons/icon-bunfriend-needlemouse');
		preload('icons/icon-true-fatal');
		preload('icons/icon-ycrep4');
		preload('icons/icon-ycr-pissy');
		preload('icons/icon-coldsteel');
		preload('icons/icon-exe-enc');
		preload('icons/icon-faker-enc');
		preload('icons/icon-scorched');
		preload('icons/icon-bfpixel');
		preload('icons/icon-fakerpixel');
		preload('icons/icon-taildoll');
		preload('icons/icon-bf-3d');
		preload('icons/icon-hog');
		preload('icons/icon-chaotix-hd');
		preload('icons/icon-gf');
		preload('icons/icon-sonic-rr');
		preload('icons/icon-face');
		preload('noteSkins/NOTE_assets');
		preload('philly/gradient');
		preload('philly/particle');
		preload('characters/BF/HD/BOYFRIEND');
		
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Loading Assets 60%", null);
		#end
		
		//Videos
		preloadVideo('bfhair');
		preloadVideo('bitchless');
		preloadVideo('EGGMAN NO');
		preloadVideo('Fatal Error Singing');
		preloadVideo('fleetgeta');
		preloadVideo('forkliftcertified');
		preloadVideo('gettrolled');
		preloadVideo('Googoogaagaa');
		preloadVideo('he has a point');
		preloadVideo('HogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHogHog');
		preloadVideo('hogToaster');
		preloadVideo('howitfeelstochew5gum');
		preloadVideo("HUEHUEHUE'D");
		preloadVideo('i am wechidn-asdfl;');
		preloadVideo('imbouttocuuuuuuuuuuuuuuuuuuu');
		preloadVideo('its his mic fr');
		preloadVideo('Mother I have shidded the bed.');
		preloadVideo('MWAHAHAHA');
		preloadVideo('myfinger');
		preloadVideo('no_ice_cream');
		preloadVideo('omg sonic');
		preloadVideo('tune this out bitch');
		preloadVideo('Scorched Yes');
		preloadVideo('sonic_jacking_off');
		preloadVideo('Sunky Chad');
		preloadVideo('test1');
		preloadVideo('what');
		preloadVideo('YEAAAAAAAAAAAAAAAAAAAAAAAAA');

		char41 = new FlxSprite(0, 0);
		char41.loadGraphic(Paths.image('characters/Wechidna/wechBeast'));
		char41.scrollFactor.set(1, 1);
		char41.scale.set(1, 1);
		char41.antialiasing = ClientPrefs.data.antialiasing;
		char41.alpha = 0.00001;
		char41.screenCenter(X);
		char41.screenCenter(Y);
		add(char41);
		
		tailsdoll_floor = new FlxSprite(-700, -100);
		tailsdoll_floor.loadGraphic(Paths.image('bgs/tails-doll/bg'));
		tailsdoll_floor.scrollFactor.set(1, 1);
		tailsdoll_floor.scale.set(1.1, 1.1);
		tailsdoll_floor.antialiasing = ClientPrefs.data.antialiasing;
		tailsdoll_floor.visible = true;
		add(tailsdoll_floor);

		phillyLightsColors = [0xFF31A2FD, 0xFF31FD8C, 0xFFFB33F5, 0xFFFD4531, 0xFFFBA633];
		
		xterion_floor = new FlxSprite(-400, 100);
		xterion_floor.loadGraphic(Paths.image("bgs/digitalized/bg"));
		xterion_floor.antialiasing = ClientPrefs.data.antialiasing;
		xterion_floor.visible = false;
		add(xterion_floor);

		tails_sky = new FlxSprite(-450, -1000);
		tails_sky.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_sky'));
		tails_sky.scrollFactor.set(1, 1);
		tails_sky.scale.set(1.6, 1.2);
		tails_sky.antialiasing = ClientPrefs.data.antialiasing;
		tails_sky.visible = false;
		add(tails_sky);
		
		needleMoutains = new BGSprite('bgs/needlemouse-p2/mountains', -700, -175, 0.8, 0.9);
		needleMoutains.setGraphicSize(Std.int(needleMoutains.width * 1.1));
		needleMoutains.visible = false;
		add(needleMoutains);
		
		if (!lowQuality) {
			needleBuildings = new BGSprite('bgs/needlemouse-p2/buildings', -974, -27, 1, 0.9);
			needleBuildings.visible = false;
			add(needleBuildings);
		} else {
			needleBuildings = new BGSprite('blank', -744, 367, 1, 0.9);
			needleBuildings.visible = false;
			add(needleBuildings);
		}

		conkCreet = new BGSprite('bgs/needlemouse-p2/CONK_CREET', -775, 241, 1, 0.9);
		conkCreet.setGraphicSize(Std.int(conkCreet.width * 1.4));
		conkCreet.visible = false;
		add(conkCreet);

		tails_sky = new FlxSprite(-450, -1000);
		tails_sky.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_sky'));
		tails_sky.scrollFactor.set(1, 1);
		tails_sky.scale.set(1.6, 1.2);
		tails_sky.antialiasing = ClientPrefs.data.antialiasing;
		tails_sky.visible = false;
		add(tails_sky);
		
		tails_trees1 = new FlxSprite(-500, -800);
		tails_trees1.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_trees1'));
		tails_trees1.scrollFactor.set(0.8, 0.9);
		tails_trees1.scale.set(0.95, 0.95);
		tails_trees1.antialiasing = ClientPrefs.data.antialiasing;
		tails_trees1.visible = false;
		add(tails_trees1);
		
		if (!lowQuality) {
			tails_trees2 = new FlxSprite(-500, -800);
			tails_trees2.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_trees2'));
			tails_trees2.scrollFactor.set(0.9, 1);
			tails_trees2.scale.set(0.95, 0.95);
			tails_trees2.antialiasing = ClientPrefs.data.antialiasing;
			tails_trees2.visible = false;
			add(tails_trees2);
		} else {
			tails_trees2 = new FlxSprite(-500, -800);
			tails_trees2.loadGraphic(Paths.image('blank'));
			tails_trees2.scrollFactor.set(0.9, 1);
			tails_trees2.scale.set(0.95, 0.95);
			tails_trees2.antialiasing = ClientPrefs.data.antialiasing;
			tails_trees2.visible = false;
			add(tails_trees2);
		}
		
		tails_floor = new FlxSprite(-550, -900);
		tails_floor.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_floor'));
		tails_floor.scrollFactor.set(1, 1);
		tails_floor.scale.set(0.95, 0.95);
		tails_floor.antialiasing = ClientPrefs.data.antialiasing;
		tails_floor.visible = false;
		add(tails_floor);
		
		if (!lowQuality) {
			fleetwaybgshit = new FlxSprite(-2629.05, -1344.05);
			fleetwaybgshit.loadGraphic(Paths.image('bgs/Chamber/FleetwayBGshit'));
			fleetwaybgshit.antialiasing = ClientPrefs.data.antialiasing;
			fleetwaybgshit.scale.y = 1.015;
			fleetwaybgshit.scrollFactor.set(1.1, 1);
			fleetwaybgshit.alpha = 0.000001;
			add(fleetwaybgshit);
		} else {
			fleetwaybgshit = new FlxSprite(-2629.05, -1344.05);
			fleetwaybgshit.loadGraphic(Paths.image('blank'));
			fleetwaybgshit.antialiasing = ClientPrefs.data.antialiasing;
			fleetwaybgshit.scrollFactor.set(1.1, 1);
			fleetwaybgshit.alpha = 0.000001;
			add(fleetwaybgshit);
		}
				
		emeraldbeamyellow = new FlxSprite(-300, -1376.95 - 200);
		emeraldbeamyellow.antialiasing = ClientPrefs.data.antialiasing;
		emeraldbeamyellow.frames = Paths.getSparrowAtlas('bgs/Chamber/Emerald Beam Charged');
		emeraldbeamyellow.animation.addByPrefix('a', 'Emerald Beam Charged instance 1', 24, true);
		emeraldbeamyellow.animation.play('a');
		emeraldbeamyellow.scrollFactor.set(1.1, 1);
		emeraldbeamyellow.alpha = 0.000001;
		add(emeraldbeamyellow);

		if (!lowQuality) {
			emeralds = new FlxSprite(326.6, -191.75);
			emeralds.antialiasing = ClientPrefs.data.antialiasing;
			emeralds.loadGraphic(Paths.image('bgs/Chamber/Emeralds'));
			emeralds.scrollFactor.set(1.1, 1);
			emeralds.antialiasing = ClientPrefs.data.antialiasing;
			emeralds.alpha = 0.000001;
			add(emeralds);
		} else {
			emeralds = new FlxSprite(326.6, -191.75);
			emeralds.antialiasing = ClientPrefs.data.antialiasing;
			emeralds.loadGraphic(Paths.image('blank'));
			emeralds.scrollFactor.set(1.1, 1);
			emeralds.antialiasing = ClientPrefs.data.antialiasing;
			emeralds.alpha = 0.000001;
			add(emeralds);
		}
			
		thechamber = new FlxSprite(-465.05, 813.9);
		thechamber.loadGraphic(Paths.image('bgs/Chamber/The Chamber'));
		thechamber.scrollFactor.set(1.1, 1);
		thechamber.antialiasing = ClientPrefs.data.antialiasing;
		thechamber.alpha = 0.000001;
		add(thechamber);

		fucklesBGPixel = new BGSprite('bgs/chaotix/horizonsky', -1450, -725, 1.2, 0.9);
		fucklesBGPixel.visible = false;
		fucklesBGPixel.antialiasing = false;
		add(fucklesBGPixel);

		fucklesFGPixel = new BGSprite('bgs/chaotix/horizonFg', -550, -735, 1, 0.9);
		fucklesFGPixel.visible = false;
		fucklesFGPixel.antialiasing = false;
		add(fucklesFGPixel);
	
		fucklesAmyBg = new FlxSprite(1195, 630);
		fucklesAmyBg.frames = Paths.getSparrowAtlas('bgs/chaotix/BG_amy');
		fucklesAmyBg.animation.addByPrefix('idle', 'amy bobbing', 24, false);
		fucklesAmyBg.animation.addByPrefix('fear', 'amy fear', 24, false);
		fucklesAmyBg.scale.x = 6;
		fucklesAmyBg.scale.y = 6;
		fucklesAmyBg.visible = false;
		fucklesAmyBg.antialiasing = false;

		fucklesCharmyBg = new FlxSprite(1000, 500);
		fucklesCharmyBg.frames = Paths.getSparrowAtlas('bgs/chaotix/BG_charmy');
		fucklesCharmyBg.animation.addByPrefix('idle', 'charmy bobbing', 24, false);
		fucklesCharmyBg.animation.addByPrefix('fear', 'charmy fear', 24, false);
		fucklesCharmyBg.scale.x = 6;
		fucklesCharmyBg.scale.y = 6;
		fucklesCharmyBg.visible = false;
		fucklesCharmyBg.antialiasing = false;
			
		fucklesMightyBg = new FlxSprite(590, 650);
		fucklesMightyBg.frames = Paths.getSparrowAtlas('bgs/chaotix/BG_mighty');
		fucklesMightyBg.animation.addByPrefix('idle', 'mighty bobbing', 24, false);
		fucklesMightyBg.animation.addByPrefix('fear', 'mighty fear', 24, false);
		fucklesMightyBg.scale.x = 6;
		fucklesMightyBg.scale.y = 6;
		fucklesMightyBg.visible = false;
		fucklesMightyBg.antialiasing = false;
			
		fucklesEspioBg = new FlxSprite(1400, 660);
		fucklesEspioBg.frames = Paths.getSparrowAtlas('bgs/chaotix/BG_espio');
		fucklesEspioBg.animation.addByPrefix('idle', 'espio bobbing', 24, false);
		fucklesEspioBg.animation.addByPrefix('fear', 'espio fear', 24, false);
		fucklesEspioBg.scale.x = 6;
		fucklesEspioBg.scale.y = 6;
		fucklesEspioBg.visible = false;
		fucklesEspioBg.antialiasing = false;
		
		fucklesKnuxBg = new FlxSprite(-60, 645);
		fucklesKnuxBg.frames = Paths.getSparrowAtlas('bgs/chaotix/BG_knuckles');
		fucklesKnuxBg.animation.addByPrefix('idle', 'knuckles bobbing', 24, false);
		fucklesKnuxBg.animation.addByPrefix('fear', 'knuckles fear', 24, false);
		fucklesKnuxBg.scale.x = 6;
		fucklesKnuxBg.scale.y = 6;
		fucklesKnuxBg.visible = false;
		fucklesKnuxBg.antialiasing = false;
	
		fucklesVectorBg = new FlxSprite(-250, 615);
		fucklesVectorBg.frames = Paths.getSparrowAtlas('bgs/chaotix/BG_vector');
		fucklesVectorBg.animation.addByPrefix('idle', 'vector bobbing', 24, false);
		fucklesVectorBg.animation.addByPrefix('fear', 'vector fear', 24, false);
		fucklesVectorBg.scale.x = 6;
		fucklesVectorBg.scale.y = 6;
		fucklesVectorBg.visible = false;
		fucklesVectorBg.antialiasing = false;

		add(fucklesAmyBg);
		add(fucklesCharmyBg);
		add(fucklesMightyBg);
		add(fucklesEspioBg);
		add(fucklesKnuxBg);
		add(fucklesVectorBg);

		whiteFuck = new FlxSprite(-600, 0).makeGraphic(FlxG.width * 6, FlxG.height * 6, FlxColor.BLACK);
		whiteFuck.alpha = 0;
		add(whiteFuck);
		
		knuckles_bg = new FlxSprite(-930, -600);
		knuckles_bg.loadGraphic(Paths.image('bgs/triple-trouble-encore/knuckles/kn_bg'));
		knuckles_bg.scrollFactor.set(1, 1);
		knuckles_bg.scale.set(2, 1.6);
		knuckles_bg.visible = false;
		add(knuckles_bg);
		
		if (!lowQuality) {
			knuckles_city2 = new FlxSprite(-930, -860);
			knuckles_city2.loadGraphic(Paths.image('bgs/triple-trouble-encore/knuckles/kn_city2'));
			knuckles_city2.scrollFactor.set(1.07, 1);
			knuckles_city2.scale.set(2, 1.6);
			knuckles_city2.visible = false;
			add(knuckles_city2);
		} else {
			knuckles_city2 = new FlxSprite(-930, -800);
			knuckles_city2.loadGraphic(Paths.image('blank'));
			knuckles_city2.scrollFactor.set(1.07, 1);
			knuckles_city2.scale.set(2, 1.6);
			knuckles_city2.visible = false;
			add(knuckles_city2);
		}
		
		knuckles_floor = new FlxSprite(-1000, -1000);
		knuckles_floor.loadGraphic(Paths.image('bgs/triple-trouble-encore/knuckles/kn_floor'));
		knuckles_floor.scrollFactor.set(1, 1);
		knuckles_floor.scale.set(2.3, 2.3);
		knuckles_floor.visible = false;
		add(knuckles_floor);
		
		wechidna_sky = new FlxSprite(-820, -1250);
		wechidna_sky.loadGraphic(Paths.image('bgs/Wechidna/sky'));
		wechidna_sky.scrollFactor.set(0.1, 0.1);
		wechidna_sky.scale.set(1, 1);
		wechidna_sky.visible = false;
		wechidna_sky.antialiasing = ClientPrefs.data.antialiasing;
		add(wechidna_sky);
		
		wechidna_building1 = new FlxSprite(-800, -200);
		wechidna_building1.loadGraphic(Paths.image('bgs/Wechidna/building'));
		wechidna_building1.scrollFactor.set(0.3, 0.3);
		wechidna_building1.scale.set(1, 1);
		wechidna_building1.visible = false;
		wechidna_building1.antialiasing = ClientPrefs.data.antialiasing;
		add(wechidna_building1);
		
		wechidna_building2 = new FlxSprite(-400, -600);
		wechidna_building2.loadGraphic(Paths.image('bgs/Wechidna/bg-building'));
		wechidna_building2.scrollFactor.set(0.5, 0.5);
		wechidna_building2.scale.set(1, 1);
		wechidna_building2.visible = false;
		wechidna_building2.antialiasing = ClientPrefs.data.antialiasing;
		add(wechidna_building2);
		
		wechidna_floor = new FlxSprite(0, 0);
		wechidna_floor.loadGraphic(Paths.image('bgs/Wechidna/floor'));
		wechidna_floor.scrollFactor.set(1, 1);
		wechidna_floor.scale.set(1, 1);
		wechidna_floor.visible = false;
		wechidna_floor.antialiasing = ClientPrefs.data.antialiasing;
		add(wechidna_floor);
		
		satanos_sky = new FlxSprite(-600, -200);
		satanos_sky.loadGraphic(Paths.image('bgs/satanos-bg/Sky'));
		satanos_sky.scrollFactor.set(1, 1);
		satanos_sky.scale.set(1.2, 1.2);
		satanos_sky.visible = false;
		satanos_sky.antialiasing = ClientPrefs.data.antialiasing;
		add(satanos_sky);
		
		satanos_trees = new FlxSprite(-950, -220);
		satanos_trees.loadGraphic(Paths.image('bgs/satanos-bg/Trees'));
		satanos_trees.scrollFactor.set(1.2, 0.9);
		satanos_trees.scale.set(1.2, 1.2);
		satanos_trees.visible = false;
		satanos_trees.antialiasing = ClientPrefs.data.antialiasing;
		add(satanos_trees);
			
		satanos_floor = new FlxSprite(-950, -820);
		satanos_floor.loadGraphic(Paths.image('bgs/satanos-bg/gamemasters'));
		satanos_floor.scrollFactor.set(1, 1);
		satanos_floor.scale.set(1.2, 1.2);
		satanos_floor.visible = false;
		satanos_floor.antialiasing = ClientPrefs.data.antialiasing;
		add(satanos_floor);
		
		sonic_bg = new FlxSprite(-520, -700);
		sonic_bg.loadGraphic(Paths.image('bgs/too-slow-encore/bg'));
		sonic_bg.scrollFactor.set(0.3, 0.75);
		sonic_bg.scale.set(1, 1);
		sonic_bg.visible = false;
		sonic_bg.antialiasing = ClientPrefs.data.antialiasing;
		add(sonic_bg);
		
		sonic_ground = new FlxSprite(-650, -700);
		sonic_ground.loadGraphic(Paths.image('bgs/too-slow-encore/ground'));
		sonic_ground.scrollFactor.set(1, 1);
		sonic_ground.scale.set(1, 1);
		sonic_ground.visible = false;
		sonic_ground.antialiasing = ClientPrefs.data.antialiasing;
		add(sonic_ground);

		lordx_sky = new BGSprite('bgs/LordXStage/sky', -1900, -906, 1.0, 1.0);
		lordx_sky.setGraphicSize(Std.int(lordx_sky.width * 0.5));
		lordx_sky.visible = false;
		add(lordx_sky);

		lordx_floor = new BGSprite('bgs/LordXStage/floor', -1450, 426, 1.0, 1.0);
		lordx_floor.setGraphicSize(Std.int(lordx_floor.width * 0.55));
		lordx_floor.visible = false;
		add(lordx_floor);
		
		if (!lowQuality) {
			lordx_eyeflower = new BGSprite('bgs/LordXStage/WeirdAssFlower_Assets', 100 - 500, 100, 1.0, 1.0, ['flower'], true);
			lordx_eyeflower.setGraphicSize(Std.int(lordx_eyeflower.width * 0.8));
			lordx_eyeflower.visible = false;
			add(lordx_eyeflower);

			lordx_notknuckles = new BGSprite('bgs/LordXStage/NotKnuckles_Assets', 100 - 300, -400 + 25, 1.0, 1.0, ['Notknuckles'], true);
			lordx_notknuckles.setGraphicSize(Std.int(lordx_notknuckles.width * 0.5));
			lordx_notknuckles.visible = false;
			add(lordx_notknuckles);
				
			lordx_bfsmallflower = new BGSprite('bgs/LordXStage/smallflower', -100 + 200, 406 - 50, 1.0, 1.0);
			lordx_bfsmallflower.setGraphicSize(Std.int(lordx_bfsmallflower.width * 0.6));
			lordx_bfsmallflower.visible = false;
			add(lordx_bfsmallflower);

			lordx_tree = new BGSprite('bgs/LordXStage/tree', 150 + 1000 - 100, -1006 + 400, 1.0, 1.0);
			lordx_tree.setGraphicSize(Std.int(lordx_tree.width * 0.7));
			lordx_tree.visible = false;
			add(lordx_tree);
		} else {
			lordx_eyeflower = new BGSprite('blank', 100 - 500, 100, 1.0, 1.0, ['fun'], true);
			lordx_eyeflower.setGraphicSize(Std.int(lordx_eyeflower.width * 0.8));
			lordx_eyeflower.visible = false;
			add(lordx_eyeflower);

			lordx_notknuckles = new BGSprite('blank', 100 - 300, -400 + 25, 1.0, 1.0, ['fun'], true);
			lordx_notknuckles.setGraphicSize(Std.int(lordx_notknuckles.width * 0.5));
			lordx_notknuckles.visible = false;
			add(lordx_notknuckles);
	
			lordx_bfsmallflower = new BGSprite('blank', -100 + 300, -6 - 50, 1.0, 1.0);
			lordx_bfsmallflower.setGraphicSize(Std.int(lordx_bfsmallflower.width * 0.6));
			lordx_bfsmallflower.visible = false;
			add(lordx_bfsmallflower);

			lordx_tree = new BGSprite('blank', -1000 + 950 - 100, -1006 + 350, 1.0, 1.0);
			lordx_tree.setGraphicSize(Std.int(lordx_tree.width * 0.7));
			lordx_tree.visible = false;
			add(lordx_tree);
		}
		
		domain2 = new FlxSprite(100, 200);
		domain2.frames = Paths.getSparrowAtlas('bgs/fatal/domain2');
		domain2.animation.addByIndices('theand', 'idle', [0, 1, 2, 3, 4, 5, 6, 8, 9], "", 12, true);
		domain2.animation.play('theand');
		domain2.scale.x = 4;
		domain2.scale.y = 4;
		domain2.antialiasing = false;
		domain2.scrollFactor.set(1, 1);
		domain2.visible = false;
		add(domain2);

		if (!lowQuality) {
			domain = new FlxSprite(100, 200);
			domain.frames = Paths.getSparrowAtlas('bgs/fatal/domain');
			domain.animation.addByIndices('begin', 'idle', [0, 1, 2, 3, 4], "", 12, true);
			domain.animation.play('begin');
			domain.scale.x = 4;
			domain.scale.y = 4;
			domain.antialiasing = false;
			domain.scrollFactor.set(1, 1);
			domain.visible = false;
			add(domain);
		} else {
			domain = new FlxSprite(100, 200);
			domain.frames = Paths.getSparrowAtlas('blank');
			domain.animation.addByIndices('begin', 'fun', [0, 1, 2, 3, 4], "", 12, true);
			domain.animation.play('begin');
			domain.scale.x = 4;
			domain.scale.y = 4;
			domain.antialiasing = false;
			domain.scrollFactor.set(1, 1);
			domain.visible = false;
			add(domain);
		}
		
		xeno_floor = new FlxSprite(-800, -1100);
		xeno_floor.loadGraphic(Paths.image('bgs/triple-trouble-encore/xeno/xeno_floor'));
		xeno_floor.scrollFactor.set(1, 1);
		xeno_floor.scale.set(1, 1);
		xeno_floor.visible = false;
		xeno_floor.flipX = true;
		xeno_floor.antialiasing = ClientPrefs.data.antialiasing;
		add(xeno_floor);

		majin_sky = new BGSprite('bgs/FunInfiniteStage/sonicFUNsky', -600, -200, 1.0, 1.0);
		majin_sky.visible = false;
		add(majin_sky);
		
		if (!lowQuality) {
			majin_bush = new BGSprite('bgs/FunInfiniteStage/Bush 1', -42, 171, 1.0, 1.0);
			majin_bush.visible = false;
			add(majin_bush);
					
			majin_pillars2 = new BGSprite('bgs/FunInfiniteStage/Majin Boppers Back',  182, -100, 1.0, 1.0, ['MajinBop2 instance 1'], true);
			majin_pillars2.visible = false;
			add(majin_pillars2);

			majin_bush2 = new BGSprite('bgs/FunInfiniteStage/Bush2', 132, 354, 1.0, 1.0);
			majin_bush2.visible = false;
			add(majin_bush2);

			majin_pillars1 = new BGSprite('bgs/FunInfiniteStage/Majin Boppers Front', -169, -167, 1.0, 1.0, ['MajinBop1 instance 1'], true);
			majin_pillars1.visible = false;
			add(majin_pillars1);
		} else {
			majin_bush = new BGSprite('blank', -42, 171, 1.0, 1.0);
			majin_bush.visible = false;
			add(majin_bush);
					
			majin_pillars2 = new BGSprite('blank',  182, -100, 1.0, 1.0, ['fun'], true);
			majin_pillars2.visible = false;
			add(majin_pillars2);

			majin_bush2 = new BGSprite('blank', 132, 354, 1.0, 1.0);
			majin_bush2.visible = false;
			add(majin_bush2);

			majin_pillars1 = new BGSprite('blank', -169, -167, 1.0, 1.0, ['fun'], true);
			majin_pillars1.visible = false;
			add(majin_pillars1);
		}
		
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Loading Assets 90%", null);
		#end
		
		majin_floor = new BGSprite('bgs/FunInfiniteStage/floor BG', -340, 660, 1.0, 1.0);
		majin_floor.visible = false;
		add(majin_floor);		

		sunky_bg = new BGSprite('bgs/sunky/sunky BG', 50, -500, 0.9, 0.9);
		sunky_bg.visible = false;
		sunky_bg.scale.x = 2;
		add(sunky_bg);
		
		sunky_milk = new FlxSprite(1210, 10);
		sunky_milk.loadGraphic(Paths.image('bgs/sunky/milk'));
		sunky_milk.scrollFactor.set(0.7, 0.7);
		sunky_milk.scale.set(1, 1);
		sunky_milk.visible = false;
		sunky_milk.angle = 0;
		sunky_milk.antialiasing = ClientPrefs.data.antialiasing;
		add(sunky_milk);
		
		sunky_cereal = new FlxSprite(350, 0);
		sunky_cereal.loadGraphic(Paths.image('bgs/sunky/ceral'));
		sunky_cereal.scrollFactor.set(0.7, 0.7);
		sunky_cereal.scale.set(1, 1);
		sunky_cereal.visible = false;
		sunky_cereal.angle = 0;
		sunky_cereal.antialiasing = ClientPrefs.data.antialiasing;
		add(sunky_cereal);

		if (!lowQuality) {
			sunky_balls = new FlxSprite(270, -350);
			sunky_balls.frames = Paths.getSparrowAtlas('bgs/sunky/hang');
			sunky_balls.animation.addByPrefix('spin', 'hang', 12);
			sunky_balls.animation.play('spin');
			sunky_balls.scrollFactor.set(0.9, 0.9);
			sunky_balls.visible = false;
			sunky_balls.screenCenter(X);
			sunky_balls.x += 400;
			add(sunky_balls);
		} else {
			sunky_balls = new FlxSprite(20, -300);
			sunky_balls.frames = Paths.getSparrowAtlas('blank');
			sunky_balls.animation.addByPrefix('spin', 'fun', 12);
			sunky_balls.animation.play('spin');
			sunky_balls.scrollFactor.set(0.9, 0.9);
			sunky_balls.visible = false;
			sunky_balls.screenCenter(X);
			add(sunky_balls);
		}

		sunky_stage = new BGSprite('bgs/sunky/floor', -595, 570, 1.0, 1.0);
		sunky_stage.visible = false;
		sunky_stage.scale.x = 1.2;
		sunky_stage.scale.y = 1.5;
		add(sunky_stage);
		
		sunky_speakers = new FlxSprite(37, -70);
		sunky_speakers.frames = Paths.getSparrowAtlas('bgs/sunky/speakers');
		sunky_speakers.animation.addByPrefix('idle', 'speakers', 24, false);
		sunky_speakers.scale.x = 1.2;
		sunky_speakers.scale.y = 1.2;
		sunky_speakers.visible = false;
		sunky_speakers.antialiasing = ClientPrefs.data.antialiasing;
		add(sunky_speakers);

		sanic_bg = new BGSprite('bgs/sanic/sanicbg', -370, -130, 1.0, 1.0);
		sanic_bg.setGraphicSize(Std.int(sanic_bg.width * 1.2));
		sanic_bg.visible = false;
		add(sanic_bg);
		
		coldsteel_whiteFuck = new FlxSprite().makeGraphic(FlxG.width * 6, FlxG.height * 3, FlxColor.WHITE);
		coldsteel_whiteFuck.visible = false;
		coldsteel_whiteFuck.x -= 300;
		add(coldsteel_whiteFuck);
		
		if (!lowQuality) {
			coldsteel_shadow = new FlxSprite(-900, 100);
			coldsteel_shadow.loadGraphic(Paths.image('bgs/void/shadow'));
			coldsteel_shadow.scrollFactor.set(1, 1);
			coldsteel_shadow.scale.set(4, 1);
			coldsteel_shadow.visible = false;
			coldsteel_shadow.antialiasing = ClientPrefs.data.antialiasing;
			add(coldsteel_shadow);
		} else {
			coldsteel_shadow = new FlxSprite(-900, 100);
			coldsteel_shadow.loadGraphic(Paths.image('blank'));
			coldsteel_shadow.scrollFactor.set(1, 1);
			coldsteel_shadow.scale.set(4, 1);
			coldsteel_shadow.visible = false;
			coldsteel_shadow.antialiasing = ClientPrefs.data.antialiasing;
			add(coldsteel_shadow);
		}
		
		phillyLightsColors = [0xFF31A2FD, 0xFF31FD8C, 0xFFFB33F5, 0xFFFD4531, 0xFFFBA633];
		
		faker_sky = new FlxSprite(-500, -700);
		faker_sky.loadGraphic(Paths.image('bgs/faker-encore/skyP1'));
		faker_sky.scrollFactor.set(0.6, 0.6);
		faker_sky.scale.set(1.4, 1.6);
		faker_sky.visible = false;
		faker_sky.antialiasing = ClientPrefs.data.antialiasing;
		add(faker_sky);
		
		faker_eclipse = new FlxSprite(-500, -120);
		faker_eclipse.loadGraphic(Paths.image('bgs/faker-encore/eclipiceP1'));
		faker_eclipse.scrollFactor.set(0.6, 0.6);
		faker_eclipse.scale.set(1.3, 1.3);
		faker_eclipse.visible = false;
		faker_eclipse.antialiasing = ClientPrefs.data.antialiasing;
		add(faker_eclipse);
		
		if (!lowQuality) {
			faker_moutains = new FlxSprite(-1080, -220);
			faker_moutains.loadGraphic(Paths.image('bgs/faker-encore/moutainsP1'));
			faker_moutains.scrollFactor.set(0.7, 0.55);
			faker_moutains.scale.set(0.87, 0.87);
			faker_moutains.visible = false;
			faker_moutains.antialiasing = ClientPrefs.data.antialiasing;
			add(faker_moutains);
		
			faker_rings = new FlxSprite(-360, -160);
			faker_rings.loadGraphic(Paths.image('bgs/faker-encore/ringsP1'));
			faker_rings.scrollFactor.set(0.8, 0.8);
			faker_rings.scale.set(1.2, 1.2);
			faker_rings.visible = false;
			faker_rings.antialiasing = ClientPrefs.data.antialiasing;
			add(faker_rings);
		} else {
			faker_moutains = new FlxSprite(-1080, -250);
			faker_moutains.loadGraphic(Paths.image('blank'));
			faker_moutains.scrollFactor.set(0.7, 0.55);
			faker_moutains.scale.set(0.87, 0.87);
			faker_moutains.visible = false;
			faker_moutains.antialiasing = ClientPrefs.data.antialiasing;
			add(faker_moutains);
		
			faker_rings = new FlxSprite(-600, -300);
			faker_rings.loadGraphic(Paths.image('blank'));
			faker_rings.scrollFactor.set(0.8, 0.8);
			faker_rings.scale.set(1.2, 1.2);
			faker_rings.visible = false;
			faker_rings.antialiasing = ClientPrefs.data.antialiasing;
			add(faker_rings);
		}
		
		faker_bg = new FlxSprite(-700, -400);
		faker_bg.loadGraphic(Paths.image('bgs/faker-encore/bgP1'));
		faker_bg.scrollFactor.set(1, 1);
		faker_bg.scale.set(1.5, 1.5);
		faker_bg.visible = false;
		faker_bg.antialiasing = ClientPrefs.data.antialiasing;
		add(faker_bg);
		
		hogBg = new BGSprite('bgs/hog/bg', 0, -300, 1.1, 0.9);
		hogBg.scale.x = 1.5;
		hogBg.scale.y = 1.5;
		hogBg.visible = false;
		add(hogBg);

		hogMotain = new BGSprite('bgs/hog/motains', 0, 0, 1.1, 0.9);
		hogMotain.scale.x = 1.5;
		hogMotain.scale.y = 1.5;
		hogMotain.visible = false;
		add(hogMotain);
				
		if (!lowQuality) {
			hogWaterFalls = new FlxSprite(-1100, 200);
			hogWaterFalls.frames = Paths.getSparrowAtlas('bgs/hog/Waterfalls');
			hogWaterFalls.animation.addByPrefix('water', 'British', 12);
			hogWaterFalls.animation.play('water');
			hogWaterFalls.scrollFactor.set(1, 1);
			hogWaterFalls.visible = false;
			add(hogWaterFalls);

			hogLoops = new FlxSprite(-200, 170);
			hogLoops.frames = Paths.getSparrowAtlas('bgs/hog/HillsandHills');
			hogLoops.animation.addByPrefix('loops', 'DumbassMF', 12);
			hogLoops.animation.play('loops');
			hogLoops.scrollFactor.set(1, 0.9);
			hogLoops.visible = false;
			add(hogLoops);
		} else {
			hogWaterFalls = new FlxSprite(-1100, 200);
			hogWaterFalls.frames = Paths.getSparrowAtlas('blank');
			hogWaterFalls.animation.addByPrefix('water', 'fun', 12);
			hogWaterFalls.animation.play('water');
			hogWaterFalls.scrollFactor.set(1, 1);
			hogWaterFalls.visible = false;
			add(hogWaterFalls);

			hogLoops = new FlxSprite(-200, 170);
			hogLoops.frames = Paths.getSparrowAtlas('blank');
			hogLoops.animation.addByPrefix('loops', 'fun', 12);
			hogLoops.animation.play('loops');
			hogLoops.scrollFactor.set(1, 0.9);
			hogLoops.visible = false;
			add(hogLoops);
		}
					
		hogTrees = new BGSprite('bgs/hog/trees', -600, -120, 1, 0.9);
		hogTrees.visible = false;
		add(hogTrees);

		hogFloor = new BGSprite('bgs/hog/floor', -600, 750, 1, 1);
		hogFloor.scale.x = 1.25;
		hogFloor.scale.y = 1.25;
		hogFloor.visible = false;
		add(hogFloor);
		
		faker_sky2 = new FlxSprite(-500, -700);
		faker_sky2.loadGraphic(Paths.image('bgs/faker-encore/skyP2'));
		faker_sky2.scrollFactor.set(0.6, 0.6);
		faker_sky2.scale.set(1.4, 1.6);
		faker_sky2.visible = false;
		faker_sky2.antialiasing = ClientPrefs.data.antialiasing;
		add(faker_sky2);
		
		faker_eclipse2 = new FlxSprite(-500, -120);
		faker_eclipse2.loadGraphic(Paths.image('bgs/faker-encore/eclipiceP2'));
		faker_eclipse2.scrollFactor.set(0.6, 0.6);
		faker_eclipse2.scale.set(1.3, 1.3);
		faker_eclipse2.visible = false;
		faker_eclipse2.antialiasing = ClientPrefs.data.antialiasing;
		add(faker_eclipse2);
		
		if (!lowQuality) {
			faker_moutains2 = new FlxSprite(-1080, -220);
			faker_moutains2.loadGraphic(Paths.image('bgs/faker-encore/moutainsP2'));
			faker_moutains2.scrollFactor.set(0.7, 0.55);
			faker_moutains2.scale.set(0.87, 0.87);
			faker_moutains2.visible = false;
			faker_moutains2.antialiasing = ClientPrefs.data.antialiasing;
			add(faker_moutains2);
			
			faker_rings2 = new FlxSprite(-360, -160);
			faker_rings2.loadGraphic(Paths.image('bgs/faker-encore/ringsP2'));
			faker_rings2.scrollFactor.set(0.8, 0.8);
			faker_rings2.scale.set(1.2, 1.2);
			faker_rings2.visible = false;
			faker_rings2.antialiasing = ClientPrefs.data.antialiasing;
			add(faker_rings2);
		} else {
			faker_moutains2 = new FlxSprite(-1080, -750);
			faker_moutains2.loadGraphic(Paths.image('blank'));
			faker_moutains2.scrollFactor.set(0.7, 0.55);
			faker_moutains2.scale.set(0.87, 0.87);
			faker_moutains2.visible = false;
			faker_moutains2.antialiasing = ClientPrefs.data.antialiasing;
			add(faker_moutains2);
			
			faker_rings2 = new FlxSprite(-600, -300);
			faker_rings2.loadGraphic(Paths.image('blank'));
			faker_rings2.scrollFactor.set(0.8, 0.8);
			faker_rings2.scale.set(1.2, 1.2);
			faker_rings2.visible = false;
			faker_rings2.antialiasing = ClientPrefs.data.antialiasing;
			add(faker_rings2);
		}
		
		faker_bg2 = new FlxSprite(-700, -400);
		faker_bg2.loadGraphic(Paths.image('bgs/faker-encore/bgP2'));
		faker_bg2.scrollFactor.set(1, 1);
		faker_bg2.scale.set(1.5, 1.5);
		faker_bg2.visible = false;
		faker_bg2.antialiasing = ClientPrefs.data.antialiasing;
		add(faker_bg2);
					
		scorchedBg = new BGSprite('bgs/hog/blast/Sunset', -200, 0, 1.1, 0.9);
		scorchedBg.scale.x = 1.75;
		scorchedBg.scale.y = 1.75;
		scorchedBg.visible = false;
		add(scorchedBg);
			
		scorchedMotain = new BGSprite('bgs/hog/blast/Mountains', 0, 0, 1.1, 0.9);
		scorchedMotain.scale.x = 1.5;
		scorchedMotain.scale.y = 1.5;
		scorchedMotain.visible = false;
		add(scorchedMotain);
		
		if (!lowQuality) {
			scorchedWaterFalls = new FlxSprite(-1000, 200);
			scorchedWaterFalls.frames = Paths.getSparrowAtlas('bgs/hog/blast/Waterfalls');
			scorchedWaterFalls.animation.addByPrefix('water', 'British instance 1', 12);
			scorchedWaterFalls.animation.play('water');
			scorchedWaterFalls.scale.x = 1.1;
			scorchedWaterFalls.scale.y = 1.1;
			scorchedWaterFalls.scrollFactor.set(1, 1);
			scorchedWaterFalls.visible = false;
			add(scorchedWaterFalls);
					
			scorchedHills = new BGSprite('bgs/hog/blast/Hills', -100, 230, 1, 0.9);
			scorchedHills.visible = false;
			add(scorchedHills);
					
			scorchedMonitor = new FlxSprite(1100, 265);
			scorchedMonitor.frames = Paths.getSparrowAtlas('bgs/hog/blast/Monitor');
			scorchedMonitor.animation.addByPrefix('idle', 'Monitor', 12, false);
			scorchedMonitor.animation.addByPrefix('fatal', 'Fatalerror', 12, false);
			scorchedMonitor.animation.addByPrefix('nmi', 'NMI', 12, false);
			scorchedMonitor.animation.addByPrefix('needle', 'Needlemouse', 12, false);
			scorchedMonitor.animation.addByPrefix('starved', 'Storved', 12, false);
			scorchedMonitor.animation.play('idle');
			scorchedMonitor.scrollFactor.set(1, 0.9);
			scorchedMonitor.visible = false;
			add(scorchedMonitor);
		} else {
			scorchedWaterFalls = new FlxSprite(-1000, 200);
			scorchedWaterFalls.frames = Paths.getSparrowAtlas('blank');
			scorchedWaterFalls.animation.addByPrefix('water', 'fun', 12);
			scorchedWaterFalls.animation.play('water');
			scorchedWaterFalls.scale.x = 1.1;
			scorchedWaterFalls.scale.y = 1.1;
			scorchedWaterFalls.scrollFactor.set(1, 1);
			scorchedWaterFalls.visible = false;
			add(scorchedWaterFalls);
					
			scorchedHills = new BGSprite('blank', -100, 230, 1, 0.9);
			scorchedHills.visible = false;
			add(scorchedHills);
					
			scorchedMonitor = new FlxSprite(1100, 265);
			scorchedMonitor.frames = Paths.getSparrowAtlas('blank');
			scorchedMonitor.animation.addByPrefix('idle', 'fun', 12, false);
			scorchedMonitor.animation.addByPrefix('fatal', 'fun', 12, false);
			scorchedMonitor.animation.addByPrefix('nmi', 'fun', 12, false);
			scorchedMonitor.animation.addByPrefix('needle', 'fun', 12, false);
			scorchedMonitor.animation.addByPrefix('starved', 'fun', 12, false);
			scorchedMonitor.animation.play('idle');
			scorchedMonitor.scrollFactor.set(1, 0.9);
			scorchedMonitor.visible = false;
			add(scorchedMonitor);
		}
		
		scorchedTrees = new BGSprite('bgs/hog/blast/Plants', -400, -50, 1, 0.9);
		scorchedTrees.visible = false;
		add(scorchedTrees);
		
		scorchedFloor = new BGSprite('bgs/hog/blast/Floor', -400, 780, 1, 0.9);
		scorchedFloor.scale.x = 1.25;
		scorchedFloor.scale.y = 1.25;
		scorchedFloor.visible = false;
		add(scorchedFloor);
		
		circle = new FlxSprite(0, 0);
		circle.loadGraphic(Paths.image('circleshit'));
		circle.scrollFactor.set(1, 1);
		circle.scale.set(0.5, 0.5);
		circle.antialiasing = ClientPrefs.data.antialiasing;
		circle.visible = false;
		circle.screenCenter(X);
		circle.screenCenter(Y);
		add(circle);
	}
	
	override function createPost()
	{
		if (gpuCache) {
			ClientPrefs.data.cacheOnGPU = false;
			backend.ClientPrefs.saveSettings();
		}
		
		if (!lowQuality) {
			needleFg = new FlxSprite(-690, 560).loadGraphic(Paths.image('bgs/needlemouse-p2/fg'));
			needleFg.setGraphicSize(Std.int(needleFg.width * 1.1));
			needleFg.scrollFactor.set(1, 0.9);
			needleFg.visible = false;
			add(needleFg);
		
			tails_fg = new FlxSprite(-600, -1000);
			tails_fg.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_fg'));
			tails_fg.scrollFactor.set(0.7, 0.9);
			tails_fg.scale.set(0.95, 0.95);
			tails_fg.antialiasing = ClientPrefs.data.antialiasing;
			tails_fg.visible = false;
			add(tails_fg);

			wechidna_treesFG = new FlxSprite(-300, 400);
			wechidna_treesFG.loadGraphic(Paths.image('bgs/Wechidna/fg-trees'));
			wechidna_treesFG.scrollFactor.set(0.8, 1);
			wechidna_treesFG.scale.set(1, 1);
			wechidna_treesFG.visible = false;
			add(wechidna_treesFG);

			wechidna_thingFG = new FlxSprite(-210, 1725);
			wechidna_thingFG.loadGraphic(Paths.image('bgs/Wechidna/fg-smth'));
			wechidna_thingFG.scrollFactor.set(0.7, 0.9);
			wechidna_thingFG.scale.set(1, 1);
			wechidna_thingFG.visible = false;
			wechidna_thingFG.antialiasing = ClientPrefs.data.antialiasing;
			add(wechidna_thingFG);
			
			wechidna_grassFG = new FlxSprite(-390, 940);
			wechidna_grassFG.loadGraphic(Paths.image('bgs/Wechidna/fg-grass'));
			wechidna_grassFG.scrollFactor.set(0.6, 0.8);
			wechidna_grassFG.scale.set(1, 1);
			wechidna_grassFG.visible = false;
			wechidna_grassFG.antialiasing = ClientPrefs.data.antialiasing;
			add(wechidna_grassFG);
			
			satanos_rock = new FlxSprite(930, 500);
			satanos_rock.loadGraphic(Paths.image('bgs/satanos-bg/FRock'));
			satanos_rock.scrollFactor.set(0.8, 0.9);
			satanos_rock.scale.set(1.2, 1.2);
			satanos_rock.visible = false;
			satanos_rock.antialiasing = ClientPrefs.data.antialiasing;
			add(satanos_rock);
			
			guitar = new FlxSprite(360, -1000);
			guitar.loadGraphic(Paths.image('guitar'));
			guitar.scrollFactor.set(1, 1);
			guitar.visible = false;
			guitar.scale.x = 0.5;
			guitar.scale.y = 0.5;
			guitar.antialiasing = ClientPrefs.data.antialiasing;
			add(guitar);
			
			xeno_fg = new FlxSprite(-800, -1100);
			xeno_fg.loadGraphic(Paths.image('bgs/triple-trouble-encore/xeno/xeno_fg'));
			xeno_fg.scrollFactor.set(1.4, 0.9);
			xeno_fg.scale.set(1.1, 1.1);
			xeno_fg.visible = false;
			xeno_fg.flipX = true;
			xeno_fg.antialiasing = ClientPrefs.data.antialiasing;
			add(xeno_fg);
			
			majin_fgmajin = new BGSprite('bgs/FunInfiniteStage/majin FG1', 1426, 903, 1.0, 1.0, ['majin front bopper1'], true);
			majin_fgmajin.visible = false;
			add(majin_fgmajin);
				
			majin_fgmajin2 = new BGSprite('bgs/FunInfiniteStage/majin FG2', -93, 871, 1.0, 1.0, ['majin front bopper2'], true);
			majin_fgmajin2.visible = false;
			add(majin_fgmajin2);
			
			hogRocks = new BGSprite('bgs/hog/rocks', -500, 600, 1.1, 0.9);
			hogRocks.scale.x = 1.25;
			hogRocks.scale.y = 1.25;
			hogRocks.visible = false;
			add(hogRocks);
		} else {
			needleFg = new FlxSprite(-690, 780).loadGraphic(Paths.image('blank'));
			needleFg.setGraphicSize(Std.int(needleFg.width * 1.1));
			needleFg.scrollFactor.set(1, 0.9);
			needleFg.visible = false;
			add(needleFg);
		
			tails_fg = new FlxSprite(-600, -1000);
			tails_fg.loadGraphic(Paths.image('blank'));
			tails_fg.scrollFactor.set(0.7, 0.9);
			tails_fg.scale.set(0.95, 0.95);
			tails_fg.antialiasing = ClientPrefs.data.antialiasing;
			tails_fg.visible = false;
			add(tails_fg);
		
			wechidna_treesFG = new FlxSprite(-200, 0);
			wechidna_treesFG.loadGraphic(Paths.image('blank'));
			wechidna_treesFG.scrollFactor.set(0.8, 1);
			wechidna_treesFG.scale.set(1, 1);
			wechidna_treesFG.visible = false;
			add(wechidna_treesFG);

			wechidna_thingFG = new FlxSprite(-250, -125);
			wechidna_thingFG.loadGraphic(Paths.image('blank'));
			wechidna_thingFG.scrollFactor.set(0.7, 0.9);
			wechidna_thingFG.scale.set(1, 1);
			wechidna_thingFG.visible = false;
			wechidna_thingFG.antialiasing = ClientPrefs.data.antialiasing;
			add(wechidna_thingFG);
			
			wechidna_grassFG = new FlxSprite(-360, -240);
			wechidna_grassFG.loadGraphic(Paths.image('blank'));
			wechidna_grassFG.scrollFactor.set(0.6, 0.8);
			wechidna_grassFG.scale.set(1, 1);
			wechidna_grassFG.visible = false;
			wechidna_grassFG.antialiasing = ClientPrefs.data.antialiasing;
			add(wechidna_grassFG);
		
			satanos_rock = new FlxSprite(2350, 1020);
			satanos_rock.loadGraphic(Paths.image('blank'));
			satanos_rock.scrollFactor.set(0.8, 0.9);
			satanos_rock.scale.set(1.2, 1.2);
			satanos_rock.visible = false;
			satanos_rock.antialiasing = ClientPrefs.data.antialiasing;
			add(satanos_rock);

			xeno_fg = new FlxSprite(-800, -1100);
			xeno_fg.loadGraphic(Paths.image('blank'));
			xeno_fg.scrollFactor.set(1.4, 0.9);
			xeno_fg.scale.set(1.1, 1.1);
			xeno_fg.visible = false;
			xeno_fg.flipX = true;
			xeno_fg.antialiasing = ClientPrefs.data.antialiasing;
			add(xeno_fg);	

			majin_fgmajin = new BGSprite('blank', 1426, 903, 1.0, 1.0, ['fun'], true);
			majin_fgmajin.visible = false;
			add(majin_fgmajin);
				
			majin_fgmajin2 = new BGSprite('blank', -93, 871, 1.0, 1.0, ['fun'], true);
			majin_fgmajin2.visible = false;
			add(majin_fgmajin2);
			
			hogRocks = new BGSprite('blank', -500, 600, 1.1, 0.9);
			hogRocks.scale.x = 1.25;
			hogRocks.scale.y = 1.25;
			hogRocks.visible = false;
			add(hogRocks);
		}

		hogOverlay = new BGSprite('bgs/hog/overlay', -1000, -300, 1.1, 0.9);
		hogOverlay.scale.x = 1.25;
		hogOverlay.scale.y = 1.25;
		hogOverlay.visible = false;
		add(hogOverlay);

		if (!lowQuality) {
			sunkyTransition = new FlxSprite(-131, -200);
			sunkyTransition.frames = Paths.getSparrowAtlas('bgs/sunky/sunkTransition');
			sunkyTransition.animation.addByPrefix('b', 'sunkTransition', 26, false);
			sunkyTransition.scrollFactor.set(1, 1);
			sunkyTransition.antialiasing = ClientPrefs.data.antialiasing;
			sunkyTransition.cameras = [camHUD];
			sunkyTransition.visible = false;
			add(sunkyTransition);
		} else {
			sunkyTransition = new FlxSprite(0, 0);
			sunkyTransition.frames = Paths.getSparrowAtlas('blank');
			sunkyTransition.animation.addByPrefix('b', 'fun', 24, false);
			sunkyTransition.scrollFactor.set(1, 1);
			sunkyTransition.antialiasing = ClientPrefs.data.antialiasing;
			sunkyTransition.cameras = [camHUD];
			sunkyTransition.visible = false;
			sunkyTransition.screenCenter();
			add(sunkyTransition);
		}
	
		faker_overlay = new FlxSprite(0, 0);
		faker_overlay.loadGraphic(Paths.image('bgs/faker-encore/jover'));
		faker_overlay.scrollFactor.set(1, 1);
		faker_overlay.scale.set(0.69, 0.69);
		faker_overlay.visible = false;
		faker_overlay.cameras = [camHUD];
		faker_overlay.antialiasing = ClientPrefs.data.antialiasing;
		faker_overlay.screenCenter();
		add(faker_overlay);
	
		if (!lowQuality) {
			scorchedRocks = new BGSprite('bgs/hog/blast/Rocks', -500, 600, 1.1, 0.9);
			scorchedRocks.scale.x = 1.25;
			scorchedRocks.scale.y = 1.25;
			scorchedRocks.visible = false;
			add(scorchedRocks);
		} else {
			scorchedRocks = new BGSprite('blank', -500, 600, 1.1, 0.9);
			scorchedRocks.scale.x = 1.25;
			scorchedRocks.scale.y = 1.25;
			scorchedRocks.visible = false;
			add(scorchedRocks);
		}
	
		if (!lowQuality) {
			daJumpscare = new FlxSprite();
			daJumpscare.frames = Paths.getSparrowAtlas('sonicJUMPSCARE');
			daJumpscare.animation.addByPrefix('jump', "sonicSPOOK", 21.29032258, false);
			daJumpscare.scale.x = 1.1;
			daJumpscare.scale.y = 1.1;
			daJumpscare.updateHitbox();
			daJumpscare.screenCenter();
			daJumpscare.y += 370;
			daJumpscare.alpha = 0.0000001;
			daJumpscare.cameras = [camOther];
			add(daJumpscare);
		} else {
			daJumpscare = new FlxSprite();
			daJumpscare.frames = Paths.getSparrowAtlas('blank');
			daJumpscare.animation.addByPrefix('jump', "fun", 21.29032258, false);
			daJumpscare.scale.x = 1.1;
			daJumpscare.scale.y = 1.1;
			daJumpscare.updateHitbox();
			daJumpscare.screenCenter();
			daJumpscare.y += 370;
			daJumpscare.cameras = [camOther];
			add(daJumpscare);
		}
		
		vignette = new FlxSprite(0, 0);
		vignette.loadGraphic(Paths.image('WhiteVG'));
		vignette.scrollFactor.set(0, 0);
		vignette.scale.set(1, 1);
		vignette.visible = false;
		vignette.cameras = [camOther];
		vignette.antialiasing = ClientPrefs.data.antialiasing;
		vignette.screenCenter();
		add(vignette);
		
		exeDie = new FlxSprite(100, 200);
		exeDie.frames = Paths.getSparrowAtlas('exedeath');
		exeDie.animation.addByIndices('frame1', 'DieLmao', [1], "", 12, false);
		exeDie.animation.addByIndices('frame2', 'DieLmao', [3], "", 12, false);
		exeDie.animation.addByIndices('frame3', 'DieLmao', [4], "", 12, false);
		exeDie.animation.addByIndices('frame4', 'DieLmao', [5], "", 12, false);
		exeDie.animation.addByIndices('frame5', 'DieLmao', [6], "", 12, false);
		exeDie.animation.addByIndices('frame5', 'DieLmao', [7], "", 12, false);
		exeDie.animation.addByIndices('frame6', 'DieLmao', [8], "", 12, false);
		exeDie.animation.addByIndices('frame7', 'DieLmao', [9], "", 12, false);
		exeDie.animation.addByIndices('frame8', 'DieLmao', [10], "", 12, false);
		exeDie.animation.play('frame1');
		exeDie.scale.x = 1.8;
		exeDie.scale.y = 1.8;
		exeDie.antialiasing = ClientPrefs.data.antialiasing;
		exeDie.scrollFactor.set(1, 1);
		exeDie.screenCenter(X);
		exeDie.screenCenter(Y);
		exeDie.alpha = 0.000001;
		exeDie.visible = true;
		exeDie.cameras = [camOther];
		add(exeDie);
	
		wechJump = new FlxSprite(0, 0);
		wechJump.loadGraphic(Paths.image('wechidna'));
		wechJump.antialiasing = ClientPrefs.data.antialiasing;
		wechJump.scrollFactor.set(1.1, 1);
		wechJump.alpha = 0.000001;
		add(wechJump);
	
		ring = new FlxSprite(0, 0);
		ring.frames = Paths.getSparrowAtlas('bgs/digitalized/ring');
		ring.animation.addByIndices('idle', 'anim', [0], "", 24);
		ring.animation.addByPrefix('anim', 'anim', 24);
		ring.animation.play('idle');
		ring.scrollFactor.set(0, 0);
		ring.scale.set(1.5, 1.5);
		ring.alpha = 0.000001;
		ring.screenCenter();
		ring.antialiasing = false;
		ring.cameras = [camHUD];
		ring.antialiasing = ClientPrefs.data.antialiasing;
		add(ring);

		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Loading Assets 99%", null);
		#end
	
		char1 = new FlxSprite(0, 0);
		char1.loadGraphic(Paths.image('characters/BF/3D/bf-3d'));
		char1.scrollFactor.set(1, 1);
		char1.scale.set(1, 1);
		char1.antialiasing = ClientPrefs.data.antialiasing;
		char1.alpha = 0.00001;
		char1.screenCenter(X);
		char1.screenCenter(Y);
		add(char1);
	
		char2 = new FlxSprite(0, 0);
		char2.loadGraphic(Paths.image('characters/TailsDoll/3D/Tails_Doll'));
		char2.scrollFactor.set(1, 1);
		char2.scale.set(1, 1);
		char2.antialiasing = ClientPrefs.data.antialiasing;
		char2.alpha = 0.00001;
		char2.screenCenter(X);
		char2.screenCenter(Y);
		add(char2);
	
		char3 = new FlxSprite(0, 0);
		char3.loadGraphic(Paths.image('characters/XTerion/3D/xterion-first'));
		char3.scrollFactor.set(1, 1);
		char3.scale.set(1, 1);
		char3.antialiasing = ClientPrefs.data.antialiasing;
		char3.alpha = 0.00001;
		char3.screenCenter(X);
		char3.screenCenter(Y);
		add(char3);
	
		char4 = new FlxSprite(0, 0);
		char4.loadGraphic(Paths.image('characters/LordX/lordxEncore'));
		char4.scrollFactor.set(1, 1);
		char4.scale.set(1, 1);
		char4.antialiasing = ClientPrefs.data.antialiasing;
		char4.alpha = 0.00001;
		char4.screenCenter(X);
		char4.screenCenter(Y);
		add(char4);
	
		char5 = new FlxSprite(0, 0);
		char5.loadGraphic(Paths.image('characters/Tails/tails-encore'));
		char5.scrollFactor.set(1, 1);
		char5.scale.set(1, 1);
		char5.antialiasing = ClientPrefs.data.antialiasing;
		char5.alpha = 0.00001;
		char5.screenCenter(X);
		char5.screenCenter(Y);
		add(char5);
	
		char6 = new FlxSprite(0, 0);
		char6.loadGraphic(Paths.image('characters/Fleetway/Fleetway_Super_Sonic'));
		char6.scrollFactor.set(1, 1);
		char6.scale.set(1, 1);
		char6.antialiasing = ClientPrefs.data.antialiasing;
		char6.alpha = 0.00001;
		char6.screenCenter(X);
		char6.screenCenter(Y);
		add(char6);
	
		char7 = new FlxSprite(0, 0);
		char7.loadGraphic(Paths.image('characters/BF/HD/encoreBF'));
		char7.scrollFactor.set(1, 1);
		char7.scale.set(1, 1);
		char7.antialiasing = ClientPrefs.data.antialiasing;
		char7.alpha = 0.00001;
		char7.screenCenter(X);
		char7.screenCenter(Y);
		add(char7);
	
		char8 = new FlxSprite(0, 0);
		char8.loadGraphic(Paths.image('characters/BF/HD/encoreBF-majin'));
		char8.scrollFactor.set(1, 1);
		char8.scale.set(1, 1);
		char8.antialiasing = ClientPrefs.data.antialiasing;
		char8.alpha = 0.00001;
		char8.screenCenter(X);
		char8.screenCenter(Y);
		add(char8);
	
		char9 = new FlxSprite(0, 0);
		char9.loadGraphic(Paths.image('characters/BF/HD/encoreBF-redTint'));
		char9.scrollFactor.set(1, 1);
		char9.scale.set(1, 1);
		char9.antialiasing = ClientPrefs.data.antialiasing;
		char9.alpha = 0.00001;
		char9.screenCenter(X);
		char9.screenCenter(Y);
		add(char9);
	
		char10 = new FlxSprite(0, 0);
		char10.loadGraphic(Paths.image('characters/BF/HD/encoreBF-blackTint'));
		char10.scrollFactor.set(1, 1);
		char10.scale.set(1, 1);
		char10.antialiasing = ClientPrefs.data.antialiasing;
		char10.alpha = 0.00001;
		char10.screenCenter(X);
		char10.screenCenter(Y);
		add(char10);
	
		char12 = new FlxSprite(0, 0);
		char12.loadGraphic(Paths.image('characters/BF/HD/needle-bf-encore'));
		char12.scrollFactor.set(1, 1);
		char12.scale.set(1, 1);
		char12.antialiasing = ClientPrefs.data.antialiasing;
		char12.alpha = 0.00001;
		char12.screenCenter(X);
		char12.screenCenter(Y);
		add(char12);
	
		char13 = new FlxSprite(0, 0);
		char13.loadGraphic(Paths.image('characters/BF/HD/Sonic'));
		char13.scrollFactor.set(1, 1);
		char13.scale.set(1, 1);
		char13.antialiasing = ClientPrefs.data.antialiasing;
		char13.alpha = 0.00001;
		char13.screenCenter(X);
		char13.screenCenter(Y);
		add(char13);
	
		char14 = new FlxSprite(0, 0);
		char14.loadGraphic(Paths.image('characters/BF/Pixel/bf-encore-pixel'));
		char14.scrollFactor.set(1, 1);
		char14.scale.set(1, 1);
		char14.antialiasing = ClientPrefs.data.antialiasing;
		char14.alpha = 0.00001;
		char14.screenCenter(X);
		char14.screenCenter(Y);
		add(char14);
	
		char16 = new FlxSprite(0, 0);
		char16.loadGraphic(Paths.image('characters/ChotixXenotixAndChaotix/Pixel/faker_chaotix'));
		char16.scrollFactor.set(1, 1);
		char16.scale.set(1, 1);
		char16.antialiasing = ClientPrefs.data.antialiasing;
		char16.alpha = 0.00001;
		char16.screenCenter(X);
		char16.screenCenter(Y);
		add(char16);
	
		char17 = new FlxSprite(0, 0);
		char17.loadGraphic(Paths.image('characters/Coldsteel/coldsteel_assets'));
		char17.scrollFactor.set(1, 1);
		char17.scale.set(1, 1);
		char17.antialiasing = ClientPrefs.data.antialiasing;
		char17.alpha = 0.00001;
		char17.screenCenter(X);
		char17.screenCenter(Y);
		add(char17);
	
		char18 = new FlxSprite(0, 0);
		char18.loadGraphic(Paths.image('characters/Coldsteel/coldsteel_guitar'));
		char18.scrollFactor.set(1, 1);
		char18.scale.set(1, 1);
		char18.antialiasing = ClientPrefs.data.antialiasing;
		char18.alpha = 0.00001;
		char18.screenCenter(X);
		char18.screenCenter(Y);
		add(char18);
	
		char19 = new FlxSprite(0, 0);
		char19.loadGraphic(Paths.image('characters/Eggman/eggman-encore'));
		char19.scrollFactor.set(1, 1);
		char19.scale.set(1, 1);
		char19.antialiasing = ClientPrefs.data.antialiasing;
		char19.alpha = 0.00001;
		char19.screenCenter(X);
		char19.screenCenter(Y);
		add(char19);
	
		char20 = new FlxSprite(0, 0);
		char20.loadGraphic(Paths.image('characters/FakerAndExe/faker_encore'));
		char20.scrollFactor.set(1, 1);
		char20.scale.set(1, 1);
		char20.antialiasing = ClientPrefs.data.antialiasing;
		char20.alpha = 0.00001;
		char20.screenCenter(X);
		char20.screenCenter(Y);
		add(char20);
	
		char21 = new FlxSprite(0, 0);
		char21.loadGraphic(Paths.image('characters/FakerAndExe/faker-exe-encore'));
		char21.scrollFactor.set(1, 1);
		char21.scale.set(1, 1);
		char21.antialiasing = ClientPrefs.data.antialiasing;
		char21.alpha = 0.00001;
		char21.screenCenter(X);
		char21.screenCenter(Y);
		add(char21);
	
		char22 = new FlxSprite(0, 0);
		char22.loadGraphic(Paths.image('characters/FatalAndCritical/fatal-error-sonic'));
		char22.scrollFactor.set(1, 1);
		char22.scale.set(1, 1);
		char22.antialiasing = ClientPrefs.data.antialiasing;
		char22.alpha = 0.00001;
		char22.screenCenter(X);
		char22.screenCenter(Y);
		add(char22);
	
		char24 = new FlxSprite(0, 0);
		char24.loadGraphic(Paths.image('characters/FatalAndCritical/true-fatal'));
		char24.scrollFactor.set(1, 1);
		char24.scale.set(1, 1);
		char24.antialiasing = ClientPrefs.data.antialiasing;
		char24.alpha = 0.00001;
		char24.screenCenter(X);
		char24.screenCenter(Y);
		add(char24);
	
		char25 = new FlxSprite(0, 0);
		char25.loadGraphic(Paths.image('characters/Fleetway/fleetway1'));
		char25.scrollFactor.set(1, 1);
		char25.scale.set(1, 1);
		char25.antialiasing = ClientPrefs.data.antialiasing;
		char25.alpha = 0.00001;
		char25.screenCenter(X);
		char25.screenCenter(Y);
		add(char25);
	
		char26 = new FlxSprite(0, 0);
		char26.loadGraphic(Paths.image('characters/HogAndScorched/Hog'));
		char26.scrollFactor.set(1, 1);
		char26.scale.set(1, 1);
		char26.antialiasing = ClientPrefs.data.antialiasing;
		char26.alpha = 0.00001;
		char26.screenCenter(X);
		char26.screenCenter(Y);
		add(char26);
	
		char27 = new FlxSprite(0, 0);
		char27.loadGraphic(Paths.image('characters/HogAndScorched/scorched'));
		char27.scrollFactor.set(1, 1);
		char27.scale.set(1, 1);
		char27.antialiasing = ClientPrefs.data.antialiasing;
		char27.alpha = 0.00001;
		char27.screenCenter(X);
		char27.screenCenter(Y);
		add(char27);
	
		char28 = new FlxSprite(0, 0);
		char28.loadGraphic(Paths.image('characters/Knuckles/knux-encore'));
		char28.scrollFactor.set(1, 1);
		char28.scale.set(1, 1);
		char28.antialiasing = ClientPrefs.data.antialiasing;
		char28.alpha = 0.00001;
		char28.screenCenter(X);
		char28.screenCenter(Y);
		add(char28);
	
		char29 = new FlxSprite(0, 0);
		char29.loadGraphic(Paths.image('characters/Majin/SonicFunAssets'));
		char29.scrollFactor.set(1, 1);
		char29.scale.set(1, 1);
		char29.antialiasing = ClientPrefs.data.antialiasing;
		char29.alpha = 0.00001;
		char29.screenCenter(X);
		char29.screenCenter(Y);
		add(char29);
	
		char30 = new FlxSprite(0, 0);
		char30.loadGraphic(Paths.image('characters/NeedlemouseSarahShadowmouseLutherSunter/Needlemouse-p2'));
		char30.scrollFactor.set(1, 1);
		char30.scale.set(1, 1);
		char30.antialiasing = ClientPrefs.data.antialiasing;
		char30.alpha = 0.00001;
		char30.screenCenter(X);
		char30.screenCenter(Y);
		add(char30);
	
		char31 = new FlxSprite(0, 0);
		char31.loadGraphic(Paths.image('characters/Sanic/sanic'));
		char31.scrollFactor.set(1, 1);
		char31.scale.set(1, 1);
		char31.antialiasing = ClientPrefs.data.antialiasing;
		char31.alpha = 0.00001;
		char31.screenCenter(X);
		char31.screenCenter(Y);
		add(char31);
		
		char32 = new FlxSprite(0, 0);
		char32.loadGraphic(Paths.image('characters/Satanos/Satanos'));
		char32.scrollFactor.set(1, 1);
		char32.scale.set(1, 1);
		char32.antialiasing = ClientPrefs.data.antialiasing;
		char32.alpha = 0.00001;
		char32.screenCenter(X);
		char32.screenCenter(Y);
		add(char32);
	
		char33 = new FlxSprite(0, 0);
		char33.loadGraphic(Paths.image('characters/Sunky/Sunky'));
		char33.scrollFactor.set(1, 1);
		char33.scale.set(1, 1);
		char33.antialiasing = ClientPrefs.data.antialiasing;
		char33.alpha = 0.00001;
		char33.screenCenter(X);
		char33.screenCenter(Y);
		add(char33);
	
		char34 = new FlxSprite(0, 0);
		char34.loadGraphic(Paths.image('characters/XenoAndGrimbo/HD/Beast'));
		char34.scrollFactor.set(1, 1);
		char34.scale.set(1, 1);
		char34.antialiasing = ClientPrefs.data.antialiasing;
		char34.alpha = 0.00001;
		char34.screenCenter(X);
		char34.screenCenter(Y);
		add(char34);
	
		char35 = new FlxSprite(0, 0);
		char35.loadGraphic(Paths.image('characters/XenoAndGrimbo/HD/sonicexe'));
		char35.scrollFactor.set(1, 1);
		char35.scale.set(1, 1);
		char35.antialiasing = ClientPrefs.data.antialiasing;
		char35.alpha = 0.00001;
		char35.screenCenter(X);
		char35.screenCenter(Y);
		add(char35);
	
		char36 = new FlxSprite(0, 0);
		char36.loadGraphic(Paths.image('characters/XenoAndGrimbo/HD/YCR-Mad-Cherribun'));
		char36.scrollFactor.set(1, 1);
		char36.scale.set(1, 1);
		char36.antialiasing = ClientPrefs.data.antialiasing;
		char36.alpha = 0.00001;
		char36.screenCenter(X);
		char36.screenCenter(Y);
		add(char36);
	
		char37 = new FlxSprite(0, 0);
		char37.loadGraphic(Paths.image('characters/XenoAndGrimbo/HD/YCR-Cherribun'));
		char37.scrollFactor.set(1, 1);
		char37.scale.set(1, 1);
		char37.antialiasing = ClientPrefs.data.antialiasing;
		char37.alpha = 0.00001;
		char37.screenCenter(X);
		char37.screenCenter(Y);
		add(char37);
	
		char38 = new FlxSprite(0, 0);
		char38.loadGraphic(Paths.image('characters/BF/Pixel/pixel-normal'));
		char38.scrollFactor.set(1, 1);
		char38.scale.set(1, 1);
		char38.antialiasing = ClientPrefs.data.antialiasing;
		char38.alpha = 0.00001;
		char38.screenCenter(X);
		char38.screenCenter(Y);
		add(char38);

		char39 = new FlxSprite(0, 0);
		char39.loadGraphic(Paths.image('characters/FakerAndExe/faker_pixel'));
		char39.scrollFactor.set(1, 1);
		char39.scale.set(1, 1);
		char39.antialiasing = ClientPrefs.data.antialiasing;
		char39.alpha = 0.00001;
		char39.screenCenter(X);
		char39.screenCenter(Y);
		add(char39);
	
		char40 = new FlxSprite(0, 0);
		char40.loadGraphic(Paths.image('characters/ChotixXenotixAndChaotix/HD/chaotix-hd'));
		char40.scrollFactor.set(1, 1);
		char40.scale.set(1, 1);
		char40.antialiasing = ClientPrefs.data.antialiasing;
		char40.alpha = 0.00001;
		char40.screenCenter(X);
		char40.screenCenter(Y);
		add(char40);
	
		char42 = new FlxSprite(0, 0);
		char42.loadGraphic(Paths.image('characters/BF/HD/BF_Requital'));
		char42.scrollFactor.set(1, 1);
		char42.scale.set(1, 1);
		char42.antialiasing = ClientPrefs.data.antialiasing;
		char42.alpha = 0.00001;
		char42.screenCenter(X);
		char42.screenCenter(Y);
		add(char42);
		
		char1.destroy();
		char2.destroy();
		char3.destroy();
		char4.destroy();
		char5.destroy();
		char6.destroy();
		char7.destroy();
		char8.destroy();
		char9.destroy();
		char10.destroy();
		char12.destroy();
		char13.destroy();
		char14.destroy();
		char16.destroy();
		char17.destroy();
		char18.destroy();
		char19.destroy();
		char20.destroy();
		char21.destroy();
		char22.destroy();
		char24.destroy();
		char25.destroy();
		char26.destroy();
		char27.destroy();
		char28.destroy();
		char29.destroy();
		char30.destroy();
		char31.destroy();
		char32.destroy();
		char33.destroy();
		char34.destroy();
		char35.destroy();
		char36.destroy();
		char37.destroy();
		char38.destroy();
		char39.destroy();
		char40.destroy();
		char42.destroy();
		
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Starting Song...", null);
		#end
	}		

	override function update(elapsed:Float)
	{
		if (fleetwayMoment) {
			if (emeralds.y == -191.75) FlxTween.tween(emeralds, {y: -161.75}, 0.5, {ease: FlxEase.quadInOut});
			if (emeralds.y == -161.75) FlxTween.tween(emeralds, {y: -191.75}, 0.5, {ease: FlxEase.quadInOut});
		}

		if (!PlayState.chartingMode) {
			if (ClientPrefs.data.doTheThing) {
				ClientPrefs.data.doTheThing = false;
				ClientPrefs.saveSettings();
				doTheThing();
			}
		}
		if (curStep % 8 == 0) 
		{
			if (fucklesBeats)
			{
				fucklesEspioBg.animation.play('idle');
				fucklesMightyBg.animation.play('idle');
				fucklesCharmyBg.animation.play('idle');
				fucklesAmyBg.animation.play('idle');
				fucklesKnuxBg.animation.play('idle');
				fucklesVectorBg.animation.play('idle');
			}
		}
		switch (curStep)
		{	
			//Exe flash shit
			case 9061:
				exeDie.alpha = 1;
				exeDie.visible = true;
				exeDie.animation.play('frame1', true);
			case 9063:
				exeDie.visible = true;
				exeDie.animation.play('frame2', true);
			case 9065:
				exeDie.visible = true;
				exeDie.animation.play('frame3', true);
			case 9067:
				exeDie.visible = true;
				exeDie.animation.play('frame6', true);
			case 9069:
				exeDie.visible = true;
				exeDie.animation.play('frame7', true);
			case 9071:
				exeDie.visible = true;
				exeDie.animation.play('frame8', true);
			case 9060, 9062, 9064, 9066, 9068, 9070:
				exeDie.visible = false;

			case 136, 400, 592, 848, 944, 10224, 10320: //xterion
				redRingTransition();
				tailsdoll_floor.visible = false;
				xterion_floor.visible = true;
				
			case 849: //preload exe, scorched
				faker_sky2.visible = true;
				faker_eclipse2.visible = true;
				faker_moutains2.visible = true;
				faker_rings2.visible = true;
				faker_bg2.visible = true;
				scorchedBg.visible = true;
				scorchedMotain.visible = true;
				scorchedWaterFalls.visible = true;
				scorchedFloor.visible = true;
				scorchedMonitor.visible = true;
				scorchedHills.visible = true;
				scorchedTrees.visible = true;
				
			case 850: //preload remove
				faker_sky2.visible = false;
				faker_eclipse2.visible = false;
				faker_moutains2.visible = false;
				faker_rings2.visible = false;
				faker_bg2.visible = false;
				scorchedBg.visible = false;
				scorchedMotain.visible = false;
				scorchedWaterFalls.visible = false;
				scorchedFloor.visible = false;
				scorchedMonitor.visible = false;
				scorchedHills.visible = false;
				scorchedTrees.visible = false;
				
			case 593, 9841: //needlemouse and tails lag prevention
				needleMoutains.visible = true;
				needleBuildings.visible = true;
				conkCreet.visible = true;
				needleFg.visible = true;
				tails_sky.visible = true;
				tails_fg.visible = true;
				tails_trees1.visible = true;
				tails_trees2.visible = true;
				tails_floor.visible = true;
				hogOverlay.visible = true;
				faker_overlay.visible = true;
				hogRocks.visible = true;
			
			case 3232:
				redRingTransition();
			
			case 594, 9842: //deactivate lag shit
				needleMoutains.visible = false;
				needleBuildings.visible = false;
				conkCreet.visible = false;
				needleFg.visible = false;
				tails_sky.visible = false;
				tails_fg.visible = false;
				tails_trees1.visible = false;
				tails_trees2.visible = false;
				tails_floor.visible = false;
				hogOverlay.visible = false;
				faker_overlay.visible = false;
				hogRocks.visible = false;
				
			case 10322, 10323, 10324, 10325, 10326, 10327, 10328, 10329, 10330: //im sick of this
				majin_bush2.visible = false;
				majin_bush.visible = false;
				majin_floor.visible = false;
				majin_pillars1.visible = false;
				majin_pillars2.visible = false;
				majin_fgmajin.visible = false;
				majin_fgmajin2.visible = false;
				satanos_sky.visible = false;
				satanos_trees.visible = false;
				satanos_floor.visible = false;
				satanos_rock.visible = false;
				lordx_sky.visible = false;
				lordx_floor.visible = false;
				lordx_eyeflower.visible = false;
				lordx_notknuckles.visible = false;
				lordx_bfsmallflower.visible = false;
				lordx_tree.visible = false;
				sunky_bg.visible = false;
				sunky_milk.visible = false;
				sunky_cereal.visible = false;
				sunky_speakers.visible = false;
				sunky_balls.visible = false;
				sunky_stage.visible = false;
				sanic_bg.visible = false;
				knuckles_bg.visible = false;
				knuckles_city2.visible = false;
				knuckles_floor.visible = false;
			
			case 272, 528, 656, 912, 10160, 10288: //tailsdoll
				redRingTransition();
				tailsdoll_floor.visible = true;
				xterion_floor.visible = false;
			
			case 1040, 1296, 1552, 1808, 10416: //needlemouse
				redRingTransition();
				xterion_floor.visible = false;
				tails_sky.visible = false;
				tails_fg.visible = false;
				tails_trees1.visible = false;
				tails_trees2.visible = false;
				tails_floor.visible = false;
				needleMoutains.visible = true;
				needleBuildings.visible = true;
				conkCreet.visible = true;
				needleFg.visible = true;
				
			case 1168, 1424, 1680, 1936, 10544: //tails
				redRingTransition();
				tails_sky.visible = true;
				tails_fg.visible = true;
				tails_trees1.visible = true;
				tails_trees2.visible = true;
				tails_floor.visible = true;
				needleMoutains.visible = false;
				needleBuildings.visible = false;
				conkCreet.visible = false;
				needleFg.visible = false;
				
			case 2064, 10672: //fleetway
				redRingTransition();
				fleetwayMoment = true;
				fleetwaybgshit.alpha = 1;
				emeraldbeamyellow.alpha = 1;
				emeralds.alpha = 1;
				thechamber.alpha = 1;
				tails_sky.visible = false;
				tails_fg.visible = false;
				tails_trees1.visible = false;
				tails_trees2.visible = false;
				tails_floor.visible = false;
				dadGroup.scrollFactor.set(1.1, 1);
				boyfriendGroup.scrollFactor.set(1.1, 1);
				gfGroup.scrollFactor.set(1.1, 1);

			case 3217: //Chaotix init
				fleetwayMoment = false;
				fleetwaybgshit.alpha = 0.000001;
				emeraldbeamyellow.alpha = 0.000001;
				emeralds.alpha = 0.000001;
				thechamber.alpha = 0.000001;
				fucklesBGPixel.visible = true;
				fucklesFGPixel.visible = true;
				fucklesAmyBg.visible = true;
				fucklesCharmyBg.visible = true;
				fucklesMightyBg.visible = true;
				fucklesEspioBg.visible = true;
				fucklesKnuxBg.visible = true;
				fucklesVectorBg.visible = true;
				dadGroup.scrollFactor.set(1, 1);
				boyfriendGroup.scrollFactor.set(1, 1);
				gfGroup.scrollFactor.set(1, 1);
		
			case 3222: //preload knuckles, wechidna
				knuckles_bg.visible = true;
				knuckles_city2.visible = true;
				knuckles_floor.visible = true;
				wechidna_sky.visible = true;
				wechidna_building1.visible = true;
				wechidna_building2.visible = true;
				wechidna_floor.visible = true;
				wechidna_treesFG.visible = true;
				wechidna_thingFG.visible = true;
				wechidna_grassFG.visible = true;
				
			case 3231: //remove preload stuff
				knuckles_bg.visible = false;
				knuckles_city2.visible = false;
				knuckles_floor.visible = false;
				wechidna_sky.visible = false;
				wechidna_building1.visible = false;
				wechidna_building2.visible = false;
				wechidna_floor.visible = false;
				wechidna_treesFG.visible = false;
				wechidna_thingFG.visible = false;
				wechidna_grassFG.visible = false;
				
			case 3360, 3520, 3680, 4064, 4192, 11056: //knuckles
				redRingTransition();
				knuckles_bg.visible = true;
				knuckles_city2.visible = true;
				knuckles_floor.visible = true;
				fucklesBGPixel.visible = false;
				fucklesFGPixel.visible = false;
				fucklesAmyBg.visible = false;
				fucklesCharmyBg.visible = false;
				fucklesMightyBg.visible = false;
				fucklesEspioBg.visible = false;
				fucklesKnuxBg.visible = false;
				fucklesVectorBg.visible = false;
				wechidna_sky.visible = false;
				wechidna_building1.visible = false;
				wechidna_building2.visible = false;
				wechidna_floor.visible = false;
				wechidna_treesFG.visible = false;
				wechidna_thingFG.visible = false;
				wechidna_grassFG.visible = false;
				dadGroup.scrollFactor.set(1, 1);
				boyfriendGroup.scrollFactor.set(1, 1);
				gfGroup.scrollFactor.set(1, 1);
				
			case 3408, 3648, 3712: //chaotix
				redRingTransition();
				knuckles_bg.visible = false;
				knuckles_city2.visible = false;
				knuckles_floor.visible = false;
				fucklesBGPixel.visible = true;
				fucklesFGPixel.visible = true;
				fucklesAmyBg.visible = true;
				fucklesCharmyBg.visible = true;
				fucklesMightyBg.visible = true;
				fucklesEspioBg.visible = true;
				fucklesKnuxBg.visible = true;
				fucklesVectorBg.visible = true;
			
			case 3744, 4128, 10928: //wechidna
				redRingTransition();
				fleetwayMoment = false;
				wechidna_sky.visible = true;
				wechidna_building1.visible = true;
				wechidna_building2.visible = true;
				wechidna_floor.visible = true;
				wechidna_treesFG.visible = true;
				wechidna_thingFG.visible = true;
				wechidna_grassFG.visible = true;
				knuckles_bg.visible = false;
				knuckles_city2.visible = false;
				knuckles_floor.visible = false;
				fucklesBGPixel.visible = false;
				fucklesFGPixel.visible = false;
				fucklesAmyBg.visible = false;
				fucklesCharmyBg.visible = false;
				fucklesMightyBg.visible = false;
				fucklesEspioBg.visible = false;
				fucklesKnuxBg.visible = false;
				fucklesVectorBg.visible = false;
				dadGroup.scrollFactor.set(1, 1);
				boyfriendGroup.scrollFactor.set(1, 1);
				gfGroup.scrollFactor.set(1, 1);
				
			case 3521: //preload satanos
				satanos_sky.visible = true;
				satanos_trees.visible = true;
				satanos_floor.visible = true;
				satanos_rock.visible = true;
				satanos_sky.visible = false;
				satanos_trees.visible = false;
				satanos_floor.visible = false;
				satanos_rock.visible = false;
				satanos_sky.visible = true;
				satanos_trees.visible = true;
				satanos_floor.visible = true;
				satanos_rock.visible = true;
				
			case 3522: //remove satanos
				satanos_sky.visible = false;
				satanos_trees.visible = false;
				satanos_floor.visible = false;
				satanos_rock.visible = false;
				
			case 4256, 4768, 5056, 5184, 5424, 11184: //satanos
				redRingTransition();
				knuckles_bg.visible = false;
				knuckles_city2.visible = false;
				knuckles_floor.visible = false;
				satanos_sky.visible = true;
				satanos_trees.visible = true;
				satanos_floor.visible = true;
				satanos_rock.visible = true;
				
			case 4496, 4920, 5088, 5344, 5472, 11248: //eggman
				redRingTransition();
				satanos_sky.visible = false;
				satanos_trees.visible = false;
				satanos_floor.visible = false;
				satanos_rock.visible = false;
				
			case 5345: //preload xeno, majin
				xeno_fg.visible = true;
				xeno_floor.visible = true;
				daJumpscare.visible = true;
				majin_bush2.visible = true;
				majin_bush.visible = true;
				majin_floor.visible = true;
				majin_pillars1.visible = true;
				majin_pillars2.visible = true;
				majin_fgmajin.visible = true;
				majin_fgmajin2.visible = true;
				
			case 5346: //remove preload shit
				xeno_fg.visible = false;
				xeno_floor.visible = false;
				majin_bush2.visible = false;
				majin_bush.visible = false;
				majin_floor.visible = false;
				majin_pillars1.visible = false;
				majin_pillars2.visible = false;
				majin_fgmajin.visible = false;
				majin_fgmajin2.visible = false;
				
			case 5473: //Preload sonic.exe, lordx, fatal
				sonic_bg.visible = true;
				sonic_ground.visible = true;
				
			case 5474: //remove preload shit
				sonic_bg.visible = false;
				sonic_ground.visible = false;
				
			case 5585: //preload lordx, fatal
				lordx_sky.visible = true;
				lordx_floor.visible = true;
				lordx_eyeflower.visible = true;
				lordx_notknuckles.visible = true;
				lordx_bfsmallflower.visible = true;
				lordx_tree.visible = true;
				domain.visible = true;
				domain2.visible = true;
				
			case 5586: //remove preload shit
				lordx_sky.visible = false;
				lordx_floor.visible = false;
				lordx_eyeflower.visible = false;
				lordx_notknuckles.visible = false;
				lordx_bfsmallflower.visible = false;
				lordx_tree.visible = false;
				domain.visible = false;
				domain2.visible = false;
				
			case 5584, 6096, 6352: //sonic.exe
				redRingTransition();
				domain.visible = false;
				domain2.visible = false;
				sonic_bg.visible = true;
				sonic_ground.visible = true;
				lordx_sky.visible = false;
				lordx_floor.visible = false;
				lordx_eyeflower.visible = false;
				lordx_notknuckles.visible = false;
				lordx_bfsmallflower.visible = false;
				lordx_tree.visible = false;

			case 5840, 6160, 6384, 6464, 11520, 11600: //lordx
				redRingTransition();
				domain.visible = false;
				domain2.visible = false;
				sonic_ground.visible = false;
				lordx_sky.visible = true;
				lordx_floor.visible = true;
				lordx_eyeflower.visible = true;
				lordx_notknuckles.visible = true;
				lordx_bfsmallflower.visible = true;
				lordx_tree.visible = true;
				majin_bush2.visible = false;
				majin_bush.visible = false;
				majin_floor.visible = false;
				majin_pillars1.visible = false;
				majin_pillars2.visible = false;
				majin_fgmajin.visible = false;
				majin_fgmajin2.visible = false;
				
			case 5968, 6224, 6416, 11456, 11584: //fatal
				redRingTransition();
				xeno_fg.visible = false;
				xeno_floor.visible = false;
				domain.visible = true;
				domain2.visible = true;
				sonic_bg.visible = false;
				sonic_ground.visible = false;
				lordx_sky.visible = false;
				lordx_floor.visible = false;
				lordx_eyeflower.visible = false;
				lordx_notknuckles.visible = false;
				lordx_bfsmallflower.visible = false;
				lordx_tree.visible = false;

			case 6417: //Preload xeno, majin, sunky, sanic, coldsteel
				xeno_fg.visible = true;
				xeno_floor.visible = true;
				majin_bush2.visible = true;
				majin_bush.visible = true;
				majin_floor.visible = true;
				majin_pillars1.visible = true;
				majin_pillars2.visible = true;
				majin_fgmajin.visible = true;
				majin_fgmajin2.visible = true;
				sunky_bg.visible = true;
				sunky_milk.visible = true;
				sunky_cereal.visible = true;
				sunky_speakers.visible = true;
				sunky_balls.visible = true;
				sunky_stage.visible = true;
				sanic_bg.visible = true;
				sunkyTransition.visible = true;
				coldsteel_whiteFuck.visible = true;
				guitar.visible = true;
				coldsteel_shadow.visible = true;
				
			case 6418: //remove preload shit
				xeno_fg.visible = false;
				xeno_floor.visible = false;
				majin_bush2.visible = false;
				majin_bush.visible = false;
				majin_floor.visible = false;
				majin_pillars1.visible = false;
				majin_pillars2.visible = false;
				majin_fgmajin.visible = false;
				majin_fgmajin2.visible = false;
				sunky_bg.visible = false;
				sunky_milk.visible = false;
				sunky_cereal.visible = false;
				sunky_speakers.visible = false;
				sunky_balls.visible = false;
				sunky_stage.visible = false;
				sanic_bg.visible = false;
				sunkyTransition.visible = false;
				coldsteel_whiteFuck.visible = false;
				guitar.visible = false;
				coldsteel_shadow.visible = false;

			case 6608: //ycr-normal
				redRingTransition();
				knuckles_bg.visible = true;
				knuckles_city2.visible = true;
				knuckles_floor.visible = true;
				lordx_sky.visible = false;
				lordx_floor.visible = false;
				lordx_eyeflower.visible = false;
				lordx_notknuckles.visible = false;
				lordx_bfsmallflower.visible = false;
				lordx_tree.visible = false;
				
			case 6641:
				daJumpscare.destroy();
				
			case 6640, 6896, 6928, 7056, 11440, 11568, 12224: //xeno
				redRingTransition();
				xeno_fg.visible = true;
				xeno_floor.visible = true;
				knuckles_bg.visible = false;
				knuckles_city2.visible = false;
				knuckles_floor.visible = false;
				majin_bush2.visible = false;
				majin_bush.visible = false;
				majin_floor.visible = false;
				majin_pillars1.visible = false;
				majin_pillars2.visible = false;
				majin_fgmajin.visible = false;
				majin_fgmajin2.visible = false;
				lordx_sky.visible = false;
				lordx_floor.visible = false;
				lordx_eyeflower.visible = false;
				lordx_notknuckles.visible = false;
				lordx_bfsmallflower.visible = false;
				lordx_tree.visible = false;
				
			case 6768, 6912, 6944, 11504, 11616: //majin
				redRingTransition();
				domain.visible = false;
				domain2.visible = false;
				xeno_fg.visible = false;
				xeno_floor.visible = false;
				majin_bush2.visible = true;
				majin_bush.visible = true;
				majin_floor.visible = true;
				majin_pillars1.visible = true;
				majin_pillars2.visible = true;
				majin_fgmajin.visible = true;
				majin_fgmajin2.visible = true;
				lordx_sky.visible = false;
				lordx_floor.visible = false;
				lordx_eyeflower.visible = false;
				lordx_notknuckles.visible = false;
				lordx_bfsmallflower.visible = false;
				lordx_tree.visible = false;
			
			case 7168, 7296, 7482, 8314, 8384, 11696: //sunky
				redRingTransition();
				xeno_fg.visible = false;
				xeno_floor.visible = false;
				sunkyMoment = true;
				sunky_bg.visible = true;
				sunky_milk.visible = true;
				sunky_cereal.visible = true;
				sunky_speakers.visible = true;
				sunky_balls.visible = true;
				sunky_stage.visible = true;
				sanic_bg.visible = false;
				coldsteel_whiteFuck.visible = false;
				coldsteel_shadow.visible = false;
				
			case 7232, 7332, 8336, 8392, 11728: //sanic
				redRingTransition();
				coldsteel_whiteFuck.visible = false;
				coldsteel_shadow.visible = false;
				sanic_bg.visible = true;
				sunkyMoment = false;
				sunky_bg.visible = false;
				sunky_milk.visible = false;
				sunky_cereal.visible = false;
				sunky_speakers.visible = false;
				sunky_balls.visible = false;
				sunky_stage.visible = false;
				
			case 7680, 8416, 11824: //coldsteel
				redRingTransition();
				coldsteel_whiteFuck.visible = true;
				coldsteel_shadow.visible = true;
				sanic_bg.visible = false;
				sunky_bg.visible = false;
				sunky_milk.visible = false;
				sunky_cereal.visible = false;
				sunky_speakers.visible = false;
				sunky_balls.visible = false;
				sunky_stage.visible = false;
				
			case 7696: //preload faker, hog
				faker_sky.visible = true;
				faker_eclipse.visible = true;
				faker_moutains.visible = true;
				faker_rings.visible = true;
				faker_bg.visible = true;
				hogBg.visible = true;
				hogMotain.visible = true;
				hogWaterFalls.visible = true;
				hogLoops.visible = true;
				hogTrees.visible = true;
				hogFloor.visible = true;
				
			case 7706: //remove preload shit
				faker_sky.visible = false;
				faker_eclipse.visible = false;
				faker_moutains.visible = false;
				faker_rings.visible = false;
				faker_bg.visible = false;
				hogBg.visible = false;
				hogMotain.visible = false;
				hogWaterFalls.visible = false;
				hogLoops.visible = false;
				hogTrees.visible = false;
				hogFloor.visible = false;
				hogRocks.visible = false;
				
			case 8528, 8784, 8912: //faker
				redRingTransition();
				coldsteel_whiteFuck.visible = false;
				coldsteel_shadow.visible = false;
				faker_sky.visible = true;
				faker_eclipse.visible = true;
				faker_moutains.visible = true;
				faker_rings.visible = true;
				faker_bg.visible = true;
				hogBg.visible = false;
				hogMotain.visible = false;
				hogWaterFalls.visible = false;
				hogLoops.visible = false;
				hogTrees.visible = false;
				hogFloor.visible = false;
				hogRocks.visible = false;
				hogOverlay.visible = false;
			
			case 8656, 8848, 8944: //hog
				redRingTransition();
				faker_sky.visible = false;
				faker_eclipse.visible = false;
				faker_moutains.visible = false;
				faker_rings.visible = false;
				faker_bg.visible = false;
				hogBg.visible = true;
				hogMotain.visible = true;
				hogWaterFalls.visible = true;
				hogLoops.visible = true;
				hogTrees.visible = true;
				hogFloor.visible = true;
				hogRocks.visible = true;
				hogOverlay.visible = true;
				
			case 9072, 9328, 9712, 9968, 11952: //Exe
				redRingTransition();
				faker_sky2.visible = true;
				faker_eclipse2.visible = true;
				faker_moutains2.visible = true;
				faker_rings2.visible = true;
				faker_bg2.visible = true;
				faker_overlay.visible = true;
				hogBg.visible = false;
				hogMotain.visible = false;
				hogWaterFalls.visible = false;
				hogLoops.visible = false;
				hogTrees.visible = false;
				hogFloor.visible = false;
				hogRocks.visible = false;
				hogOverlay.visible = false;
				scorchedBg.visible = false;
				scorchedMotain.visible = false;
				scorchedWaterFalls.visible = false;
				scorchedFloor.visible = false;
				scorchedMonitor.visible = false;
				scorchedHills.visible = false;
				scorchedTrees.visible = false;
				scorchedRocks.visible = false;
				
			case 9200, 9456, 9840, 12080: //Scorched
				redRingTransition();
				scorchedBg.visible = true;
				scorchedMotain.visible = true;
				scorchedWaterFalls.visible = true;
				scorchedFloor.visible = true;
				scorchedMonitor.visible = true;
				scorchedHills.visible = true;
				scorchedTrees.visible = true;
				scorchedRocks.visible = true;
				faker_sky2.visible = false;
				faker_eclipse2.visible = false;
				faker_moutains2.visible = false;
				faker_rings2.visible = false;
				faker_bg2.visible = false;
				faker_overlay.visible = false;
			
			case 10096: //Angry ycr
				redRingTransition();
				faker_sky2.visible = false;
				faker_eclipse2.visible = false;
				faker_moutains2.visible = false;
				faker_rings2.visible = false;
				faker_bg2.visible = false;
				faker_overlay.visible = false;
				knuckles_bg.visible = true;
				knuckles_city2.visible = true;
				knuckles_floor.visible = true;
				
			case 10161: //Back to Tailsdoll
				redRingTransition();
				knuckles_bg.visible = false;
				knuckles_city2.visible = false;
				knuckles_floor.visible = false;
		
			case 12240:
				circle.visible = true;
				circle.screenCenter(X);
				circle.screenCenter(Y);
				circle.alpha = 0.8;
				circle.x += 400;
				circle.y += 120;
		}
	}
			

	public function doTheThing()
	{
		char1.alpha = 1;
		char2.alpha = 1;
		char3.alpha = 1;
		char4.alpha = 1;
		char5.alpha = 1;
		char6.alpha = 1;
		char7.alpha = 1;
		char8.alpha = 1;
		char9.alpha = 1;
		char10.alpha = 1;
		char12.alpha = 1;
		char13.alpha = 1;
		char14.alpha = 1;
		char16.alpha = 1;
		char17.alpha = 1;
		char18.alpha = 1;
		char19.alpha = 1;
		char20.alpha = 1;
		char21.alpha = 1;
		char22.alpha = 1;
		char24.alpha = 1;
		char25.alpha = 1;
		char26.alpha = 1;
		char27.alpha = 1;
		char28.alpha = 1;
		char29.alpha = 1;
		char30.alpha = 1;
		char31.alpha = 1;
		char32.alpha = 1;
		char33.alpha = 1;
		char34.alpha = 1;
		char35.alpha = 1;
		char36.alpha = 1;
		char37.alpha = 1;
		char38.alpha = 1;
		char39.alpha = 1;
		char40.alpha = 1;
		char41.alpha = 1;
		char42.alpha = 1;
	
		char1.alpha = 0;
		char2.alpha = 0;
		char3.alpha = 0;
		char4.alpha = 0.00001;
		char5.alpha = 0;
		char6.alpha = 0;
		char7.alpha = 0;
		char8.alpha = 0;
		char9.alpha = 0;
		char10.alpha = 0;
		char12.alpha = 0;
		char13.alpha = 0;
		char14.alpha = 0;
		char16.alpha = 0;
		char17.alpha = 0;
		char18.alpha = 0;
		char19.alpha = 0.00001;
		char20.alpha = 0.00001;
		char21.alpha = 0.00001;
		char22.alpha = 0;
		char24.alpha = 0;
		char25.alpha = 0.00001;
		char26.alpha = 0.00001;
		char27.alpha = 0.00001;
		char28.alpha = 0;
		char29.alpha = 0;
		char30.alpha = 0;
		char31.alpha = 0;
		char32.alpha = 0.00001;
		char33.alpha = 0;
		char34.alpha = 0;
		char35.alpha = 0.00001;
		char36.alpha = 0;
		char37.alpha = 0;
		char38.alpha = 0;
		char39.alpha = 0;
		char40.alpha = 0;
		char41.alpha = 0.00001;
		char42.alpha = 0;

		sunkyTransition.visible = true;
		daJumpscare.visible = true;
		ring.visible = true;
		circle.visible = true;
		sunkyTransition.visible = false;
		ring.visible = false;
		circle.visible = false;
			
		tailsdoll_floor.visible = true;
		tailsdoll_floor.visible = false;
		
		xterion_floor.visible = true;
		xterion_floor.visible = false;
		
		needleMoutains.visible = true;
		needleBuildings.visible = true;
		conkCreet.visible = true;
		needleFg.visible = true;
		needleMoutains.visible = false;
		needleBuildings.visible = false;
		conkCreet.visible = false;
		needleFg.visible = false;
		
		tails_sky.visible = true;
		tails_fg.visible = true;
		tails_trees1.visible = true;
		tails_trees2.visible = true;
		tails_floor.visible = true;
		tails_sky.visible = false;
		tails_fg.visible = false;
		tails_trees1.visible = false;
		tails_trees2.visible = false;
		tails_floor.visible = false;
		
		fleetwaybgshit.visible = true;
		emeraldbeamyellow.visible = true;
		emeralds.visible = true;
		thechamber.visible = true;
		fleetwaybgshit.visible = false;
		emeraldbeamyellow.visible = false;
		emeralds.visible = false;
		thechamber.visible = false;
					
		fucklesBGPixel.visible = true;
		fucklesFGPixel.visible = true;
		fucklesAmyBg.visible = true;
		fucklesVectorBg.visible = true;
		fucklesKnuxBg.visible = true;
		fucklesEspioBg.visible = true;
		fucklesCharmyBg.visible = true;
		fucklesMightyBg.visible = true;
		whiteFuck.visible = true;
		fucklesBGPixel.visible = false;
		fucklesFGPixel.visible = false;
		fucklesAmyBg.visible = false;
		fucklesVectorBg.visible = false;
		fucklesKnuxBg.visible = false;
		fucklesEspioBg.visible = false;
		fucklesCharmyBg.visible = false;
		fucklesMightyBg.visible = false;
		whiteFuck.visible = false;
		
		knuckles_bg.visible = true;
		knuckles_city2.visible = true;
		knuckles_floor.visible = true;
		knuckles_bg.visible = false;
		knuckles_city2.visible = false;
		knuckles_floor.visible = false;
		
		wechidna_sky.visible = true;
		wechidna_building1.visible = true;
		wechidna_building2.visible = true;
		wechidna_floor.visible = true;
		wechidna_treesFG.visible = true;
		wechidna_thingFG.visible = true;
		wechidna_grassFG.visible = true;
		wechidna_sky.visible = false;
		wechidna_building1.visible = false;
		wechidna_building2.visible = false;
		wechidna_floor.visible = false;
		wechidna_treesFG.visible = false;
		wechidna_thingFG.visible = false;
		wechidna_grassFG.visible = false;
		
		satanos_sky.visible = true;
		satanos_trees.visible = true;
		satanos_floor.visible = true;
		satanos_rock.visible = true;
		satanos_sky.visible = false;
		satanos_trees.visible = false;
		satanos_floor.visible = false;
		satanos_rock.visible = false;
		
		sonic_bg.visible = true;
		sonic_ground.visible = true;
		sonic_bg.visible = false;
		sonic_ground.visible = false;
		
		lordx_sky.visible = true;
		lordx_floor.visible = true;
		lordx_eyeflower.visible = true;
		lordx_notknuckles.visible = true;
		lordx_bfsmallflower.visible = true;
		lordx_tree.visible = true;
		lordx_sky.visible = false;
		lordx_floor.visible = false;
		lordx_eyeflower.visible = false;
		lordx_notknuckles.visible = false;
		lordx_bfsmallflower.visible = false;
		lordx_tree.visible = false;
		
		domain.visible = true;
		domain2.visible = true;
		domain.visible = false;
		domain2.visible = false;
		
		exeDie.visible = true;
		exeDie.visible = false;
					
		xeno_fg.visible = true;
		xeno_floor.visible = true;
		xeno_fg.visible = false;
		xeno_floor.visible = false;
					
		majin_sky.visible = true;
		majin_bush.visible = true;
		majin_pillars2.visible = true;
		majin_bush2.visible = true;
		majin_pillars1.visible = true;
		majin_floor.visible = true;
		majin_fgmajin.visible = true;
		majin_fgmajin2.visible = true;
		majin_sky.visible = false;
		majin_bush.visible = false;
		majin_pillars2.visible = false;
		majin_bush2.visible = false;
		majin_pillars1.visible = false;
		majin_floor.visible = false;
		majin_fgmajin.visible = false;
		majin_fgmajin2.visible = false;
			
		sunky_bg.visible = true;
		sunky_milk.visible = true;
		sunky_cereal.visible = true;
		sunky_speakers.visible = true;
		sunky_balls.visible = true;
		sunky_stage.visible = true;
		sunky_bg.visible = false;
		sunky_milk.visible = false;
		sunky_cereal.visible = false;
		sunky_speakers.visible = false;
		sunky_balls.visible = false;
		sunky_stage.visible = false;
		
		sanic_bg.visible = true;
		sanic_bg.visible = false;
		
		coldsteel_whiteFuck.visible = true;
		coldsteel_shadow.visible = true;
		guitar.visible = true;
		coldsteel_whiteFuck.visible = false;
		coldsteel_shadow.visible = false;
		guitar.visible = false;
		
		faker_sky.visible = true;
		faker_eclipse.visible = true;
		faker_moutains.visible = true;
		faker_rings.visible = true;
		faker_bg.visible = true;
		faker_sky.visible = false;
		faker_eclipse.visible = false;
		faker_moutains.visible = false;
		faker_rings.visible = false;
		faker_bg.visible = false;
		
		hogBg.visible = true;
		hogMotain.visible = true;
		hogWaterFalls.visible = true;
		hogFloor.visible = true;
		hogLoops.visible = true;
		hogTrees.visible = true;
		hogRocks.visible = true;
		hogOverlay.visible = true;
		hogBg.visible = false;
		hogMotain.visible = false;
		hogWaterFalls.visible = false;
		hogFloor.visible = false;
		hogLoops.visible = false;
		hogTrees.visible = false;
		hogRocks.visible = false;
		hogOverlay.visible = false;
		
		faker_sky2.visible = true;
		faker_eclipse2.visible = true;
		faker_moutains2.visible = true;
		faker_rings2.visible = true;
		faker_bg2.visible = true;
		faker_overlay.visible = true;
		faker_sky2.visible = false;
		faker_eclipse2.visible = false;
		faker_moutains2.visible = false;
		faker_rings2.visible = false;
		faker_bg2.visible = false;
		faker_overlay.visible = false;
		
		scorchedBg.visible = true;
		scorchedMotain.visible = true;
		scorchedWaterFalls.visible = true;
		scorchedFloor.visible = true;
		scorchedMonitor.visible = true;
		scorchedHills.visible = true;
		scorchedTrees.visible = true;
		scorchedRocks.visible = true;
		scorchedBg.visible = false;
		scorchedMotain.visible = false;
		scorchedWaterFalls.visible = false;
		scorchedFloor.visible = false;
		scorchedMonitor.visible = false;
		scorchedHills.visible = false;
		scorchedTrees.visible = false;
		scorchedRocks.visible = false;
		
		vignette.visible = true;
		vignette.visible = false;
		
		if (theThing == 3) {
			trace("The thing done thrice");
			tailsdoll_floor.visible = true;
			ring.visible = true;
			fleetwaybgshit.visible = true;
			emeraldbeamyellow.visible = true;
			emeralds.visible = true;
			thechamber.visible = true;
		}
		
		if (theThing == 2) {
			theThing = 3;
			doTheThing();
			trace("The thing done twice");
		}
		
		if (theThing == 1) {
			theThing = 2;
			doTheThing();
			trace("The thing done once");
		}
	}
	
	override function stepHit()
	{
		if(curStep % 32 == 0 && scorchedMonitor != null && scorchedMonitor.visible && scorchedMonitor.alive) {
			monitorCounter++;
			if(monitorCounter >= monitorAnims.length)monitorCounter=0;
			scorchedMonitor.animation.play(monitorAnims[monitorCounter], true);
		}
		switch(curStep)
		{
			case 1:
				doTheThing();

			case 7990: //coldsteel guitar
				guitar.visible = true;
				FlxTween.tween(guitar, {y: 200}, 0.48, {ease: FlxEase.cubeIn});
				
			case 7994: //Destroy guitar
				guitar.destroy();

			case 9072: //Destroy Exe flash shit
				exeDie.destroy();
		
			case 10321: //Destroy Tailsdoll
				tailsdoll_floor.destroy();
				majin_bush2.visible = true;
				majin_bush.visible = true;
				majin_floor.visible = true;
				majin_pillars1.visible = true;
				majin_pillars2.visible = true;
				majin_fgmajin.visible = true;
				majin_fgmajin2.visible = true;
				satanos_sky.visible = true;
				satanos_trees.visible = true;
				satanos_floor.visible = true;
				satanos_rock.visible = true;
				lordx_sky.visible = true;
				lordx_floor.visible = true;
				lordx_eyeflower.visible = true;
				lordx_notknuckles.visible = true;
				lordx_bfsmallflower.visible = true;
				lordx_tree.visible = true;
				sunky_bg.visible = true;
				sunky_milk.visible = true;
				sunky_cereal.visible = true;
				sunky_speakers.visible = true;
				sunky_balls.visible = true;
				sunky_stage.visible = true;
				sanic_bg.visible = true;
				knuckles_bg.visible = true;
				knuckles_city2.visible = true;
				knuckles_floor.visible = true;
				
			case 10417: //Destroy Xterion
				xterion_floor.destroy();
			
			case 10545: //Destroy Needlemouse
				needleMoutains.destroy();
				needleBuildings.destroy();
				conkCreet.destroy();
				needleFg.destroy();
			
			case 10673: //Destroy Tails soul
				tails_sky.destroy();
				tails_fg.destroy();
				tails_trees1.destroy();
				tails_trees2.destroy();
				tails_floor.destroy();
				
			case 10929: //Destroy Fleetway
				fleetwaybgshit.destroy();
				emeraldbeamyellow.destroy();
				emeralds.destroy();
				thechamber.destroy();
			
			case 11057: //Destroy Chaotix/Wechidna
				fucklesBeats = false;
				fucklesBGPixel.destroy();
				fucklesFGPixel.destroy();
				fucklesAmyBg.destroy();
				fucklesCharmyBg.destroy();
				fucklesMightyBg.destroy();
				fucklesEspioBg.destroy();
				fucklesKnuxBg.destroy();
				fucklesVectorBg.destroy();		
				wechidna_sky.destroy();
				wechidna_building1.destroy();
				wechidna_building2.destroy();
				wechidna_floor.destroy();
				wechidna_treesFG.destroy();
				wechidna_thingFG.destroy();
				wechidna_grassFG.destroy();
				
			case 11185: //Destroy Knuckles/YCR
				knuckles_bg.destroy();
				knuckles_city2.destroy();
				knuckles_floor.destroy();
				
			case 11249: //Destroy Satanos
				satanos_sky.destroy();
				satanos_trees.destroy();
				satanos_floor.destroy();
				satanos_rock.destroy();
				
			case 11585: //Destroy Sonic.exe
				sonic_bg.destroy();
				sonic_ground.destroy();

			case 12248: //Destroy Xeno
				xeno_fg.destroy();
				xeno_floor.destroy();
				
			case 11601: //Destroy Fatal
				domain.destroy();
				domain2.destroy();
				
			case 11617: //Destroy LordX
				lordx_sky.destroy();
				lordx_floor.destroy();
				lordx_eyeflower.destroy();
				lordx_notknuckles.destroy();
				lordx_bfsmallflower.destroy();
				lordx_tree.destroy();
				
			case 11697: //Destroy Majin
				majin_bush2.destroy();
				majin_bush.destroy();
				majin_floor.destroy();
				majin_pillars1.destroy();
				majin_pillars2.destroy();
				majin_fgmajin.destroy();
				majin_fgmajin2.destroy();
				
			case 11729: //Destroy Sunky
				sunkyMoment = false;
				sunky_bg.destroy();
				sunky_milk.destroy();
				sunky_cereal.destroy();
				sunky_speakers.destroy();
				sunky_balls.destroy();
				sunky_stage.destroy();
				
			case 11825: //Destroy Sanic
				sanic_bg.destroy();
				
			case 11953: //Destroy Coldsteel
				coldsteel_whiteFuck.destroy();
				coldsteel_shadow.destroy();
				
			case 12081: //Destroy Faker/Exe/Hog
				faker_sky2.destroy();
				faker_eclipse2.destroy();
				faker_moutains2.destroy();
				faker_rings2.destroy();
				faker_bg2.destroy();
				faker_overlay.destroy();
				hogBg.destroy();
				hogMotain.destroy();
				hogWaterFalls.destroy();
				hogLoops.destroy();
				hogTrees.destroy();
				hogFloor.destroy();
				hogRocks.destroy();
				hogOverlay.destroy();
				faker_sky.destroy();
				faker_eclipse.destroy();
				faker_moutains.destroy();
				faker_rings.destroy();
				faker_bg.destroy();
				
			case 12225: //Destroy Scorched
				scorchedBg.visible = false;
				scorchedMotain.visible = false;
				scorchedWaterFalls.visible = false;
				scorchedFloor.visible = false;
				scorchedMonitor.visible = false;
				scorchedHills.visible = false;
				scorchedTrees.visible = false;
				scorchedRocks.visible = false;
				scorchedBg.destroy();
				scorchedMotain.destroy();
				scorchedWaterFalls.destroy();
				scorchedFloor.destroy();
				scorchedMonitor.destroy();
				scorchedHills.destroy();
				scorchedTrees.destroy();
				scorchedRocks.destroy();
				
			case 7160:
				sunkyTransition.visible = true;
				sunkyTransition.animation.play('b', true);
			
			case 7169:
				sunkyTransition.destroy();
				
			case 12228:
				FlxTween.tween(xeno_fg, {alpha: 0}, 0.87, {ease: FlxEase.linear});
				FlxTween.tween(xeno_floor, {alpha: 0}, 0.87, {ease: FlxEase.linear});

			case 12788:
				circle.visible = false;
				circle.destroy();

			case 6624:
				daJumpscare.alpha = 1;
				daJumpscare.animation.play('jump',true);
		}
	}
	
	public function redRingTransition()
	{
		if (!ringStarted) {
			ringStarted = true;
			ring.alpha = 1;
			ring.animation.play('anim');
			new FlxTimer().start(0.2, function(tmr:FlxTimer)
			{
				ring.alpha = 0.00001;
				ring.animation.play('idle');
				trace('ring finished');
				ringStarted = false;
			});
		}
	}
	
	override function beatHit()
	{
		if (phillyGlow) {
			vignette.alpha = 1;
			FlxTween.tween(vignette, {alpha: 0}, 0.28, {ease: FlxEase.linear});
		}
		if (sunkyMoment) {
			sunky_speakers.animation.play('idle');
		}
		if (curBeat % 1 == 0 && sunkyMoment) {
			sunky_cereal.angle = -50;
			sunky_milk.angle = 45;
		}
		if (curBeat % 2 == 0 && sunkyMoment) {
			sunky_cereal.angle = 30;
			sunky_milk.angle = -25;
		}
	}

	override function eventPushed(event:objects.Note.EventNote)
	{
		switch(event.event)
		{
			case "Philly Glow":
				blammedLightsBlack = new FlxSprite(FlxG.width * -0.5, FlxG.height * -0.5).makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), FlxColor.BLACK);
				blammedLightsBlack.visible = false;
				insert(members.indexOf(coldsteel_whiteFuck), blammedLightsBlack);

				phillyGlowGradient = new PhillyGlowGradient(-400, 225); //This shit was refusing to properly load FlxGradient so fuck it
				phillyGlowGradient.visible = false;
				insert(members.indexOf(blammedLightsBlack) + 1, phillyGlowGradient);
				if(!ClientPrefs.data.flashing) phillyGlowGradient.intendedAlpha = 0.7;
				phillyGlowGradient.alpha = 0;

				Paths.image('philly/particle'); //precache philly glow particle image
				phillyGlowParticles = new FlxTypedGroup<PhillyGlowParticle>();
				phillyGlowParticles.visible = false;
				insert(members.indexOf(phillyGlowGradient) + 1, phillyGlowParticles);
		}
	}
	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
	{
		switch(eventName)
		{
			case "Philly Glow":
				if(flValue1 == null || flValue1 <= 0) flValue1 = 0;
				var lightId:Int = Math.round(flValue1);

					var chars:Array<Character> = [boyfriend, gf, dad];
				switch(lightId)
				{
					case 0:
						phillyGlow = false;
						
						coldsteel_whiteFuck.visible = true;
						coldsteel_shadow.visible = true;
						
						if(phillyGlowGradient.visible)
						{
							doFlash();
							if(ClientPrefs.data.camZooms)
							{
								FlxG.camera.zoom += 0.5;
								camHUD.zoom += 0.1;
							}

							blammedLightsBlack.visible = false;
							phillyGlowGradient.visible = false;
							phillyGlowParticles.visible = false;
							vignette.visible = false;
							curLightEvent = -1;

							for (who in chars)
							{
								who.color = FlxColor.WHITE;
							}
						}

					case 1: //turn on
						phillyGlow = true;
						curLightEvent = FlxG.random.int(0, phillyLightsColors.length-1, [curLightEvent]);
						var color:FlxColor = phillyLightsColors[curLightEvent];

						coldsteel_whiteFuck.visible = false;
						coldsteel_shadow.visible = false;
						
						if(!phillyGlowGradient.visible)
						{
							doFlash();
							if(ClientPrefs.data.camZooms)
							{
								FlxG.camera.zoom += 0.5;
								camHUD.zoom += 0.1;
							}

							blammedLightsBlack.visible = true;
							blammedLightsBlack.alpha = 1;
							phillyGlowGradient.visible = true;
							phillyGlowParticles.visible = true;
							vignette.visible = true;
						}
						else if(ClientPrefs.data.flashing)
						{
							var colorButLower:FlxColor = color;
							colorButLower.alphaFloat = 0.25;
							FlxG.camera.flash(colorButLower, 0.5, null, true);
						}

							var charColor:FlxColor = color;
						if(!ClientPrefs.data.flashing) charColor.saturation *= 0.5;
						else charColor.saturation *= 0.75;

						for (who in chars)
						{
							who.color = charColor;
						}
						phillyGlowParticles.forEachAlive(function(particle:PhillyGlowParticle)
						{
							particle.color = color;
						});
						phillyGlowGradient.color = color;
						vignette.color = color;

						color.brightness *= 0.5;

					case 2: // spawn particles
						phillyGlow = true;
						if(!ClientPrefs.data.lowQuality)
						{
							var particlesNum:Int = FlxG.random.int(8, 12);
							var width:Float = (2000 / particlesNum);
							var color:FlxColor = phillyLightsColors[curLightEvent];
							for (j in 0...3)
							{
								for (i in 0...particlesNum)
								{
									var particle:PhillyGlowParticle = new PhillyGlowParticle(-400 + width * i + FlxG.random.float(-width / 5, width / 5), phillyGlowGradient.originalY + 200 + (FlxG.random.float(0, 125) + j * 40), color);
									phillyGlowParticles.add(particle);
								}
							}
						}
						phillyGlowGradient.bop();
				}
		}
	}

	function doFlash()
	{
		var color:FlxColor = FlxColor.WHITE;
		if(!ClientPrefs.data.flashing) color.alphaFloat = 0.5;

		FlxG.camera.flash(color, 0.15, null, true);
	}
}