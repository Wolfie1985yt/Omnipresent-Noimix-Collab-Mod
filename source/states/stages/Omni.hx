package states.stages;

import states.stages.objects.*;
import flixel.graphics.frames.FlxAtlasFrames;

class Omni extends BaseStage
{
	// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming

	var tailsdoll_floor:FlxSprite;
	
	var xterion_floor:FlxSprite;
	
	var needleSky:BGSprite;
	var needleMoutains:BGSprite;
	var needleRuins:BGSprite;
	var needleBuildings:BGSprite;
	var conkCreet:BGSprite;
	var needleFg:FlxSprite;
	
	var tails_sky:FlxSprite;
	var tails_fg:FlxSprite;
	var tails_trees1:FlxSprite;
	var tails_trees2:FlxSprite;
	var tails_grass:FlxSprite;
	var tails_floor:FlxSprite;
	
	var wall:FlxSprite;
	var floor:FlxSprite;
	var fleetwaybgshit:FlxSprite;
	var emeraldbeamyellow:FlxSprite;
	var emeralds:FlxSprite;
	var thechamber:FlxSprite;
	var pebles:FlxSprite;
	var chamberFront:FlxSprite;

	public function preload(graphic:String) {
        var newthing:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image(graphic, 'shared'));
        newthing.visible = false;
        add(newthing);
        remove(newthing);
    }

	override function create()
	{
		tailsdoll_floor = new FlxSprite(-700, -100);
		tailsdoll_floor.loadGraphic(Paths.image('bgs/tails-doll/bg'));
		tailsdoll_floor.scrollFactor.set(1, 1);
		tailsdoll_floor.scale.set(1.1, 1.1);
		tailsdoll_floor.antialiasing = true;
		tailsdoll_floor.visible = true;
		add(tailsdoll_floor);
		
		xterion_floor = new FlxSprite(-400, 100);
		xterion_floor.frames = Paths.getSparrowAtlas("bgs/digitalized/bg");
		xterion_floor.animation.addByPrefix('idle', 'static', 12, true);
		xterion_floor.animation.play('idle');
		xterion_floor.antialiasing = ClientPrefs.data.antialiasing;
		xterion_floor.visible = false;
		add(xterion_floor);

		needleSky = new BGSprite('bgs/needlemouse/sky', -725, -200, 0.7, 0.9);
		needleSky.visible = false;
		add(needleSky);
		
		needleMoutains = new BGSprite('bgs/needlemouse/mountains', -700, -175, 0.8, 0.9);
		needleMoutains.setGraphicSize(Std.int(needleMoutains.width * 1.1));
		needleMoutains.visible = false;
		add(needleMoutains);
			
		needleRuins = new BGSprite('bgs/needlemouse/ruins', -775, -310, 1, 0.9);
		needleRuins.setGraphicSize(Std.int(needleRuins.width * 1.4));
		needleRuins.visible = false;
		add(needleRuins);

		needleBuildings = new BGSprite('bgs/needlemouse/buildings', -1000, -100, 1, 0.9);
		needleBuildings.visible = false;
		add(needleBuildings);

		conkCreet = new BGSprite('bgs/needlemouse/CONK_CREET', -775, -310, 1, 0.9);
		conkCreet.setGraphicSize(Std.int(conkCreet.width * 1.4));
		conkCreet.visible = false;
		add(conkCreet);

		tails_sky = new FlxSprite(-450, -1000);
		tails_sky.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_sky'));
		tails_sky.scrollFactor.set(1, 1);
		tails_sky.scale.set(1.2, 1.2);
		tails_sky.antialiasing = true;
		tails_sky.visible = false;
		add(tails_sky);
		
		tails_trees1 = new FlxSprite(-500, -800);
		tails_trees1.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_trees1'));
		tails_trees1.scrollFactor.set(0.8, 0.9);
		tails_trees1.scale.set(0.95, 0.95);
		tails_trees1.antialiasing = true;
		tails_trees1.visible = false;
		add(tails_trees1);
		
		tails_grass = new FlxSprite(-500, -900);
		tails_grass.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_grass2'));
		tails_grass.scrollFactor.set(0.85, 0.9);
		tails_grass.scale.set(0.95, 0.95);
		tails_grass.antialiasing = true;
		tails_grass.visible = false;
		add(tails_grass);
		
		tails_trees2 = new FlxSprite(-500, -800);
		tails_trees2.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_trees2'));
		tails_trees2.scrollFactor.set(0.9, 1);
		tails_trees2.scale.set(0.95, 0.95);
		tails_trees2.antialiasing = true;
		tails_trees2.visible = false;
		add(tails_trees2);
		
		tails_floor = new FlxSprite(-550, -900);
		tails_floor.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_floor'));
		tails_floor.scrollFactor.set(1, 1);
		tails_floor.scale.set(0.95, 0.95);
		tails_floor.antialiasing = true;
		tails_floor.visible = false;
		add(tails_floor);

		wall = new FlxSprite(-2379.05, -1211.1);
		wall.frames = Paths.getSparrowAtlas('bgs/Chamber/Wall');
		wall.animation.addByPrefix('a', 'Wall instance 1');
		wall.animation.play('a');
		wall.antialiasing = true;
		wall.scrollFactor.set(1.1, 1.1);
		wall.visible = false;
		add(wall);

		floor = new FlxSprite(-2349, 1000);
		floor.antialiasing = true;
		floor.frames = Paths.getSparrowAtlas('bgs/Chamber/Floor');
		floor.animation.addByPrefix('b', 'floor yellow');
		floor.setGraphicSize(Std.int(floor.width * 1.15));
		floor.animation.play('b', true);
		floor.scrollFactor.set(1.1, 1);
		floor.antialiasing = true;
		floor.visible = false;
		add(floor);

		fleetwaybgshit = new FlxSprite(-2629.05, -1344.05);
		fleetwaybgshit.frames = Paths.getSparrowAtlas('bgs/Chamber/FleetwayBGshit');
		fleetwaybgshit.animation.addByPrefix('b', 'BGyellow');
		fleetwaybgshit.animation.play('b', true);
		fleetwaybgshit.antialiasing = true;
		fleetwaybgshit.scrollFactor.set(1.1, 1);
		fleetwaybgshit.visible = false;
		add(fleetwaybgshit);
				
		emeraldbeamyellow = new FlxSprite(-300, -1376.95 - 200);
		emeraldbeamyellow.antialiasing = true;
		emeraldbeamyellow.frames = Paths.getSparrowAtlas('bgs/Chamber/Emerald Beam Charged');
		emeraldbeamyellow.animation.addByPrefix('a', 'Emerald Beam Charged instance 1', 24, true);
		emeraldbeamyellow.animation.play('a');
		emeraldbeamyellow.scrollFactor.set(1.1, 1);
		emeraldbeamyellow.visible = false;
		add(emeraldbeamyellow);

		emeralds = new FlxSprite(326.6, -191.75);
		emeralds.antialiasing = true;
		emeralds.frames = Paths.getSparrowAtlas('bgs/Chamber/Emeralds');
		emeralds.animation.addByPrefix('a', 'TheEmeralds instance 1', 24, true);
		emeralds.animation.play('a');
		emeralds.scrollFactor.set(1.1, 1);
		emeralds.antialiasing = true;
		emeralds.visible = false;
		add(emeralds);
				
		thechamber = new FlxSprite(-225.05, 463.9);
		thechamber.frames = Paths.getSparrowAtlas('bgs/Chamber/The Chamber');
		thechamber.animation.addByIndices('b', 'Chamber Sonic Fall', [25], "", 24, false);
		thechamber.scrollFactor.set(1.1, 1);
		thechamber.antialiasing = true;
		thechamber.visible = false;
		thechamber.animation.play('b');
		add(thechamber);

		pebles = new FlxSprite(-562.15 + 100, 1043.3);
		pebles.frames = Paths.getSparrowAtlas('bgs/Chamber/pebles');
		pebles.animation.addByPrefix('b', 'pebles instance 1', 24, false);
		pebles.animation.play('b', true);
		pebles.scrollFactor.set(1.1, 1);
		pebles.antialiasing = true;
		pebles.visible = false;
		add(pebles);

		//Characters
		preload('characters/TailsDoll/3D/Tails_Doll');
		preload('characters/BF/3D/bf-3d');
		preload('characters/BF/HD/Death/BF_exe_death');
		preload('characters/BF/HD/bf-sunkeh');
		preload('characters/BF/HD/BOYFRIEND');
		preload('characters/BF/HD/endless_bf');
		preload('characters/BF/HD/needle-bf');
		preload('characters/BF/HD/Sonic');
		preload('characters/BF/Pixel/BF');
		preload('characters/BF/Pixel/chaotix_bf');
		preload('characters/BF/Pixel/fatal-bf');
		preload('characters/ChotixXenotixAndChaotix/Pixel/faker_chaotix');
		preload('characters/ChotixXenotixAndChaotix/Pixel/updated_Beast');
		preload('bgs/Chamber/FleetwayBGshit');
		preload('characters/Coldsteel/coldsteel');
		preload('characters/Eggman/eggman-encore');
		preload('characters/FakerAndExe/faker_encore');
		preload('characters/FakerAndExe/faker-exe-encore');
		preload('characters/FatalAndCritical/fatal-error-sonic');
		preload('characters/FatalAndCritical/fatal-error-sonic-glitched');
		preload('characters/Fleetway/Fleetway_Super_Sonic');
		preload('characters/Fleetway/fleetway1');
		preload('characters/Fleetway/fleetway2');
		preload('characters/Fleetway/fleetway4');
		preload('characters/HogAndScorched/Hog');
		preload('characters/HogAndScorched/scorched');
		preload('characters/Knuckles/knux-encore');
		preload('characters/LordX/lordxEncore');
		preload('characters/Majin/SonicFunAssets');
		preload('characters/NeedlemouseSarahShadowmouseLutherSunter/Needlemouse');
		preload('characters/Sanic/sanic');
		preload('characters/Satanos/Satanos');
		preload('characters/Sunky/Sunky');
		preload('characters/Tails/tails-encore');
		preload('characters/XenoAndGrimbo/HD/Beast');
		preload('characters/XenoAndGrimbo/HD/sonicexe');
		preload('characters/XenoAndGrimbo/HD/YCR-Mad-Cherribun');
		preload('characters/XenoAndGrimbo/Pixel/Sonic_EXE_Pixel');
		preload('characters/XTerion/3D/xterion-first');
		
		//Other
		preload('noteSplashes/noteSplashes');
		preload('ready');
		preload('set');
		preload('go');
		preload('sick');
		preload('good');
		preload('bad');
		preload('shit');
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
		preload('combo');
	}
	
	override function createPost()
	{
		needleFg = new FlxSprite(-690, -80).loadGraphic(Paths.image('bgs/needlemouse/fg'));
		needleFg.setGraphicSize(Std.int(needleFg.width * 1.1));
		needleFg.scrollFactor.set(1, 0.9);
		needleFg.visible = false;
		add(needleFg);
		
		tails_fg = new FlxSprite(-600, -1000);
		tails_fg.loadGraphic(Paths.image('bgs/triple-trouble-encore/tails/ts_fg'));
		tails_fg.scrollFactor.set(0.7, 0.9);
		tails_fg.scale.set(0.95, 0.95);
		tails_fg.antialiasing = true;
		tails_fg.visible = false;
		add(tails_fg);
	}

	override function update(elapsed:Float)
	{
		// Code here
	}

	// Steps, Beats and Sections:
	//    curStep, curDecStep
	//    curBeat, curDecBeat
	//    curSection
	override function stepHit()
	{
		switch (curStep)
		{
			case 136, 400, 592, 848, 944: //xterion
				tailsdoll_floor.visible = false;
				xterion_floor.visible = true;
			
			case 272, 528, 656, 912: //tailsdoll
				tailsdoll_floor.visible = true;
				xterion_floor.visible = false;
			
			case 1040, 1296, 1552, 1808: //needlemouse
				xterion_floor.visible = false;
				tails_sky.visible = false;
				tails_fg.visible = false;
				tails_trees1.visible = false;
				tails_trees2.visible = false;
				tails_grass.visible = false;
				tails_floor.visible = false;
				needleSky.visible = true;
				needleMoutains.visible = true;
				needleRuins.visible = true;
				needleBuildings.visible = true;
				conkCreet.visible = true;
				needleFg.visible = true;
				boyfriend.setGraphicSize(Std.int(boyfriend.width * 0.9));
				
			case 1168, 1424, 1680, 1936: //tails
				boyfriend.setGraphicSize(Std.int(boyfriend.width * 1));
				tails_sky.visible = true;
				tails_fg.visible = true;
				tails_trees1.visible = true;
				tails_trees2.visible = true;
				tails_grass.visible = true;
				tails_floor.visible = true;
				needleSky.visible = false;
				needleMoutains.visible = false;
				needleRuins.visible = false;
				needleBuildings.visible = false;
				conkCreet.visible = false;
				needleFg.visible = false;
				
			case 2064:
				wall.visible = true;
				floor.visible = true;
				fleetwaybgshit.visible = true;
				emeraldbeamyellow.visible = true;
				emeralds.visible = true;
				thechamber.visible = true;
				pebles.visible = true;
				tails_sky.visible = false;
				tails_fg.visible = false;
				tails_trees1.visible = false;
				tails_trees2.visible = false;
				tails_grass.visible = false;
				tails_floor.visible = false;
		}
	}
	override function beatHit()
	{
		// Code here
	}
	override function sectionHit()
	{
		// Code here
	}

	// Substates for pausing/resuming tweens and timers
	override function closeSubState()
	{
		if(paused)
		{
			//timer.active = true;
			//tween.active = true;
		}
	}

	override function openSubState(SubState:flixel.FlxSubState)
	{
		if(paused)
		{
			//timer.active = false;
			//tween.active = false;
		}
	}

	// For events
	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
	{
		switch(eventName)
		{
			case "My Event":
		}
	}
	override function eventPushed(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events that doesn't need different assets based on its values
		switch(event.event)
		{
			case "My Event":
				//precacheImage('myImage') //preloads images/myImage.png
				//precacheSound('mySound') //preloads sounds/mySound.ogg
				//precacheMusic('myMusic') //preloads music/myMusic.ogg
		}
	}
	override function eventPushedUnique(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events where its values affect what assets should be preloaded
		switch(event.event)
		{
			case "My Event":
				switch(event.value1)
				{
					// If value 1 is "blah blah", it will preload these assets:
					case 'blah blah':
						//precacheImage('myImageOne') //preloads images/myImageOne.png
						//precacheSound('mySoundOne') //preloads sounds/mySoundOne.ogg
						//precacheMusic('myMusicOne') //preloads music/myMusicOne.ogg

					// If value 1 is "coolswag", it will preload these assets:
					case 'coolswag':
						//precacheImage('myImageTwo') //preloads images/myImageTwo.png
						//precacheSound('mySoundTwo') //preloads sounds/mySoundTwo.ogg
						//precacheMusic('myMusicTwo') //preloads music/myMusicTwo.ogg
					
					// If value 1 is not "blah blah" or "coolswag", it will preload these assets:
					default:
						//precacheImage('myImageThree') //preloads images/myImageThree.png
						//precacheSound('mySoundThree') //preloads sounds/mySoundThree.ogg
						//precacheMusic('myMusicThree') //preloads music/myMusicThree.ogg
				}
		}
	}
}