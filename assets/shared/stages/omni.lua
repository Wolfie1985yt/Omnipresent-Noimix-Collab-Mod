local xx = 600;
local yy = 380;
local ofs = 20;
local ofs2 = 20;
local xx2 = 900;
local yy2 = 480;
local xx3 = 0;
local yy3 = 0;
local forceCamera = true;
local wechBeastMoment = false;
local satanosMoment = false;
local fatalMoment = false;
local exeMoment = false;
local scorchedMoment = false;
local preload = false;
local finalMoment = false;
local fakerpixelMoment = false;
local traceBF = true;
local traceDad = true;
local fleetwayMoment = false;
local gfMoment = true;
local timeColor = 'FFFFFF';
local loading = false;
local vgspeed = 0;
local color = 'FFFFFF';
local stop = true;
local stop2 = true;
local beat = 0;
local color2 = 'FFFFFF';
local fps = 0;
local framecount = 39;
local HudPieces = {''};
local index = 1;
local hasSpawned = false;
local hasSpawned2 = false;

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end

local gfRows = {}
local bfRows = {}
local ddRows = {}
local mmRows = {}

function onCreate()
	if getPropertyFromClass('backend.ClientPrefs', 'data.lowQuality') == false and getPropertyFromClass('backend.ClientPrefs','potatoMode') == false then
		makeLuaSprite('eggman_bg', 'bgs/triple-trouble-encore/eggman/egg_bg', -1000, -1000);
		scaleObject('eggman_bg', 1.5, 1.5);
		setScrollFactor('eggman_bg', 1, 1);
		setProperty('eggman_bg.antialiasing', true);
		setProperty('eggman_bg.visible', false);
		addLuaSprite('eggman_bg', false);
	
		makeLuaSprite('eggman_eys', 'bgs/triple-trouble-encore/eggman/egg_eys', -1000, -1000);
		scaleObject('eggman_eys', 1.5, 1.5);
		setScrollFactor('eggman_eys', 1, 1);
		setProperty('eggman_eys.antialiasing', true);
		setProperty('eggman_eys.visible', false);
		addLuaSprite('eggman_eys', false);
	elseif getPropertyFromClass('backend.ClientPrefs','potatoMode') == false then
		makeLuaSprite('eggman_bg', 'bgs/triple-trouble-encore/eggman/eggbgLowQuality', -1000, -1000);
		scaleObject('eggman_bg', 1.5, 1.5);
		setScrollFactor('eggman_bg', 1, 1);
		setProperty('eggman_bg.antialiasing', true);
		setProperty('eggman_bg.visible', false);
		addLuaSprite('eggman_bg', false);
	
		makeLuaSprite('eggman_eys', 'blank', -1000, -1000);
		scaleObject('eggman_eys', 1.5, 1.5);
		setScrollFactor('eggman_eys', 1, 1);
		setProperty('eggman_eys.antialiasing', true);
		setProperty('eggman_eys.visible', false);
		addLuaSprite('eggman_eys', false);
	end

	if getPropertyFromClass('backend.ClientPrefs','potatoMode') == false then
		addCharacterToList('wechBeast', 'dad');
		addCharacterToList('fleetway', 'dad');
		addCharacterToList('Satanos', 'dad');
		addCharacterToList('lordxEncore', 'dad');
		addCharacterToList('sonicexe', 'dad');
		addCharacterToList('BEAST-Enc', 'dad');
		addCharacterToList('sonic', 'gf');
		addCharacterToList('fleetway-anims3', 'dad');
		addCharacterToList('wechBeast-flipped', 'dad');
		addCharacterToList('wechBeast-flipped', 'gf');
		addCharacterToList('bf-encore', 'bf');
		addCharacterToList('bf-encore-black', 'bf');
		addCharacterToList('bf-encore-red', 'bf');
		addCharacterToList('Eggman-Encore', 'dad');
	end
	
	precacheMusic('tea-time');
	precacheSound('unpause');
	precacheSound('pause');

    makeLuaSprite('whitebg', '', -2000, -1000)
    setScrollFactor('whitebg', 0, 0)
    makeGraphic('whitebg', 3920, 3080, value2)
	setProperty('whitebg.alpha',0.00001);
	
	makeLuaSprite('VG2', 'WhiteVG', 0, 0);
	setScrollFactor('VG2', 0, 0);
	screenCenter('VG2');
	addLuaSprite('VG2', false);
	screenCenter('VG2');
	setObjectCamera('VG2', 'camOther');
	setProperty('VG2.alpha', 0.00001);

	makeLuaSprite('VG3', 'WhiteVG', 0, 0);
	setScrollFactor('VG3', 0, 0);
	screenCenter('VG3');
	addLuaSprite('VG3', false);
	screenCenter('VG3');
	setObjectCamera('VG3', 'camOther');
	setProperty('VG3.alpha', 0.00001);

	makeLuaSprite('flashingshit', '', 0, 0);
	makeGraphic('flashingshit',1920,1080,'000000')
	addLuaSprite('flashingshit', false);
	setLuaSpriteScrollFactor('flashingshit',0,0)
	setProperty('flashingshit.scale.x',2)
	setProperty('flashingshit.scale.y',2)
	setProperty('flashingshit.alpha',0)
	setObjectCamera('flashingshit', 'camHUD')
	
	makeLuaSprite('flashingshit3', '', 0, 0);
	makeGraphic('flashingshit3',1920,1080,'FFFFFF')
	addLuaSprite('flashingshit3', false);
	setLuaSpriteScrollFactor('flashingshit3',0,0)
	setProperty('flashingshit3.scale.x',2)
	setProperty('flashingshit3.scale.y',2)
	setProperty('flashingshit3.alpha',0.0000001)
	setObjectCamera('flashingshit3', 'camOther')

	makeLuaSprite('flashingshit2', '', 0, 0);
	makeGraphic('flashingshit2',1920,1080,'000000')
	addLuaSprite('flashingshit2', false);
	setLuaSpriteScrollFactor('flashingshit2',0,0)
	setProperty('flashingshit2.scale.x',2)
	setProperty('flashingshit2.scale.y',2)
	setProperty('flashingshit2.alpha',0)
	setObjectCamera('flashingshit2', 'camOther')

	precacheSong('omnipresent/Inst');
	precacheSong('omnipresent/Voices-Opponent');
	precacheSong('omnipresent/Voices-Player');

	if getPropertyFromClass('backend.ClientPrefs','potatoMode') == false then
		makeLuaSprite('faker_pixel', 'bgs/faker-encore/fakerpixel', 0, 0);
		scaleObject('faker_pixel', 1, 1);
		setScrollFactor('faker_pixel', 1, 1);
		setProperty('faker_pixel.antialiasing', false);
		setProperty('faker_pixel.visible', false);
		addLuaSprite('faker_pixel', false);
	end
	
	if getPropertyFromClass('backend.ClientPrefs', 'data.lowQuality') == false and getPropertyFromClass('backend.ClientPrefs','potatoMode') == false then
		makeLuaSprite('simplejump', 'epicjump', 0, 0);
		setScrollFactor('simplejump', 0, 0);
		setGraphicSize('simplejump',screenWidth,screenHeight);
		setProperty('simplejump.antialiasing', true);
		setProperty('simplejump.visible', false);
		setObjectCamera('simplejump','camHUD');
		screenCenter('simplejump');
		addLuaSprite('simplejump', false);
	elseif getPropertyFromClass('backend.ClientPrefs','potatoMode') == false then
		makeLuaSprite('simplejump', 'blank', 0, 0);
		setScrollFactor('simplejump', 0, 0);
		setGraphicSize('simplejump',screenWidth,screenHeight);
		setProperty('simplejump.antialiasing', true);
		setProperty('simplejump.visible', false);
		setObjectCamera('simplejump','camHUD');
		screenCenter('simplejump');
		addLuaSprite('simplejump', false);
	end
	
	if getPropertyFromClass('states.PlayState','chartingMode') == false then
		makeLuaSprite('black', '', 0, 0);
		makeGraphic('black',1920,1080,'000000')
		addLuaSprite('black');
		setLuaSpriteScrollFactor('black',0,0)
		setProperty('black.scale.x',2)
		setProperty('black.scale.y',2)
		setProperty('black.alpha',1)
		setObjectCamera('black', 'other')
	
		runTimer('start', 0.5)
		runTimer('bye', 1.9)
	
		makeLuaSprite('text', 'StartScreens/Text2-omnipresent', 0, 0)
		setObjectCamera('text', 'other')
		scaleObject('text', 1, 1)
		setProperty('text.alpha',0)
		addLuaSprite('text')
		
		makeLuaSprite('red', '', 0, 0);
		makeGraphic('red',1920,1080,'FF0000')
		addLuaSprite('red');
		setLuaSpriteScrollFactor('red',0,0)
		setProperty('red.scale.x',2)
		setProperty('red.scale.y',2)
		setProperty('red.alpha',0)
		setObjectCamera('red', 'other')
		
		makeLuaSprite('white', '', 0, 0);
		makeGraphic('white',1920,1080,'FFFFFF')
		addLuaSprite('white');
		setLuaSpriteScrollFactor('white',0,0)
		setProperty('white.scale.x',2)
		setProperty('white.scale.y',2)
		setProperty('white.alpha',0)
		setObjectCamera('white', 'other')
	end
	if getPropertyFromClass('states.PlayState','chartingMode') == false then
		makeLuaSprite('flash', '', 0, 0);
		makeGraphic('flash',1920,1080,'FFFFFF')
		addLuaSprite('flash', false);
		setLuaSpriteScrollFactor('flash',0,0)
		setProperty('flash.scale.x',2)
		setProperty('flash.scale.y',2)
		setObjectCamera('flash', 'HUD')
		setProperty('flash.alpha',0);
	end
	if getPropertyFromClass('states.PlayState','chartingMode') == false then
		makeLuaSprite('flashred', '', 0, 0);
		makeGraphic('flashred',1920,1080,'FF0000')
		addLuaSprite('flashred', false);
		setLuaSpriteScrollFactor('flashred',0,0)
		setProperty('flashred.scale.x',2)
		setProperty('flashred.scale.y',2)
		setObjectCamera('flashred', 'HUD')
		setProperty('flashred.alpha',0);
	end
end
function onCreatePost()
	setProperty('gfGroup.alpha',0.00001);
	setProperty('dadGroup.alpha',0.00001);
	setProperty('boyfriendGroup.alpha',0.00001);
	runTimer('preload',0.1);
	runTimer('preload',0.2);
	runTimer('preload',0.3);
	runTimer('reset-preload',0.4);

	--THE TOP BAR--
	makeLuaSprite('UpperBar', 'blank', -110, -360)
	makeGraphic('UpperBar', 1500, 350, '000000')
	setObjectCamera('UpperBar', 'HUD')
	addLuaSprite('UpperBar', false)

	--THE BOTTOM BAR--
	makeLuaSprite('LowerBar', 'blank', -110, 730)
	makeGraphic('LowerBar', 1500, 350, '000000')
	setObjectCamera('LowerBar', 'HUD')
	addLuaSprite('LowerBar', false)
	
	UpperBar = getProperty('UpperBar.y')
	LowerBar = getProperty('LowerBar.y')
end
function onSongStart()
	triggerEvent('phasestatic', 1.56, 1);
	setProperty('staticstuff.alpha',0);
	if value2 == '' then
		doTweenAlpha('startstatic', 'staticstuff', 0.5, value1, 'linear');
	else
		doTweenAlpha('startstatic', 'staticstuff', value2, value1, 'linear');
	end
	if getPropertyFromClass('states.PlayState','chartingMode') == false then
		doTweenAlpha('startstuff5', 'red', 1, 1.56, 'linear')
	end
	setProperty('gf.alpha',1);
	setProperty('dad.alpha',1);
	setProperty('boyfriend.alpha',1);
	setProperty('defaultCamZoom',0.7);
	setTimeBarColors(string.format('%02x%02x%02x', unpack(getProperty('dad.healthColorArray'))));
end
function onStartCountdown()
    if loading == false and getPropertyFromClass('states.PlayState','chartingMode') == false then
        return Function_Stop
    elseif loading == true and getPropertyFromClass('states.PlayState','chartingMode') == false then
        return Function_Continue
    end
	setProperty('gfGroup.alpha',0.00001);
	setProperty('dadGroup.alpha',0.00001);
	setProperty('boyfriendGroup.alpha',0.00001);
	runTimer('preload',0.1);
	runTimer('preload',0.2);
	runTimer('preload',0.3);
	runTimer('preload',0.4);
	runTimer('preload',0.5);
	runTimer('preload',0.6);
	runTimer('reset-preload',0.7);
end
function onStepHit()
	if stop == true then
		setProperty('VG2.alpha',0);
	end
	if stop2 == true then
		setProperty('VG3.alpha',0);
	end
end
function onUpdate(elapsed)
	if fleetwayMoment == true then
		xx3 = 300;
		yy3 = 400;
	else
		xx3 = xx2;
		yy3 = yy2;
	end
	if curStep >= 12255 then
		setProperty('iconP1.alpha',0);
		setProperty('iconP2.alpha',0);
		setProperty('healthBar.alpha',0);
		setProperty('healthBarBG.alpha',0);
	end
	if curStep == 6607 then
		setProperty('simplejump.visible',true);
		setProperty('simplejump.alpha',0.00001);
		doTweenAlpha('jump1', 'simplejump', 1, 0.38, 'linear');
	end
	if curStep == 6640 then
		removeLuaSprite('simplejump');
	end
	if curStep == 5345 then
		setProperty('simplejump.visible',true);
		setProperty('alpha.visible',0.00001);
	end
	if curStep == 5346 then
		setProperty('simplejump.visible',false);
	end
	if curStep == 3232 then
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
	end
	if curStep == 12496 then
		triggerEvent('Cam Zoom', '2.6', '20.75, easeInOut');
	end
	if curStep == 16 then --wolfie credits
		makeLuaSprite('CreditsBG',nil,-292,200)
		makeGraphic('CreditsBG',252,100,'ffffff')
		setProperty('CreditsBG.alpha',0.4)
		setObjectCamera('CreditsBG','other')
		addLuaSprite('CreditsBG',false)
		Text = 'Part Charted by:\n\n  Wolfie_1985';
		makeLuaText('CreditsTxt',Text,0,getProperty('CreditsBG.x')+12,getProperty('CreditsBG.y')+12)
		setTextAlignment('CreditsTxt','left')
		setTextSize('CreditsTxt',24)
		setObjectCamera('CreditsTxt','other')
		addLuaText('CreditsTxt',true)
	end
	if curStep == 2064 then --charizard credits
		Credits = false;
		makeLuaSprite('CreditsBG',nil,-292,200)
		makeGraphic('CreditsBG',252,100,'ffffff')
		setProperty('CreditsBG.alpha',0.4)
		setObjectCamera('CreditsBG','other')
		addLuaSprite('CreditsBG',false)
		Text = 'Part Charted by:\n\nCharizardslash';
		makeLuaText('CreditsTxt',Text,0,getProperty('CreditsBG.x')+12,getProperty('CreditsBG.y')+12)
		setTextAlignment('CreditsTxt','left')
		setTextSize('CreditsTxt',24)
		setObjectCamera('CreditsTxt','other')
		addLuaText('CreditsTxt',true)
	end
	if curStep == 4256 then --raimbow credits
		Credits = false;
		makeLuaSprite('CreditsBG',nil,-292,200)
		makeGraphic('CreditsBG',252,100,'ffffff')
		setProperty('CreditsBG.alpha',0.4)
		setObjectCamera('CreditsBG','other')
		addLuaSprite('CreditsBG',false)
		Text = 'Part Charted by:\n\n Raimbowcore12';
		makeLuaText('CreditsTxt',Text,0,getProperty('CreditsBG.x')+12,getProperty('CreditsBG.y')+12)
		setTextAlignment('CreditsTxt','left')
		setTextSize('CreditsTxt',24)
		setObjectCamera('CreditsTxt','other')
		addLuaText('CreditsTxt',true)
	end
	if curStep == 6352 then --Mr. Half credits
		Credits = false;
		makeLuaSprite('CreditsBG',nil,-292,200)
		makeGraphic('CreditsBG',252,100,'ffffff')
		setProperty('CreditsBG.alpha',0.4)
		setObjectCamera('CreditsBG','other')
		addLuaSprite('CreditsBG',false)
		Text = 'Part Charted by:\n\n    Mr. Half';
		makeLuaText('CreditsTxt',Text,0,getProperty('CreditsBG.x')+12,getProperty('CreditsBG.y')+12)
		setTextAlignment('CreditsTxt','left')
		setTextSize('CreditsTxt',24)
		setObjectCamera('CreditsTxt','other')
		addLuaText('CreditsTxt',true)
	end
	if curStep == 8528 then --leafy credits
		Credits = false;
		makeLuaSprite('CreditsBG',nil,-292,200)
		makeGraphic('CreditsBG',252,100,'ffffff')
		setProperty('CreditsBG.alpha',0.4)
		setObjectCamera('CreditsBG','other')
		addLuaSprite('CreditsBG',false)
		Text = 'Part Charted by:\n\n Leafy-Ivy_Ray';
		makeLuaText('CreditsTxt',Text,0,getProperty('CreditsBG.x')+12,getProperty('CreditsBG.y')+12)
		setTextAlignment('CreditsTxt','left')
		setTextSize('CreditsTxt',24)
		setObjectCamera('CreditsTxt','other')
		addLuaText('CreditsTxt',true)
	end
	if curStep == 10752 then --heckat credits
		Credits = false;
		makeLuaSprite('CreditsBG',nil,-292,200)
		makeGraphic('CreditsBG',252,100,'ffffff')
		setProperty('CreditsBG.alpha',0.4)
		setObjectCamera('CreditsBG','other')
		addLuaSprite('CreditsBG',false)
		Text = 'Part Charted by:\n\n     Heckat';
		makeLuaText('CreditsTxt',Text,0,getProperty('CreditsBG.x')+12,getProperty('CreditsBG.y')+12)
		setTextAlignment('CreditsTxt','left')
		setTextSize('CreditsTxt',24)
		setObjectCamera('CreditsTxt','other')
		addLuaText('CreditsTxt',true)
		setObjectOrder('CreditsBG', 300);
		setObjectOrder('CreditsTxt', 301);
	end
	if curStep == 136 or curStep == 400 or curStep == 592 or curStep == 848 or curStep == 944 or curStep == 10224 or curStep == 10320 then --xterion
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 600;
		yy = 580;
		xx2 = 1100;
		yy2 = 580;
		setProperty('boyfriendGroup.x',1100);
		setProperty('boyfriendGroup.y',125);
		setProperty('dadGroup.x',0);
		setProperty('dadGroup.y',100);
		setProperty('gfGroup.x',875);
		setProperty('gfGroup.y',270);
		setProperty('defaultCamZoom',0.7);
	end
	if curStep == 272 or curStep == 528 or curStep == 656 or curStep == 912 or curStep == 10160 or curStep == 10288 then --tailsdoll
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 600;
		yy = 380;
		xx2 = 900;
		yy2 = 480;
		setProperty('boyfriendGroup.x',800);
		setProperty('boyfriendGroup.y',125);
		setProperty('dadGroup.x',-100);
		setProperty('dadGroup.y',100);
		setProperty('gfGroup.x',275);
		setProperty('gfGroup.y',50);
		setProperty('defaultCamZoom',0.7);
	end
	if curStep == 1040 or curStep == 1296 or curStep == 1552 or curStep == 1808 or curStep == 10416 then --needlemouse
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 550;
		yy = 680;
		xx2 = 1100;
		yy2 = 780;
		setProperty('boyfriendGroup.x',975);
		setProperty('boyfriendGroup.y',375);
		setProperty('dadGroup.x',20);
		setProperty('dadGroup.y',395);
		setProperty('gfGroup.x',220);
		setProperty('gfGroup.y',400);
		setProperty('defaultCamZoom',0.6);
	end
	if curStep == 1168 or curStep == 1424 or curStep == 1680 or curStep == 1936 or curStep == 10544 then --tails
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 450;
		yy = 300;
		xx2 = 950;
		yy2 = 300;
		setProperty('boyfriendGroup.x',1000);
		setProperty('boyfriendGroup.y',-110);
		setProperty('dadGroup.x',150);
		setProperty('dadGroup.y',0);
		setProperty('gfGroup.x',400);
		setProperty('gfGroup.y',130);
		setProperty('defaultCamZoom',0.65);
	end
	if curStep == 2064 or curStep == 10672 then --fleetway
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 300;
		yy = 400;
		xx2 = 2150;
		yy2 = 870;
		setProperty('boyfriendGroup.x',2080);
		setProperty('boyfriendGroup.y',510);
		setProperty('dadGroup.x',-150);
		setProperty('dadGroup.y',0);
		setProperty('gfGroup.x',2460);
		setProperty('gfGroup.y',500);
		setProperty('defaultCamZoom',0.7);
		setProperty('gf.alpha',1);
	end
	if curStep == 3232 or curStep == 3408 or curStep == 3648 or curStep == 3712 then --chaotix
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		setProperty('defaultCamZoom', 0.87)
		xx = 450;
		yy = 630;
		xx2 = 750;
		yy2 = 630;
		setProperty('boyfriendGroup.x',70);
		setProperty('boyfriendGroup.y',144);
		setProperty('dadGroup.x',-190);
		setProperty('dadGroup.y',95);
		setProperty('gfGroup.x',2460);
		setProperty('gfGroup.y',500);
	end
	if curStep == 2304 or curStep == 2305 or curStep == 2306 then
		fleetwayMoment = true;
		xx = 300;
		yy = 400;
		xx2 = 300;
		yy2 = 400;
		xx3 = 300;
		yy3 = 400;
		triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 2320 then
		fleetwayMoment = false;
		xx2 = 2150; 
		yy2 = 870;
		xx3 = xx2;
		yy3 = xx3;
	end
	if curStep == 3360 or curStep == 3520 or curStep == 3680 or curStep == 4064 or curStep == 4192 or curStep == 11056 then --knuckles
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 50;
		yy = -70;
		xx2 = -450;
		yy2 = -70;
		setProperty('boyfriendGroup.x',-1100);
		setProperty('boyfriendGroup.y',-520);
		setProperty('dadGroup.x',-630);
		setProperty('dadGroup.y',-450);
		setProperty('gfGroup.x',-230);
		setProperty('gfGroup.y',-70);
		wechBeastMoment = false;
		setProperty('defaultCamZoom', 0.58)
	end
	if curStep == 3744 or curStep == 4128 or curStep == 10928 then --wechidna
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 1450;
		yy = 1350;
		xx2 = 1750;
		yy2 = 1700;
		setProperty('boyfriendGroup.x',1800);
		setProperty('boyfriendGroup.y',1300);
		setProperty('dadGroup.x',880);
		setProperty('dadGroup.y',1300);
		wechBeastMoment = true;
	end
	if curStep == 4256 or curStep == 4768 or curStep == 5056 or curStep == 5184 or curStep == 5424 or curStep == 11184 then --satanos
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 300;
		yy = 470;
		xx2 = 550;
		yy2 = 520;
		setProperty('boyfriendGroup.x',470);
		setProperty('boyfriendGroup.y',100);
		setProperty('dadGroup.x',-220);
		setProperty('dadGroup.y',150);
		setProperty('gfGroup.x',-710);
		setProperty('gfGroup.y',180);
		setProperty('eggman_bg.visible', false);
		setProperty('eggman_eys.visible', false);
		satanosMoment = true;
		cancelTimer('eyes up');
		cancelTimer('eyes down');
		cancelTween('egg_eys-TweenDown');
		cancelTween('egg_eys-TweenUp');
		setProperty('eggman_eys.y', -1000);
	end
	if curStep == 4496 or curStep == 4920 or curStep == 5088 or curStep == 5344 or curStep == 5472 or curStep == 11248 then --eggman
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 550;
		yy = 130;
		xx2 = 1450;
		yy2 = 320;
		setProperty('boyfriendGroup.x',1530);
		setProperty('boyfriendGroup.y',-70);
		setProperty('dadGroup.x',130);
		setProperty('dadGroup.y',0);
		setProperty('gfGroup.x',800);
		setProperty('gfGroup.y',-60);
		if curStep <= 12263 then
			setProperty('eggman_bg.visible', true);
			setProperty('eggman_eys.visible', true);
		end
		satanosMoment = false;
		setProperty('defaultCamZoom', 0.5);
		runTimer('eyes up', 0.01);
	end
	if curStep == 5584 or curStep == 6096 or curStep == 6352 then --sonic.exe
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		fatalMoment = false;
		xx = 380;
		yy = 450;
		xx2 = 645;
		yy2 = 450;
		setProperty('boyfriendGroup.x',745);
		setProperty('boyfriendGroup.y',85);
		setProperty('dadGroup.x',-100);
		setProperty('dadGroup.y',145);
		setProperty('gfGroup.x',200);
		setProperty('gfGroup.y',75);
		setProperty('defaultCamZoom', 0.65);
	end
	if curStep == 5840 or curStep == 6160 or curStep == 6384 or curStep == 6464 or curStep == 11520 or curStep == 11600 then --lordx
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		fatalMoment = false;
		xx = 480;
		yy = 550;
		xx2 = 995;
		yy2 = 700;
		setProperty('boyfriendGroup.x',1000);
		setProperty('boyfriendGroup.y',275);
		setProperty('dadGroup.x',75);
		setProperty('dadGroup.y',20);
		setProperty('gfGroup.x',-400);
		setProperty('gfGroup.y',275);
		setProperty('defaultCamZoom', 0.9);
	end
	if curStep == 5968 or curStep == 6224 or curStep == 6416 or curStep == 11456 or curStep == 11584 then --fatal error
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 150;
		yy = 240;
		xx2 = 750;
		yy2 = 590;
		setProperty('boyfriendGroup.x',100);
		setProperty('boyfriendGroup.y',140);
		setProperty('dadGroup.x',-450);
		setProperty('dadGroup.y',140);
		setProperty('gfGroup.x',400);
		setProperty('gfGroup.y',130);
		fatalMoment = true;
	end
	if curStep == 3222 then
		setProperty('eggman_bg.visible',true);
		setProperty('eggman_eys.visible',true);
	end
	if curStep == 3231 then
		setProperty('eggman_bg.visible',false);
		setProperty('eggman_eys.visible',false);
	end
	if curStep == 6608 or curStep == 10096 then --ycr
		scorchedMoment = false;
		exeMoment = false;
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		fatalMoment = false;
		xx = -550;
		yy = -270;
		xx2 = 50;
		yy2 = -70;
		setProperty('dadGroup.x',-1150);
		setProperty('dadGroup.y',-870);
		setProperty('boyfriendGroup.x',130);
		setProperty('boyfriendGroup.y',-510);
		setProperty('defaultCamZoom',0.6);
	end
	if curStep == 6640 or curStep == 6896 or curStep == 6928 or curStep == 7056 or curStep == 11440 or curStep == 11568 or curStep == 12224 then --xeno
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 450;
		yy = -50;
		xx2 = 800;
		yy2 = 250;
		setProperty('boyfriendGroup.x',750);
		setProperty('boyfriendGroup.y',-95);
		setProperty('dadGroup.x',-200);
		setProperty('dadGroup.y',0);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
		setProperty('defaultCamZoom',0.6);
	end
	if curStep == 6768 or curStep == 6912 or curStep == 6944 or curStep == 11504 or curStep == 11616 then --majin
		fatalMoment = false;
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 800;
		yy = 625;
		xx2 = 1200;
		yy2 = 675;
		setProperty('boyfriendGroup.x',1110);
		setProperty('boyfriendGroup.y',275);
		setProperty('dadGroup.x',410);
		setProperty('dadGroup.y',180);
		setProperty('gfGroup.x',400);
		setProperty('gfGroup.y',1230);
		setProperty('defaultCamZoom',0.9);
	end
	if curStep == 7168 or curStep == 7296 or curStep == 7482 or curStep == 8314 or curStep == 8384 or curStep == 11696 then --sunky
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 950;
		yy = 325;
		xx2 = 1380;
		yy2 = 325;
		setProperty('boyfriendGroup.x',1430);
		setProperty('boyfriendGroup.y',-115);
		setProperty('dadGroup.x',340);
		setProperty('dadGroup.y',-110);
		setProperty('gfGroup.x',790);
		setProperty('gfGroup.y',0);
		setProperty('defaultCamZoom',0.77);
	end
	if curStep == 7232 or curStep == 7332 or curStep == 8336 or curStep == 8392 or curStep == 11728 then --sanic
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 520;
		yy = 565;
		xx2 = 970;
		yy2 = 565;
		setProperty('boyfriendGroup.x',820);
		setProperty('boyfriendGroup.y',70);
		setProperty('dadGroup.x',150);
		setProperty('dadGroup.y',265);
		setProperty('gfGroup.x',400);
		setProperty('gfGroup.y',130);
		setProperty('defaultCamZoom',1);
	end
	if curStep == 7680 or curStep == 8416 or curStep == 11824 then --coldsteel
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 900;
		yy = 655;
		xx2 = 1570;
		yy2 = 715;
		setProperty('boyfriendGroup.x',1550);
		setProperty('boyfriendGroup.y',275);
		setProperty('dadGroup.x',475);
		setProperty('dadGroup.y',400);
		setProperty('gfGroup.x',750);
		setProperty('gfGroup.y',400);
		setProperty('defaultCamZoom',0.9);
	end
	if curStep == 7994 then --guitarsteel
		setProperty('dadGroup.x',435);
		setProperty('dadGroup.y',50);
	end
	if curStep == 8256 then --end guitarsteel
		setProperty('dadGroup.x',475);
		setProperty('dadGroup.y',400);
	end
	if curStep == 8528 or curStep == 8784 or curStep == 8912 then --faker
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 230;
		yy = 100;
		xx2 = 495;
		yy2 = 150;
		setProperty('boyfriendGroup.x',500);
		setProperty('boyfriendGroup.y',-275);
		setProperty('dadGroup.x',-200);
		setProperty('dadGroup.y',-275);
		setProperty('gfGroup.x',-300);
		setProperty('gfGroup.y',-295);
		setProperty('defaultCamZoom',0.7);
	end
	if curStep == 8656 or curStep == 8848 or curStep == 8944 then --hog
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 630;
		yy = 475;
		xx2 = 895;
		yy2 = 475;
		setProperty('boyfriendGroup.x',900);
		setProperty('boyfriendGroup.y',50);
		setProperty('dadGroup.x',200);
		setProperty('dadGroup.y',55);
		setProperty('gfGroup.x',-220);
		setProperty('gfGroup.y',55);
		setProperty('defaultCamZoom',0.7);
	end
	if curStep == 9072 or curStep == 9328 or curStep == 9712 or curStep == 9968 or curStep == 11952 then --exe
		exeMoment = true;
		scorchedMoment = false
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 230;
		yy = -150;
		xx2 = 495;
		yy2 = 150;
		setProperty('boyfriendGroup.x',500);
		setProperty('boyfriendGroup.y',-275);
		setProperty('dadGroup.x',-300);
		setProperty('dadGroup.y',-275);
		setProperty('gfGroup.x',300);
		setProperty('gfGroup.y',-30);
	end
	if curStep == 9200 or curStep == 9456 or curStep == 9840 or curStep == 12080 then --scorched
		scorchedMoment = true;
		exeMoment = false;
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 630;
		yy = 175;
		xx2 = 895;
		yy2 = 475;
		setProperty('boyfriendGroup.x',900);
		setProperty('boyfriendGroup.y',75);
		setProperty('dadGroup.x',200);
		setProperty('dadGroup.y',25);
		setProperty('gfGroup.x',-800);
		setProperty('gfGroup.y',75);
		setProperty('defaultCamZoom',0.7);
	end
	if curStep == 12240 then --badappleshit
		xx = 1035;
		yy = 440;
		xx2 = 1035;
		yy2 = 440;
		ofs = 0;
		ofs2 = 0;
		setProperty('boyfriendGroup.x',750);
		setProperty('boyfriendGroup.y',-95);
		setProperty('dadGroup.x',-200);
		setProperty('dadGroup.y',0);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
		setProperty('defaultCamZoom',1);
		finalMoment = true;
	end
	if curStep == 12784 then --faker ending
		finalMoment = false;
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 630;
		yy = 805;
		xx2 = 895;
		yy2 = 805;
		ofs = 10;
		ofs2 = 10;
		fakerpixelMoment = true;
		setProperty('boyfriendGroup.x',399);
		setProperty('boyfriendGroup.y',434);
		setProperty('dadGroup.x',204);
		setProperty('dadGroup.y',476);
		setProperty('gfGroup.x',800);
		setProperty('gfGroup.y',75);
		setProperty('defaultCamZoom',1.7);
		setProperty('faker_pixel.visible', true);
		setObjectOrder('boyfriendGroup',1002);
	end
	if curStep == 5584 then --remove eggman
		cancelTimer('eyes up');
		cancelTimer('eyes down');
		cancelTween('egg_eys-TweenDown');
		cancelTween('egg_eys-TweenUp');
		setProperty('eggman_eys.y', -1000);
		setProperty('eggman_bg.visible',false);
		setProperty('eggman_eys.visible',false);
	end
	if curStep == 11440 then --destroy eggman
		removeLuaSprite('eggman_bg');
		removeLuaSprite('eggman_eys');
	end
	if curStep == 12240 then --xeno final moment
		finalMoment = true;
		ofs = 0;
		ofs2 = 0;
		setProperty('boyfriendGroup.x',750);
		setProperty('boyfriendGroup.y',-95);
		setProperty('dadGroup.x',700);
		setProperty('dadGroup.y',450);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12248 then --tails soul final moment
		setProperty('dadGroup.x',600);
		setProperty('dadGroup.y',150);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12256 then --knuckles soul final moment
		setProperty('dadGroup.x',300);
		setProperty('dadGroup.y',150);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12264 then --eggman soul final moment
		setProperty('dadGroup.x',300);
		setProperty('dadGroup.y',350);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12272 then --lordx final moment
		setProperty('dadGroup.x',750);
		setProperty('dadGroup.y',-100);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12280 then --majin final moment
		setProperty('dadGroup.x',1120);
		setProperty('dadGroup.y',0);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12288 then --fleetway final moment
		setProperty('dadGroup.x',380);
		setProperty('dadGroup.y',50);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12296 then --tailsdoll final moment
		setProperty('dadGroup.x',1120);
		setProperty('dadGroup.y',150);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12304 then --sunky final moment
		setProperty('dadGroup.x',380);
		setProperty('dadGroup.y',-50);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12312 then --sanic final moment
		setProperty('dadGroup.x',1080);
		setProperty('dadGroup.y',150);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12320 then --exe final moment
		setProperty('dadGroup.x',380);
		setProperty('dadGroup.y',350);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',-100);
	end
	if curStep == 12336 then --xeno and tails soul final moment
		setProperty('dadGroup.x',380);
		setProperty('dadGroup.y',550);
		setProperty('gfGroup.x',1285);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12368 then --needlemouse final moment
		setProperty('dadGroup.x',480);
		setProperty('dadGroup.y',80);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12384 or curStep == 12472 then --fatal final moment
		setProperty('dadGroup.x',710);
		setProperty('dadGroup.y',20);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12400 then --wechidna final moment
		setProperty('dadGroup.x',0);
		setProperty('dadGroup.y',880);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12416 then --satanos final moment
		setProperty('dadGroup.x',480);
		setProperty('dadGroup.y',80);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12432 then --coldsteel final moment
		setProperty('dadGroup.x',1080);
		setProperty('dadGroup.y',240);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12440 then --xterion final moment
		setProperty('dadGroup.x',440);
		setProperty('dadGroup.y',-40);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12448 then --scorched final moment
		setProperty('dadGroup.x',1440);
		setProperty('dadGroup.y',540);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12464 then --xeno final moment
		setProperty('dadGroup.x',380);
		setProperty('dadGroup.y',480);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12468 then --needlemouse final moment again
		setProperty('dadGroup.x',1200);
		setProperty('dadGroup.y',80);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12480 then --finale moment
		setProperty('dadGroup.x',380);
		setProperty('dadGroup.y',480);
		setProperty('gfGroup.x',1225);
		setProperty('gfGroup.y',150);
	end
	if curStep == 12560 then --second bf ending
		setProperty('boyfriendGroup.x',780);
		setProperty('boyfriendGroup.y',-125);
	end
	if curStep == 12624 then --third bf ending
		setProperty('boyfriendGroup.x',800);
		setProperty('boyfriendGroup.y',-105);
	end
	if curStep == 12734 then --gf addition
		setProperty('gfGroup.x',750);
		setProperty('gfGroup.y',-95);
		setproperty('gf.alpha',0.3);
	end
	if curStep == 3216 then
		setProperty('flashingshit.alpha',1);
	end
	if curStep == 3232 then
		triggerEvent('Flash Camera',0.6);
		setProperty('flashingshit.alpha',0);
	end
	if curStep == 7680 then
		setProperty('flashingshit.alpha',1);
	end
	if curStep == 7712 then
		triggerEvent('Flash Camera',0.6);
		setProperty('flashingshit.alpha',0);
	end

	--character/screen fades
	--doTweenAlpha('dadAlpha', 'dadGroup', alpha, time, 'ease');
	--doTweenAlpha('gfAlpha', 'gfGroup', alpha, time, 'ease');
	--doTweenAlpha('bfAlpha', 'boyfriendGroup', alpha, time, 'ease');

	if curStep == 912 or curStep == 1900 or curStep == 3553 or curStep == 4256 or curStep == 4528 or curStep == 5344 or curStep == 7172 or curStep == 7712 then --reset alpha
		setProperty('dad.alpha', 1);
		setProperty('gf.alpha', 0.7);
		setProperty('boyfriend.alpha', 1);
		setProperty('sonicexe.alpha',0.7);
	end
	if curStep == 8416 then
		setProperty('gf.alpha',0);
		setProperty('sunky.alpha',0);
	end
	if curStep == 3544 then
		setProperty('gfGroup.y',-540);
		setProperty('gfGroup.x',-150);
	end
	if curStep == 688 or curStep == 3544 or curStep == 8960 then
		setProperty('gf.alpha',0.7);
		triggerEvent('Flash Camera', 0.6, '');
	end
	if curStep == 8960 then
		xx = 330;
	end
	if curStep == 4192 or curStep == 1808 or curStep == 4496 or curStep == 5056 or curStep == 5088 or curStep == 5184 or curStep == 6504 or curStep == 7072 or curStep == 9840 then
		setProperty('gf.alpha',0.7);
	end
	if curStep == 4511 then
		doTweenAlpha('gfAlpha', 'gf', 0, 1.16, 'linear');
	end
	if curStep == 5120 or curStep == 5248 then
		doTweenAlpha('gfAlpha', 'gf', 0, 0.5, 'linear');
	end
	if curStep == 6484 then
		doTweenAlpha('gfAlpha', 'gf', 0, 0.6, 'linear');
		doTweenAlpha('sonicAlpha', 'sonicexe', 0, 0.6, 'linear');
	end
	if curStep == 720 or curStep == 1808 or curStep == 4192 then
		doTweenAlpha('gfAlpha', 'gf', 0, 1.55, 'linear');
	end
	if curStep == 7088 then
		doTweenAlpha('gfAlpha', 'gf', 0, 0.775, 'linear');
	end
	if curStep == 7552 then
		setProperty('gf.alpha',0.8);
	end
	if curStep == 7622 then
		doTweenAlpha('gfAlpha', 'gf', 0, 1, 'linear');
	end
	if curStep == 8430 then
		doTweenAlpha('gfAlpha', 'gf', 0.8, 0.2, 'linear');
		doTweenAlpha('sunkyAlpha', 'sunky', 0.8, 0.2, 'linear');
	end
	if curStep == 8456 then
		doTweenAlpha('gfAlpha', 'gf', 0, 0.5, 'linear');
		doTweenAlpha('sunkyAlpha', 'sunky', 0, 0.5, 'linear');
	end
	if curStep == 12208 then
		doTweenAlpha('secondtolastflash', 'flashingshit2', 1, 0.2);
	end
	if curStep == 12224 then
		doTweenAlpha('secondtolastflash', 'flashingshit2', 0, 1.29);
	end
	if curStep == 8976 then
		doTweenAlpha('gfAlpha', 'gf', 0, 1, 'linear');
	end
	if curStep == 9840 then
		doTweenAlpha('gfAlpha', 'gf', 0, 1.55, 'linear');
	end
	if curStep == 9040 then
		doTweenAlpha('hudAlpha', 'camHUD', 0, 1.55, 'linear');
		doTweenAlpha('hudAlpha', 'camGame', 0, 1.55, 'linear');
		doTweenAlpha('flashingshitAlpha', 'flashingshit2', 1, 1.55, 'linear');
	end
	if curStep == 9060 then
		setProperty('flashingshit2.alpha',0);
		setProperty('camHUD.alpha',0);
	end
	if curStep == 9072 then
		setProperty('camGame.alpha',1);
		setProperty('camHUD.alpha',1);
	end
	if curStep == 12224 then
		doTweenAlpha('hudAlpha', 'camHUD', 1, 1.29, 'linear');
		doTweenAlpha('flashingshitAlpha', 'flashingshit2', 0, 1.29, 'linear');
	end
	if curStep == 12752 then
		doTweenAlpha('hudAlpha', 'camHUD', 0, 1.55, 'linear');
		doTweenAlpha('flashingshitAlpha', 'flashingshit2', 1, 1.55, 'linear');
	end
	if curStep == 12816 then
		doTweenAlpha('flashingshitAlpha', 'flashingshit2', 0, 6.2, 'linear');
	end
	if curStep == 12848 then
		doTweenAlpha('hudAlpha', 'camHUD', 1, 3.1, 'linear');
	end

	--extra camera movements
	if curStep == 256 then
		xx2 = 1350;
		yy2 = 680;
	end
	if curStep == 512 then
		xx2 = 1350;
		yy2 = 680;
	end
	if curStep == 1024 then
		xx2 = 1350;
		yy2 = 680;
	end
	if curStep == 2160 or curStep == 2560 then
		gfMoment = false;
		traceBF = false;
		xx = 300;
		yy = 400;
		xx2 = 300;
		yy2 = 400;
		triggerEvent('Camera Follow Pos',xx2,yy2)
	end
	if curStep == 2192 or curStep == 2576 then
		gfMoment = true;
		traceBF = true;
		xx2 = 2150;
		yy2 = 870;
	end
	if curStep == 2176 then
		xx2 = 2300;
		yy2 = 870;
	end
	if curStep == 2192 then
		xx2 = 2150;
		yy2 = 870;
	end
	if curStep == 2384 then
		xx2 = 2300;
		yy2 = 870;
	end
	if curStep == 2448 then
		xx2 = 2150;
		yy2 = 870;
	end
	if curStep == 2688 then
		xx2 = 2300;
		yy2 = 870;
	end
	if curStep == 2696 or curStep == 2952 then
		xx2 = 300;
		yy2 = 400;
		ofs = 0;
		ofs2 = 0;
	end
	if curStep == 2704 or curStep == 2960 then
		xx2 = 2150;
		yy2 = 870;
		ofs = 20;
		ofs2 = 20;
	end
	if curStep == 3408 then
		setProperty('cameraSpeed', 20)
	end
	if curStep == 3424 then
		setProperty('cameraSpeed', 3)
	end
	if curStep == 4000 then
		setProperty('cameraSpeed', 5)
	elseif curStep == 4240 then
		xx2 = -650;
		yy2 = -40;
	end
	if curStep == 4496 then
		xx2 = 1570;
		yy2 = 370;
	end
	if curStep == 4512 then
		xx2 = 1450;
		yy2 = 370;
	end
	if curStep == 4920 then
		xx2 = 1570;
		yy2 = 370;
	end
	if curStep == 4928 then
		xx2 = 1450;
		yy2 = 370;
	end
	if curStep == 5568 then
		xx2 = 1570;
		yy2 = 370;
	end
	if curStep == 7072 then
		xx = 470;
		yy = 170;
	end
	if curStep == 8430 then
		xx =  700;
		yy = 695;
	end
	if curStep == 10400 then
		xx2 = 1350;
		yy2 = 680;
	end
	if curStep == 11424 then
		xx2 = 1570;
		yy2 = 370;
	end
	if curStep == 12944 then
		setProperty('defaultCamZoom',1.65);
	end
	if finalMoment == true and curStep <= 12495 then
		setProperty('defaultCamZoom',1);
		setProperty('cameraSpeed',200);
		setProperty('dad.alpha',0.5);
		setProperty('gf.alpha',0.5);
		setProperty('true-fatal.alpha',0.5);
		setProperty('gf.color', 000000);
		ofs = 0;
		ofs2 = 0;
	end
	if curStep == 13088 then
		doTweenAlpha('camHUDTween', 'camHUD', 0, 1.29);
	end
	if curStep == 13104 then
		doTweenAlpha('lastflash', 'flashingshit3', 1, 2.58);
	end
	if curStep == 13136 then
		setProperty('flashingshit2.alpha',1);
		setProperty('flashingshit3.alpha',0);
	end
	if curStep >= 12240 and curStep <= 12495 then
		triggerEvent('Cam Zoom', '1', '0.01, linear');
		setProperty('defaultCamZoom',1);
	end
	if curStep >= 12784 then
		setProperty('dad.alpha',1);
		finalMoment = false;
	end
	if curStep == 12496 then
		doTweenAlpha('gfAlpha', 'gf', 0, 2.43, 'linear');
		doTweenAlpha('dadAlpha', 'dad', 0, 2.43, 'linear');
		doTweenAlpha('fatalAlpha', 'true-fatal', 0, 2.43, 'linear');
	end
	if wechBeastMoment == true then
		if mustHitSection == false then
			setProperty('defaultCamZoom',0.5)
		else
			setProperty('defaultCamZoom',0.7)
		end
	end
	if satanosMoment == true then
		if mustHitSection == false then
			setProperty('defaultCamZoom',0.6)
		else
			setProperty('defaultCamZoom',0.65)
		end
	end
	if fatalMoment == true then
		if mustHitSection == false then
			setProperty('defaultCamZoom',0.6)
		else
			setProperty('defaultCamZoom',0.9)
		end
	end
	if exeMoment == true then
		if mustHitSection == false then
			setProperty('defaultCamZoom',0.7)
		else
			setProperty('defaultCamZoom',0.75)
		end
	end
	if scorchedMoment == true then
		if mustHitSection == false then
			setProperty('defaultCamZoom',0.55)
		else
			setProperty('defaultCamZoom',0.65)
		end
	end
	if fakerpixelMoment == true then
		setProperty('cameraSpeed',1);
		setProperty('defaultCamZoom',1.7);
	end
	if forceCamera == true then
		if mustHitSection == false and traceDad == true then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
               triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
		end
        if mustHitSection == true and traceBF == true then
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' and traceBF == true then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
		if getPropertyFromGroup('notes', id, 'gfNote') and mustHitSection == true and gfMoment == true then
			if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
			end
			if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
			end
			if getProperty('gf.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
			end
			if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
			end	
			if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
				triggerEvent('Camera Follow Pos',xx3,yy3)
			end
			if getProperty('gf.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx3,yy3)
			end
		end
	end
	if not Credits and curStep >= 16 then
        setProperty('CreditsTxt.x',Lerp(getProperty('CreditsTxt.x'),12,0.05))
        setProperty('CreditsBG.x',Lerp(getProperty('CreditsBG.x'),0,0.05))
    else
        setProperty('CreditsTxt.x',Lerp(getProperty('CreditsTxt.x'),-682+12,0.01))
        setProperty('CreditsBG.x',Lerp(getProperty('CreditsBG.x'),-682,0.01))
    end
    if curStep >= 47 and curStep <= 48 or curStep >= 2095 and curStep <= 2096 or curStep >= 4287 and curStep <= 4288 or curStep >= 6383 and curStep <= 6384 or curStep >= 8559 and curStep <= 8560 or curStep >= 10783 and curStep <= 10784 then
        if getProperty('CreditsBG.x')>-0.9 then
            Credits = true
        end
	end
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		setProperty(ghost..'.antialiasing', getProperty(char..'.antialiasing'))
		setProperty(ghost..'.offset.x', noteData[2])
		setProperty(ghost..'.offset.y', noteData[3])
		setProperty(ghost..'.scale.x', getProperty(char..'.scale.x'))
		setProperty(ghost..'.scale.y', getProperty(char..'.scale.y'))
		setProperty(ghost..'.flipX', getProperty(char..'.flipX'))
		setProperty(ghost..'.flipY', getProperty(char..'.flipY'))
		setProperty(ghost..'.visible', getProperty(char..'.visible'))
		setProperty(ghost..'.color', getIconColor(char))
	end
	if curStep >= 12240 then
		setObjectOrder('whitebg2',1);
	end
	if stop == true then
		setProperty('VG2.alpha',0);
	end
	if stop2 == true then
		setProperty('VG3.alpha',0);
	end
	if curStep >= 2064 and curStep <= 3200 or curStep >= 10672 and curStep <= 10927 then
		setScrollFactor('boyfriendGhost', 1.1, 1);
		setScrollFactor('dadGhost', 1.1, 1);
		setScrollFactor('gfGhost', 1.1, 1);
	end
	if curStep <= 2064 or curStep >= 3200 and curStep <= 10671 or curStep >= 10928 then
		setScrollFactor('boyfriendGhost', 1, 1);
		setScrollFactor('dadGhost', 1, 1);
		setScrollFactor('gfGhost', 1, 1);
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'gf-idle' then
		setProperty('gf.idleSuffix','')
	end
    if tag == 'reset' then
        setProperty('whitebg.alpha',0.00001);
    end
	if tag == 'middle1' then
		noteTweenX('MiddleXBF1', 5, 532, 2, 'quartInOut');
	end
	if tag == 'middle2' then
		noteTweenX('MiddleXBF2', 6, 642, 2, 'quartInOut');
	end
	if tag == 'middle3' then
		noteTweenX('MiddleXBF3', 7, 752, 2, 'quartInOut');
	end
	if tag == 'middle4' then
		noteTweenX('MiddleXDAD1', 2, 642, 0.5, 'quartInOut');
	end
	if tag == 'middle5' then
		noteTweenX('MiddleXDAD2', 1, 532, 0.5, 'quartInOut');
	end
	if tag == 'middle6' then
		noteTweenX('MiddleXDAD3', 0, 422, 0.5, 'quartInOut');
	end
	if tag == 'end' then
		removeLuaSprite('staticstuff');
	end
	if tag == 'First' then
		doTweenAlpha('VG2Tween', 'VG2', 0, vgspeed, 'linear');
		runTimer('Second',vgspeed);
	end
	if tag == 'Second' then
		doTweenAlpha('VG2Tween', 'VG2', 0.7, vgspeed, 'linear');
		runTimer('First',vgspeed);
	end
	if tag == 'bfghost' then
		runTimer('bfstr'..strumTime)
	end
	if tag == 'gfghost' then
		runTimer('gfstr'..strumTime)
	end
	if tag == 'dadghost' then
		runTimer('ddstr'..strumTime)
	end
	if string.match(tag, 'bfstr') then
		bfRows[string.sub(tag, 6, string.len(tag))] = nil
	elseif string.match(tag, 'ddstr') then
		ddRows[string.sub(tag, 6, string.len(tag))] = nil
	elseif string.match(tag, 'mmstr') then
		mmRows[string.sub(tag, 6, string.len(tag))] = nil
	elseif string.match(tag, 'gfstr') then
		gfRows[string.sub(tag, 6, string.len(tag))] = nil
	end
	if tag == 'start' then
        doTweenAlpha('startstuff4', 'text', 1, 0.8, 'linear')
	end
    if tag == 'bye' then
        loading = true
        startCountdown()
    end
	if tag == 'eyes up' and curStep <= 12243 then
		doTweenY('egg_eys-TweenUp', 'eggman_eys', -1000, 2.5, 'sineInOut')
		runTimer('eyes down', 2.5, 1)
	end
	if tag == 'eyes down' and curStep <= 12243 then
		doTweenY('egg_eys-TweenDown', 'eggman_eys', -1100, 2.5, 'sineInOut')
		runTimer('eyes up', 2.5, 1)
	end
	if tag == 'ringStart' and curStep <= 12243 then
		setProperty('cameraSpeed',2);
	end
	if tag == 'ringFinish' and curStep >= 4000 then
		setProperty('cameraSpeed',3);
	end
	if tag == 'ringStart' and finalMoment == true then
		setProperty('cameraSpeed',20);
	end
	if tag == 'dad-idle' then
		setProperty('dad.idleSuffix','')
	end
	if tag == 'bf-idle' then
		setProperty('boyfriend.idleSuffix','')
	end
	if tag == 'reset-preload' and getPropertyFromClass('states.PlayState','chartingMode') == false then
		triggerEvent('Change Character', 'dad', 'tailsdoll');
		triggerEvent('Change Character', 'bf', 'bf-john9doe-3d');
		triggerEvent('Change Character', 'gf', 'gf');
	end
	if tag == 'preload' and getPropertyFromClass('states.PlayState','chartingMode') == false and getPropertyFromClass('backend.ClientPrefs','potatoMode') == false then
		preload = true;
		triggerEvent('Change Character', 'dad', 'xterion-first');
		triggerEvent('Change Character', 'dad', 'bf-john9doe-3d-xterion');
		triggerEvent('Change Character', 'dad', 'tailsdoll');
		triggerEvent('Change Character', 'dad', 'bf-john9doe-3d');
		triggerEvent('Change Character', 'dad', 'xterion-second');
		triggerEvent('Change Character', 'dad', 'Needlemouse');
		triggerEvent('Change Character', 'dad', 'bf-needle-encore');
		triggerEvent('Change Character', 'dad', 'Tails-Encore');
		triggerEvent('Change Character', 'dad', 'bf-encore');
		triggerEvent('Change Character', 'dad', 'gf');
		triggerEvent('Change Character', 'dad', 'fleetway');
		triggerEvent('Change Character', 'dad', 'sonic');
		triggerEvent('Change Character', 'dad', 'fleetway-anims3');
		triggerEvent('Change Character', 'dad', 'Chaotix');
		triggerEvent('Change Character', 'dad', 'bf-encore-pixel-small');
		triggerEvent('Change Character', 'dad', 'Knuckles-Encore');
		triggerEvent('Change Character', 'dad', 'bf-encore-flipped');
		triggerEvent('Change Character', 'dad', 'chaotix-hd');
		triggerEvent('Change Character', 'dad', 'wechBeast');
		triggerEvent('Change Character', 'dad', 'bf-encore-red');
		triggerEvent('Change Character', 'dad', 'wechBeast-flipped');
		triggerEvent('Change Character', 'dad', 'Satanos');
		triggerEvent('Change Character', 'dad', 'Eggman-Encore');
		triggerEvent('Change Character', 'dad', 'sonicexe');
		triggerEvent('Change Character', 'dad', 'lordxEncore');
		triggerEvent('Change Character', 'dad', 'fatal-sonic');
		triggerEvent('Change Character', 'dad', 'bf-encore-pixel');
		triggerEvent('Change Character', 'dad', 'ycr-cherribun');
		triggerEvent('Change Character', 'dad', 'BEAST-Enc');
		triggerEvent('Change Character', 'dad', 'Encore-right');
		triggerEvent('Change Character', 'dad', 'majin');
		triggerEvent('Change Character', 'dad', 'bf-encore-majin');
		triggerEvent('Change Character', 'dad', 'sunky');
		triggerEvent('Change Character', 'dad', 'sanic');
		triggerEvent('Change Character', 'dad', 'coldsteel');
		triggerEvent('Change Character', 'dad', 'coldsteel_guitar');
		triggerEvent('Change Character', 'dad', 'faker-encore');
		triggerEvent('Change Character', 'dad', 'hog');
		triggerEvent('Change Character', 'dad', 'bf-encore-black');
		triggerEvent('Change Character', 'dad', 'exe-encore');
		triggerEvent('Change Character', 'dad', 'scorched');
		triggerEvent('Change Character', 'dad', 'ycr-mad-cherribun');
		triggerEvent('Change Character', 'dad', 'bf-encore-small');
		triggerEvent('Change Character', 'dad', 'majin-flipped');
		triggerEvent('Change Character', 'dad', 'tailsdoll-flipped');
		triggerEvent('Change Character', 'dad', 'sanic-flipped');
		triggerEvent('Change Character', 'dad', 'Tails-Encore-flipped');
		triggerEvent('Change Character', 'dad', 'true-fatal');
		triggerEvent('Change Character', 'dad', 'wechBeast-flipped');
		triggerEvent('Change Character', 'dad', 'coldsteel-flipped');
		triggerEvent('Change Character', 'dad', 'scorched-flipped');
		triggerEvent('Change Character', 'dad', 'Needlemouse-flipped');
		triggerEvent('Change Character', 'dad', 'bf-needle-encore-small');
		triggerEvent('Change Character', 'dad', 'bf-encore-pixel-smaller');
		triggerEvent('Change Character', 'dad', 'bf-pixel-normal');
		triggerEvent('Change Character', 'dad', 'faker_pixel');
		
		triggerEvent('Change Character', 'gf', 'xterion-first');
		triggerEvent('Change Character', 'gf', 'bf-john9doe-3d-xterion');
		triggerEvent('Change Character', 'gf', 'tailsdoll');
		triggerEvent('Change Character', 'gf', 'bf-john9doe-3d');
		triggerEvent('Change Character', 'gf', 'xterion-second');
		triggerEvent('Change Character', 'gf', 'Needlemouse');
		triggerEvent('Change Character', 'gf', 'bf-needle-encore');
		triggerEvent('Change Character', 'gf', 'Tails-Encore');
		triggerEvent('Change Character', 'gf', 'bf-encore');
		triggerEvent('Change Character', 'gf', 'gf');
		triggerEvent('Change Character', 'gf', 'fleetway');
		triggerEvent('Change Character', 'gf', 'sonic');
		triggerEvent('Change Character', 'gf', 'fleetway-anims3');
		triggerEvent('Change Character', 'gf', 'Chaotix');
		triggerEvent('Change Character', 'gf', 'bf-encore-pixel-small');
		triggerEvent('Change Character', 'gf', 'Knuckles-Encore');
		triggerEvent('Change Character', 'gf', 'bf-encore-flipped');
		triggerEvent('Change Character', 'gf', 'chaotix-hd');
		triggerEvent('Change Character', 'gf', 'wechBeast');
		triggerEvent('Change Character', 'gf', 'bf-encore-red');
		triggerEvent('Change Character', 'gf', 'wechBeast-flipped');
		triggerEvent('Change Character', 'gf', 'Satanos');
		triggerEvent('Change Character', 'gf', 'Eggman-Encore');
		triggerEvent('Change Character', 'gf', 'sonicexe');
		triggerEvent('Change Character', 'gf', 'lordxEncore');
		triggerEvent('Change Character', 'gf', 'fatal-sonic');
		triggerEvent('Change Character', 'gf', 'bf-encore-pixel');
		triggerEvent('Change Character', 'gf', 'ycr-cherribun');
		triggerEvent('Change Character', 'gf', 'BEAST-Enc');
		triggerEvent('Change Character', 'gf', 'Encore-right');
		triggerEvent('Change Character', 'gf', 'majin');
		triggerEvent('Change Character', 'gf', 'bf-encore-majin');
		triggerEvent('Change Character', 'gf', 'sunky');
		triggerEvent('Change Character', 'gf', 'sanic');
		triggerEvent('Change Character', 'gf', 'coldsteel');
		triggerEvent('Change Character', 'gf', 'coldsteel_guitar');
		triggerEvent('Change Character', 'gf', 'faker-encore');
		triggerEvent('Change Character', 'gf', 'hog');
		triggerEvent('Change Character', 'gf', 'bf-encore-black');
		triggerEvent('Change Character', 'gf', 'exe-encore');
		triggerEvent('Change Character', 'gf', 'scorched');
		triggerEvent('Change Character', 'gf', 'ycr-mad-cherribun');
		triggerEvent('Change Character', 'gf', 'bf-encore-small');
		triggerEvent('Change Character', 'gf', 'majin-flipped');
		triggerEvent('Change Character', 'gf', 'tailsdoll-flipped');
		triggerEvent('Change Character', 'gf', 'sanic-flipped');
		triggerEvent('Change Character', 'gf', 'Tails-Encore-flipped');
		triggerEvent('Change Character', 'gf', 'true-fatal');
		triggerEvent('Change Character', 'gf', 'wechBeast-flipped');
		triggerEvent('Change Character', 'gf', 'coldsteel-flipped');
		triggerEvent('Change Character', 'gf', 'scorched-flipped');
		triggerEvent('Change Character', 'gf', 'Needlemouse-flipped');
		triggerEvent('Change Character', 'gf', 'bf-needle-encore-small');
		triggerEvent('Change Character', 'gf', 'bf-encore-pixel-smaller');
		triggerEvent('Change Character', 'gf', 'bf-pixel-normal');
		triggerEvent('Change Character', 'gf', 'faker_pixel');
		
		triggerEvent('Change Character', 'bf', 'xterion-first');
		triggerEvent('Change Character', 'bf', 'bf-john9doe-3d-xterion');
		triggerEvent('Change Character', 'bf', 'tailsdoll');
		triggerEvent('Change Character', 'bf', 'bf-john9doe-3d');
		triggerEvent('Change Character', 'bf', 'xterion-second');
		triggerEvent('Change Character', 'bf', 'Needlemouse');
		triggerEvent('Change Character', 'bf', 'bf-needle-encore');
		triggerEvent('Change Character', 'bf', 'Tails-Encore');
		triggerEvent('Change Character', 'bf', 'bf-encore');
		triggerEvent('Change Character', 'bf', 'bf');
		triggerEvent('Change Character', 'bf', 'fleetway');
		triggerEvent('Change Character', 'bf', 'sonic');
		triggerEvent('Change Character', 'bf', 'fleetway-anims3');
		triggerEvent('Change Character', 'bf', 'Chaotix');
		triggerEvent('Change Character', 'bf', 'bf-encore-pixel-small');
		triggerEvent('Change Character', 'bf', 'Knuckles-Encore');
		triggerEvent('Change Character', 'bf', 'bf-encore-flipped');
		triggerEvent('Change Character', 'bf', 'chaotix-hd');
		triggerEvent('Change Character', 'bf', 'wechBeast');
		triggerEvent('Change Character', 'bf', 'bf-encore-red');
		triggerEvent('Change Character', 'bf', 'wechBeast-flipped');
		triggerEvent('Change Character', 'bf', 'Satanos');
		triggerEvent('Change Character', 'bf', 'Eggman-Encore');
		triggerEvent('Change Character', 'bf', 'sonicexe');
		triggerEvent('Change Character', 'bf', 'lordxEncore');
		triggerEvent('Change Character', 'bf', 'fatal-sonic');
		triggerEvent('Change Character', 'bf', 'bf-encore-pixel');
		triggerEvent('Change Character', 'bf', 'ycr-cherribun');
		triggerEvent('Change Character', 'bf', 'BEAST-Enc');
		triggerEvent('Change Character', 'bf', 'Encore-right');
		triggerEvent('Change Character', 'bf', 'majin');
		triggerEvent('Change Character', 'bf', 'bf-encore-majin');
		triggerEvent('Change Character', 'bf', 'sunky');
		triggerEvent('Change Character', 'bf', 'sanic');
		triggerEvent('Change Character', 'bf', 'coldsteel');
		triggerEvent('Change Character', 'bf', 'coldsteel_guitar');
		triggerEvent('Change Character', 'bf', 'faker-encore');
		triggerEvent('Change Character', 'bf', 'hog');
		triggerEvent('Change Character', 'bf', 'bf-encore-black');
		triggerEvent('Change Character', 'bf', 'exe-encore');
		triggerEvent('Change Character', 'bf', 'scorched');
		triggerEvent('Change Character', 'bf', 'ycr-mad-cherribun');
		triggerEvent('Change Character', 'bf', 'bf-encore-small');
		triggerEvent('Change Character', 'bf', 'majin-flipped');
		triggerEvent('Change Character', 'bf', 'tailsdoll-flipped');
		triggerEvent('Change Character', 'bf', 'sanic-flipped');
		triggerEvent('Change Character', 'bf', 'Tails-Encore-flipped');
		triggerEvent('Change Character', 'bf', 'true-fatal');
		triggerEvent('Change Character', 'bf', 'wechBeast-flipped');
		triggerEvent('Change Character', 'bf', 'coldsteel-flipped');
		triggerEvent('Change Character', 'bf', 'scorched-flipped');
		triggerEvent('Change Character', 'bf', 'Needlemouse-flipped');
		triggerEvent('Change Character', 'bf', 'bf-needle-encore-small');
		triggerEvent('Change Character', 'bf', 'bf-encore-pixel-smaller');
		triggerEvent('Change Character', 'bf', 'bf-pixel-normal');
		triggerEvent('Change Character', 'bf', 'faker_pixel');
		preload = false;
	end
end
function onBeatHit()
	if curBeat > 1999 and curBeat < 2064 then
		triggerEvent('Philly Glow', 1, '');
		triggerEvent('Philly Glow', 2, '');
	end
	if curBeat % 2 == 0 and curStep >= 12496 and curStep <= 12751 then
		triggerEvent('Add Camera Zoom', 0.06, 0);
	end
	if curBeat % beat == 0 then
		setProperty('VG3.alpha',0.7);
		doTweenAlpha('VG3Tween', 'VG3', 0, 0.4, 'linear');
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote, gfSection)
	if noteType == 'DAD and GF' then
		setProperty('gf.idleSuffix','-nothing')
		runTimer('gf-idle', 0.3)
		if direction == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'gf')
		end
		if direction == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'gf')
		end
		if direction == 2 then
			triggerEvent('Play Animation', 'singUP', 'gf')
		end
		if direction == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'gf')
		end
	end
	if noteType == 'DAD and GF' and gfSection then
		setProperty('dad.idleSuffix','-nothing')
		runTimer('dad-idle', 0.3)
		if direction == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'dad')
		end
		if direction == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'dad')
		end
		if direction == 2 then
			triggerEvent('Play Animation', 'singUP', 'dad')
		end
		if direction == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'dad')
		end
	end
	if noteType == 'ALL' then
		setProperty('gf.idleSuffix','-nothing')
		runTimer('gf-idle', 0.3)
		if direction == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'gf')
		end
		if direction == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'gf')
		end
		if direction == 2 then
			triggerEvent('Play Animation', 'singUP', 'gf')
		end
		if direction == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'gf')
		end
	end
	if curStep >= 12815 then
		setProperty('dad.idleSuffix','-nothing')
		runTimer('dad-idle', 0.3)
		if direction == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'dad')
		end
		if direction == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'dad')
		end
		if direction == 2 then
			triggerEvent('Play Animation', 'singUP', 'dad')
		end
		if direction == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'dad')
		end
	end
	local strumTime = ''
	local frameName = ''
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		if not isSustainNote and noteType == '' and not getPropertyFromGroup('notes', i, 'gfNote') or noteType == 'DAD and GF' and not isSustainNote then
			strumTime = dadName..getPropertyFromGroup('notes', id, 'strumTime')
			if ddRows[strumTime] then
				ghostTrail('dad', ddRows[strumTime], isSustainNote)
			end
			frameName = getProperty('dad.animation.frameName')
			frameName = string.sub(frameName, 1, string.len(frameName) - 3)
			ddRows[strumTime] = {frameName, getProperty('dad.offset.x'), getProperty('dad.offset.y')}
			runTimer('dadghost',0.01)
		end
		if gfNote or noteType == 'DAD and GF' or getPropertyFromGroup('notes', i, 'gfNote') or noteType == 'DAD and GF' then
			if not isSustainNote then
				strumTime = gfName..getPropertyFromGroup('notes', id, 'strumTime')
				if gfRows[strumTime] then
					ghostTrail('gf', gfRows[strumTime], isSustainNote)
				end
				frameName = getProperty('gf.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				gfRows[strumTime] = {frameName, getProperty('gf.offset.x'), getProperty('gf.offset.y')}
				runTimer('gfghost',0.01)
			end
		end
	end
end
function ghostTrail(char, noteData, reactivate)
	local ghost = char..'Ghost'
	local group = char
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		if char == 'mom' then
			group = 'dad'
		end
		makeAnimatedLuaSprite(ghost, getProperty(char..'.imageFile'), getProperty(char..'.x'), getProperty(char..'.y'))
		addAnimationByPrefix(ghost, 'idle', noteData[1], 24, false)
		setProperty(ghost..'.antialiasing', getProperty(char..'.antialiasing'))
		setProperty(ghost..'.offset.x', noteData[2])
		setProperty(ghost..'.offset.y', noteData[3])
		setProperty(ghost..'.scale.x', getProperty(char..'.scale.x'))
		setProperty(ghost..'.scale.y', getProperty(char..'.scale.y'))
		setProperty(ghost..'.flipX', getProperty(char..'.flipX'))
		setProperty(ghost..'.flipY', getProperty(char..'.flipY'))
		setProperty(ghost..'.visible', getProperty(char..'.visible'))
		setProperty(ghost..'.color', getIconColor(char))
		setProperty(ghost..'.alpha', 0.8 * getProperty(char..'.alpha'))
		setBlendMode(ghost, 'hardlight')
		addLuaSprite(ghost)
		playAnim(ghost, 'idle', true)
		setObjectOrder(ghost, getObjectOrder(group..'Group') - 0.1)
		cancelTween(ghost)
		doTweenAlpha(ghost, ghost, 0, 0.75, 'linear')

		local stage = string.lower(curStage)
	end
end
function onTweenCompleted(tag)
	if string.match(tag, 'Ghost') then
		removeLuaSprite(tag, true)
	end
	if tag == 'jump1' and curStep <= 6640 then
		doTweenAlpha('jump2', 'simplejump', 0, 0.3875, 'linear');
	end
	if tag == 'jump2' and curStep <= 6640 then
		doTweenAlpha('jump1', 'simplejump', 1, 0.3875, 'linear');
	end
	if tag == 'startstuff5' then
		setProperty('white.alpha',1);
		doTweenAlpha('startstuff6', 'white', 0, 0.5, 'linear')
		removeLuaSprite('red');
		removeLuaSprite('text')
		removeLuaSprite('black')
	end
	if tag == 'startstuff6' then
		removeLuaSprite('white');
	end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end

function goodNoteHit(id, direction, noteType, isSustainNote, gfNote)
	if getPropertyFromGroup('notes', id, 'gfNote') == true and mustHitSection == true or getPropertyFromGroup('notes', id, 'gfNote') == 'GF Sing' and mustHitSection == true then
		if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
		end
		if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
		end
		if getProperty('gf.animation.curAnim.name') == 'singUP' then
			triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
		end
		if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
		end	
		if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx3,yy3)
		end
		if getProperty('gf.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx3,yy3)
		end
	end
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		if not isSustainNote and noteType == '' or noteType == 'GF and BF' and not isSustainNote then
			if not getPropertyFromGroup('notes', id, 'gfNote') then
				local strumTime = boyfriendName..getPropertyFromGroup('notes', id, 'strumTime')
				if bfRows[strumTime] then
					ghostTrail('boyfriend', bfRows[strumTime], isSustainNote)
				end
				local frameName = getProperty('boyfriend.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				bfRows[strumTime] = {frameName, getProperty('boyfriend.offset.x'), getProperty('boyfriend.offset.y')}
				runTimer('bfghost',0.01)
			end
		end
		if getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF and BF' then
			if not isSustainNote then
				local strumTime = gfName..getPropertyFromGroup('notes', id, 'strumTime')
				if gfRows[strumTime] then
					ghostTrail('gf', gfRows[strumTime], isSustainNote)
				end
				local frameName = getProperty('gf.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				gfRows[strumTime] = {frameName, getProperty('gf.offset.x'), getProperty('gf.offset.y')}
				runTimer('gfghost',0.01)
			end
		end
	end
	if noteType == 'GF and BF' then
		setProperty('gf.idleSuffix','-nothing')
		runTimer('gf-idle', 0.3)
		if direction == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'gf')
		end
		if direction == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'gf')
		end
		if direction == 2 then
			triggerEvent('Play Animation', 'singUP', 'gf')
		end
		if direction == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'gf')
		end
	end
	if noteType == 'GF and BF' and gfSection then
		setProperty('boyfriend.idleSuffix','-nothing')
		runTimer('bf-idle', 0.3)
		if direction == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'bf')
		end
		if direction == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'bf')
		end
		if direction == 2 then
			triggerEvent('Play Animation', 'singUP', 'bf')
		end
		if direction == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'bf')
		end
	end
	if curStep >= 12815 then
		setProperty('boyfriend.idleSuffix','-nothing')
		runTimer('bf-idle', 0.3)
		if direction == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'bf')
		end
		if direction == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'bf')
		end
		if direction == 2 then
			triggerEvent('Play Animation', 'singUP', 'bf')
		end
		if direction == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'bf')
		end
	end
end
function onNoteMiss()
	if getPropertyFromGroup('notes', id, 'gfNote') and gfMoment == true and mustHitSection == true then
		if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
		end
		if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
		end
		if getProperty('gf.animation.curAnim.name') == 'singUP' then
			triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
		end
		if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
		end	
		if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx3,yy3)
		end
		if getProperty('gf.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx3,yy3)
		end
	end
end
function onEvent(name, value1, value2)
	if name == 'badapplelol' and value1 == 'a' and hasSpawned2 == false then
		makeLuaSprite('whitebg2', '', -2000, -1000)
		setScrollFactor('whitebg2', 0, 0)
		makeGraphic('whitebg2', 3920, 3080, 'ffffff')
		addLuaSprite('whitebg2', false)
		screenCenter('whitebg2');
		setProperty('whitebg2.alpha', 0.00001)
		doTweenAlpha('applebadxd69', 'whitebg2', 1, value2, 'linear')
		doTweenColor('badapplexd', 'boyfriend', '000000', value2, 'linear')
		doTweenColor('badapplexd1', 'dad', '000000', value2, 'linear')
		doTweenColor('badapplexd2', 'gf', '000000', value2, 'linear')
		doTweenColor('badapplexd2', 'true-fatal', '000000', value2, 'linear')
		doTweenColor('badapplexd6', 'healthBar', '000000', value2, 'linear')
		doTweenColor('badapplexd100', 'iconP1', '000000', value2, 'linear')
		doTweenColor('badapplexd10', 'iconP2', '000000', value2, 'linear')
		hasSpawned2 = true
	end
	if name == 'badapplelol' and value1 == 'a' and hasSpawned2 == true then
		doTweenAlpha('applebadxd69', 'whitebg2', 1, value2, 'linear')
		doTweenColor('badapplexd', 'boyfriend', '000000', value2, 'linear')
		doTweenColor('badapplexd1', 'dad', '000000', value2, 'linear')
		doTweenColor('badapplexd2', 'gf', '000000', value2, 'linear')
		doTweenColor('badapplexd2', 'true-fatal', '000000', value2, 'linear')
		doTweenColor('badapplexd6', 'healthBar', '000000', value2, 'linear')
		doTweenColor('badapplexd100', 'iconP1', '000000', value2, 'linear')
		doTweenColor('badapplexd10', 'iconP2', '000000', value2, 'linear')
	end
	if name == 'badapplelol' and value1 == 'b' then
		doTweenAlpha('applebadxd', 'whitebg2', 0.00001, value2, 'linear')
		doTweenColor('badapplexd3', 'boyfriend', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd4', 'dad', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd5', 'gf', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd5', 'true-fatal', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd7', 'healthBar', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd101', 'iconP1', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd11', 'iconP2', 'FFFFFF', value2, 'linear')
	end
	if name == "Cam Zoom" then
        if value1 ~= nil and value2 ~= nil then
            local zoom = tonumber(value1)
            local v = stringSplit(value2, ', ')
            local speed = v[1]
            local ease = v[2]
            startTween('camz', 'this', {defaultCamZoom = zoom, ['camGame.zoom'] = zoom}, speed, {ease = ease})
        end
    end
	if name == 'funnyHudStuff' then
		if value1 == '1' then --hide notes bf
			noteTweenAlpha('BFAlpha1', 4, 0, value2, 'easeIn');
			noteTweenAlpha('BFAlpha2', 5, 0, value2, 'easeIn');
			noteTweenAlpha('BFAlpha3', 6, 0, value2, 'easeIn');
			noteTweenAlpha('BFAlpha4', 7, 0, value2, 'easeIn');
		end
		if value1 == '2' then --fix notes bf
			noteTweenAlpha('BFAlpha1', 4, 1, value2, 'easeIn');
			noteTweenAlpha('BFAlpha2', 5, 1, value2, 'easeIn');
			noteTweenAlpha('BFAlpha3', 6, 1, value2, 'easeIn');
			noteTweenAlpha('BFAlpha4', 7, 1, value2, 'easeIn');
		end
		if value1 == '3' then
			noteTweenAlpha('OpponentAlpha1', 0, 0, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha2', 1, 0, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha3', 2, 0, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha4', 3, 0, value2, 'easeIn');
		end
		if value1 == '4' then
			noteTweenAlpha('OpponentAlpha1', 0, 1, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha2', 1, 1, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha3', 2, 1, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha4', 3, 1, value2, 'easeIn');
		end
		if value1 == '5' then --hide healthBar
			doTweenAlpha('icon1Tween', 'iconP1', 0, value2, 'easeIn');
			doTweenAlpha('icon2Tween', 'iconP2', 0, value2, 'easeIn');
			doTweenAlpha('healthBarTween', 'healthBar', 0, value2, 'easeIn');
			doTweenAlpha('healthBarBGTween', 'healthBarBG', 0, value2, 'easeIn');
			doTweenAlpha('scoreTween', 'scoreTxt', 0, value2, 'easeIn');
		end
		if value1 == '6' then --show healthBar
			doTweenAlpha('icon1Tween', 'iconP1', 1, value2, 'easeIn');
			doTweenAlpha('icon2Tween', 'iconP2', 1, value2, 'easeIn');
			doTweenAlpha('healthBarTween', 'healthBar', 1, value2, 'easeIn');
			doTweenAlpha('healthBarBGTween', 'healthBarBG', 1, value2, 'easeIn');
			doTweenAlpha('scoreTween', 'scoreTxt', 1, value2, 'easeIn');
		end
		if value1 == '7' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --swap notes
			noteTweenX('XDAD1', 0, 732, 0.1, 'quartInOut');
			noteTweenX('XDAD2', 1, 844, 0.1, 'quartInOut');
			noteTweenX('XDAD3', 2, 956, 0.1, 'quartInOut');
			noteTweenX('XDAD4', 3, 1068, 0.1, 'quartInOut');
			noteTweenX('XBF1', 4, 92, 0.1, 'quartInOut');
			noteTweenX('XBF2', 5, 204, 0.1, 'quartInOut');
			noteTweenX('XBF3', 6, 316, 0.1, 'quartInOut');
			noteTweenX('XBF4', 7, 428, 0.1, 'quartInOut');
		end
		if value1 == '8' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --reswap notes
			noteTweenX('XBF1', 4, 732, 0.1, 'quartInOut');
			noteTweenX('XBF2', 5, 844, 0.1, 'quartInOut');
			noteTweenX('XBF3', 6, 956, 0.1, 'quartInOut');
			noteTweenX('XBF4', 7, 1068, 0.1, 'quartInOut');
			noteTweenX('XDAD1', 0, 92, 0.1, 'quartInOut');
			noteTweenX('XDAD2', 1, 204, 0.1, 'quartInOut');
			noteTweenX('XDAD3', 2, 316, 0.1, 'quartInOut');
			noteTweenX('XDAD4', 3, 428, 0.1, 'quartInOut');
		end
		if value1 == '9' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --middle
			noteTweenX('MiddleXBF0', 4, 422, 2, 'quartInOut');
			runTimer('middle1',0.1);
			runTimer('middle2',0.2);
			runTimer('middle3',0.3);
		end
		if value1 == '10' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --middle opp
			noteTweenX('MiddleXDAD0', 3, 752, 0.5, 'quartInOut');
			runTimer('middle4',0.05);
			runTimer('middle5',0.1);
			runTimer('middle6',0.15);
		end
		if value1 == '11' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --move back
			noteTweenX('XDAD1', 0, 92, value2, 'quartInOut');
			noteTweenX('XDAD2', 1, 204, value2, 'quartInOut');
			noteTweenX('XDAD3', 2, 316, value2, 'quartInOut');
			noteTweenX('XDAD4', 3, 428, value2, 'quartInOut');
		end
	end
    if name == 'badapplelolFlash' then
        setProperty('iconP1.color', 0x000000);
        setProperty('iconP2.color', 0x000000);
        setProperty('healthBar.alpha',0);
        setProperty('boyfriend.color', 0x000000);
        setProperty('gf.color', 0x000000);
        setProperty('dad.color', 0x000000);
        screenCenter('whitebg');
        addLuaSprite('whitebg', false)
        setProperty('gfGroup.alpha',0);
        setProperty('dadGroup.alpha',0);
        setProperty('boyfriendGroup.alpha',0);
        setProperty('boyfriend.alpha',1);
        setProperty('dad.alpha',1);
        setProperty('gf.alpha',1);
        setProperty('whitebg.alpha',1);
        runTimer('reset', value1);
        doTweenAlpha('applebadxd', 'whitebg', 0.00001, value1, 'linear')
        doTweenColor('badapplexd3', 'boyfriend', 'FFFFFF', value1, 'linear')
        doTweenColor('badapplexd4', 'dad', 'FFFFFF', value1, 'linear')
        doTweenColor('badapplexd5', 'gf', 'FFFFFF', value1, 'linear')
        doTweenAlpha('badapplexd7', 'healthBar', 1, value1, 'linear')
        doTweenColor('badapplexd101', 'iconP1', 'FFFFFF', value1, 'linear')
        doTweenColor('badapplexd11', 'iconP2', 'FFFFFF', value1, 'linear')
    end
	if name == 'phasestatic' then
		fps = framecount / value1;
		
		makeAnimatedLuaSprite('staticstuff', 'Phase3Static', 0, 0);
		setScrollFactor('staticstuff', 1, 1);
		addAnimationByPrefix('staticstuff', 'idle', 'Phase3Static instance 1', fps, false);
		setProperty('staticstuff.antialiasing', false);
		scaleObject('staticstuff', 5, 5);
		if value2 == '' and curStep >= 16 then
			setProperty('staticstuff.alpha',0.5);
		else
			setProperty('staticstuff.alpha',value2);
		end
		setObjectCamera('staticstuff', 'camOther');
		screenCenter('staticstuff');
		addLuaSprite('staticstuff', true);
		objectPlayAnimation('staticstuff', 'idle', true)
		runTimer('end',value1);
	end
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		if name == 'Change Character' and value1 == 'dad' or name == 'Change Character' and value1 == 'bf' then
			setProperty('boyfriendGhost.alpha',0);
			setProperty('dadGhost.alpha',0);
			removeLuaSprite('dadGhost');
			removeLuaSprite('boyfriendGhost');
		end
	end
    if name == 'Cam Speed' then
        setProperty('cameraSpeed', tonumber(value1))
    end
	if name == 'Flash Camera red' and getPropertyFromClass('states.PlayState','chartingMode') == false then
		makeLuaSprite('flashred', '', 0, 0);
		makeGraphic('flashred',1920,1080,'FF0000')
		setLuaSpriteScrollFactor('flashred',0,0)
		setProperty('flashred.scale.x',2)
		setProperty('flashred.scale.y',2)
		setObjectCamera('flashred', 'HUD')
		doTweenAlpha('flTw','flashred',0,value1,'linear')
		addLuaSprite('flashred', true);
	end
	if name == 'Flash Camera' and getPropertyFromClass('states.PlayState','chartingMode') == false then
		makeLuaSprite('flash', '', 0, 0);
		if value2 == '' then
			setProperty('flash.alpha',1);
		else
			setProperty('flash.alpha',value2);
		end
		makeGraphic('flash',1920,1080,'FFFFFF')
		addLuaSprite('flash', true);
		setLuaSpriteScrollFactor('flash',0,0)
		setProperty('flash.scale.x',2)
		setProperty('flash.scale.y',2)
		setObjectCamera('flash', 'HUD')
		setProperty('flash.alpha',1);
		screenCenter('flash');
		doTweenAlpha('flTw','flash',0,value1,'linear')
	end
	if name == 'Trigger VG' then
		beat = value1;
		color2 = value2;
		stop2 = false;
		doTweenColor('VG3Color', 'VG3', color2, 0.00001, 'linear');
		setProperty('VG3.alpha',0.7);
		doTweenAlpha('VG3Tween', 'VG3', 0, 0.4, 'linear');
	end
	if name == 'Trigger VG' and value1 == '0' then
		beat = 0;
		stop2 = true;
		cancelTween('VG3Color');
		cancelTween('VG3Tween');
		setProperty('VG3.alpha',0);
	end
	if name == 'VG Pulse' then
		if value1 == '0' then
			cancelTimer('First');
			cancelTimer('Second');
			doTweenAlpha('VG3Tween', 'VG2', 0, vgspeed);
			vgspeed = 0;
			stop = true;
			cancelTween('VG2Color');
			cancelTween('VG2Tween');
		else
			stop = false;
			vgspeed = value1;
			color = value2;
			doTweenColor('VG2Color', 'VG2', color, 0.00001, 'linear');
			doTweenAlpha('VG3Tween', 'VG2', 0.7, vgspeed, 'linear');
			setProperty('VG2.alpha',0);
			runTimer('First',vgspeed);
		end
	end
	if name == 'Change Character' then
		setProperty('health', getProperty('health') - 0.000001);
		setTimeBarColors(string.format('%02x%02x%02x', unpack(getProperty('dad.healthColorArray'))));
	end
	if name == 'Change Character' and curStep >= 12239 and curStep <= 12780 then
		triggerEvent('Flash Camera', 0.6, '');
		setProperty('boyfriend.color', 0x000000);
		setProperty('dad.color', 0x000000);
		setProperty('gf.color', 0x000000);
		setProperty('iconP1.color', 0x000000);
		setProperty('iconP2.color', 0x000000);
		setProperty('healthBar.color', 0x000000);
		setProperty('healthBarP1.color', 0x000000);
		setProperty('healthBarP2.color', 0x000000);
		setProperty('true-fatal.color', 0x000000);
	end
	if name == 'Better Cinematics' then
		CinSpeed = tonumber(value1)
		Distance = tonumber(value2)
	end
	if CinSpeed > 0 then	
		doTweenY('Cinematics1', 'UpperBar', UpperBar + Distance, CinSpeed, 'QuadOut')
		doTweenY('Cinematics2', 'LowerBar', LowerBar - Distance, CinSpeed, 'QuadOut')
		for Alphas = 1,8 do
		doTweenAlpha('Alpha'..Alphas, HudPieces[index], 0, CinSpeed - 0.1)
		index = index + 1
			if index > #HudPieces then
				index = 1
			end
		end
	end
	if downscroll and CinSpeed > 0 then	
		doTweenY('Cinematics1', 'UpperBar', UpperBar + Distance, CinSpeed, 'QuadOut')
		doTweenY('Cinematics2', 'LowerBar', LowerBar - Distance, CinSpeed, 'QuadOut')
		for Alphas = 1,8 do
		doTweenAlpha('Alpha'..Alphas, HudPieces[index], 0, CinSpeed - 0.1)
		index = index + 1
			if index > #HudPieces then
				index = 1
			end
		end
	end
	if Distance <= 0 then
		for Alphas = 1,8 do
		doTweenAlpha('Alpha'..Alphas, HudPieces[index], 1, CinSpeed - 0.1)
		index = index + 1
			if index > #HudPieces then
				index = 1
			end
		end
	end
end