local xx = 600;
local yy = 380;
local ofs = 20;
local ofs2 = 20;
local xx2 = 900;
local yy2 = 480;
local forceCamera = true;
local wechBeastMoment = false;
local satanosMoment = false;
local fatalMoment = false;
local exeMoment = false;
local scorchedMoment = false;
local finalMoment = false;
local fakerpixelMoment = false;

function onCreate()
	makeLuaSprite('flashingshit', '', 0, 0);
	makeGraphic('flashingshit',1920,1080,'000000')
	addLuaSprite('flashingshit', true);
	setLuaSpriteScrollFactor('flashingshit',0,0)
	setProperty('flashingshit.scale.x',2)
	setProperty('flashingshit.scale.y',2)
	setProperty('flashingshit.alpha',0)
	setObjectCamera('flashingshit', 'other')

	addCharacterToList('wechBeast', 'dad');
	addCharacterToList('wechBeast-flipped', 'dad');
	addCharacterToList('wechBeast-flipped', 'gf');
	addCharacterToList('Satanos', 'dad');
	addCharacterToList('lordxEncore', 'dad');

	precacheSong('omnipresent/Inst');
	precacheSong('omnipresent/Voices-Opponent');
	precacheSong('omnipresent/Voices-Player');

	makeLuaSprite('faker_pixel', 'bgs/faker-encore/fakerpixel', 0, 0);
	scaleObject('faker_pixel', 1, 1);
	setScrollFactor('faker_pixel', 1, 1);
	setProperty('faker_pixel.antialiasing', false);
	setProperty('faker_pixel.visible', false);
	addLuaSprite('faker_pixel', false);

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
	
	makeLuaSprite('simplejump', 'epicjump', 0, 0);
	setScrollFactor('simplejump', 0, 0);
	setGraphicSize('simplejump',screenWidth,screenHeight);
	setProperty('simplejump.antialiasing', true);
	setProperty('simplejump.visible', false);
	setObjectCamera('simplejump','camHUD');
	screenCenter('simplejump');
	addLuaSprite('simplejump', false);
end
function onUpdate(elapsed)
	if finalMoment == true then
		setProperty('defaultCamZoom',1);
		setProperty('cameraSpeed',200);
		setProperty('dadGroup.alpha',0.5);
		setProperty('gfGroup.alpha',0.5);
		setProperty('true-fatal.alpha',0.5);
		ofs = 0;
		ofs2 = 0;
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
		if mustHitSection == false then
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
        else
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
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
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min)
end
function onStepHit()
	if curStep == 6607 then
		setProperty('simplejump.visible',true);
		setProperty('simplejump.alpha',0);
		doTweenAlpha('jump1', 'simplejump', 1, 0.3875, 'linear');
	end
	if curStep == 6640 then
		removeLuaSprite('simplejump');
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
		xx2 = 900;
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
		xx = 600;
		yy = 680;
		xx2 = 1100;
		yy2 = 680;
		setProperty('boyfriendGroup.x',975);
		setProperty('boyfriendGroup.y',375);
		setProperty('dadGroup.x',20);
		setProperty('dadGroup.y',365);
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
		xx2 = 2050;
		yy2 = 830;
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
		setProperty('dadGroup.x',90);
		setProperty('dadGroup.y',170);
		setProperty('gfGroup.x',2460);
		setProperty('gfGroup.y',500);
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
		xx = 1550;
		yy = 1450;
		xx2 = 1650;
		yy2 = 1650;
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
		yy = 230;
		xx2 = 1350;
		yy2 = 330;
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
		xx2 = 795;
		yy2 = 640;
		setProperty('boyfriendGroup.x',1000);
		setProperty('boyfriendGroup.y',275);
		setProperty('dadGroup.x',75);
		setProperty('dadGroup.y',20);
		setProperty('gfGroup.x',400);
		setProperty('gfGroup.y',175);
		setProperty('defaultCamZoom', 0.9);
	end
	if curStep == 5968 or curStep == 6224 or curStep == 6416 or curStep == 11456 or curStep == 11584 then --fatal error
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 150;
		yy = 340;
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
		setObjectOrder('dadGroup', 100)
		setObjectOrder('gfGroup', 101)
		setObjectOrder('boyfriendGroup', 102)
	end
	if curStep == 6768 or curStep == 6912 or curStep == 6944 or curStep == 11504 or curStep == 11616 then --majin
		fatalMoment = false;
		runTimer('ringStart',0.1);
		runTimer('ringFinish',0.2);
		xx = 800;
		yy = 625;
		xx2 = 1100;
		yy2 = 625;
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
		xx = 970;
		yy = 325;
		xx2 = 1250;
		yy2 = 325;
		setProperty('boyfriendGroup.x',1325);
		setProperty('boyfriendGroup.y',-75);
		setProperty('dadGroup.x',370);
		setProperty('dadGroup.y',-100);
		setProperty('gfGroup.x',790);
		setProperty('gfGroup.y',0);
		setProperty('defaultCamZoom',0.77);
		setObjectOrder('gfGroup', 104)
		setObjectOrder('dadGroup', 105)
		setObjectOrder('boyfriendGroup', 106)
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
		xx = 1000;
		yy = 695;
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
		setProperty('dadGroup.y',75);
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
		yy = -50;
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
		setObjectOrder('eggman_bg',104);
		setObjectOrder('eggman_eys',105);
		setObjectOrder('gfGroup', 114)
		setObjectOrder('dadGroup', 115)
		setObjectOrder('boyfriendGroup', 116)
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
		setProperty('defaultCamZoom',0.6);
		setObjectOrder('dadGroup', 100)
		setObjectOrder('gfGroup', 101)
		setObjectOrder('boyfriendGroup', 102)
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
		setObjectOrder('gfGroup',1000);
		setObjectOrder('dadGroup',1001);
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
		setProperty('gfGroup.x',1200);
		setProperty('gfGroup.y',80);
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
	if curStep == 688 or curStep == 3544 or curStep == 8960 then
		setProperty('gf.alpha',0.7);
		triggerEvent('Flash Camera', 0.6, '');
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
		doTweenAlpha('gfAlpha', 'sunky', 0.8, 0.2, 'linear');
	end
	if curStep == 8456 then
		doTweenAlpha('gfAlpha', 'gf', 0, 0.5, 'linear');
		doTweenAlpha('gfAlpha', 'sunky', 0, 0.5, 'linear');
	end
	if curStep == 8976 then
		doTweenAlpha('gfAlpha', 'gf', 0, 1, 'linear');
	end
	if curStep == 9840 then
		doTweenAlpha('gfAlpha', 'gf', 0, 1.55, 'linear');
	end
	if curStep == 12207 then
		doTweenAlpha('hudAlpha', 'camHUD', 0, 1.29, 'linear');
		doTweenAlpha('flashingshitAlpha', 'flashingshit', 1, 0.3225, 'linear');
	end
	if curStep == 12224 then
		doTweenAlpha('hudAlpha', 'camHUD', 1, 1.29, 'linear');
		doTweenAlpha('flashingshitAlpha', 'flashingshit', 0, 1.29, 'linear');
	end
	if curStep == 12752 then
		doTweenAlpha('hudAlpha', 'camHUD', 0, 1.55, 'linear');
		doTweenAlpha('flashingshitAlpha', 'flashingshit', 0, 1.55, 'linear');
	end
	if curStep == 12816 then
		doTweenAlpha('flashingshitAlpha', 'flashingshit', 0, 6.2, 'linear');
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
	if curStep == 2176 then
		xx2 = 2250;
		yy2 = 930;
	end
	if curStep == 2192 then
		xx2 = 2050;
		yy2 = 830;
	end
	if curStep == 2384 then
		xx2 = 2250;
		yy2 = 930;
	end
	if curStep == 2448 then
		xx2 = 2050;
		yy2 = 830;
	end
	if curStep == 2688 then
		xx2 = 2250;
		yy2 = 930;
	end
	if curStep == 2696 or curStep == 2952 then
		xx2 = 300;
		yy2 = 400;
		ofs = 0;
		ofs2 = 0;
	end
	if curStep == 2704 or curStep == 2960 then
		xx2 = 2050;
		yy2 = 830;
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
		yy2 = 430;
	end
	if curStep == 4512 then
		xx2 = 1350;
		yy2 = 330;
	end
	if curStep == 4920 then
		xx2 = 1570;
		yy2 = 430;
	end
	if curStep == 4928 then
		xx2 = 1350;
		yy2 = 330;
	end
	if curStep == 5568 then
		xx2 = 1570;
		yy2 = 430;
	end
	if curStep == 7072 then
		xx = 470;
		yy = 170;
	end
end
function onSpawnNote()
    setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', false)
end
function onTimerCompleted(tag)
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
end
function onEvent(n, v1, v2)
	if n == 'Change Character' and curStep >= 12239 and curStep <= 12780 then
		triggerEvent('Flash Camera', 0.6, '');
		setProperty('boyfriendGroup.color', 000000);
		setProperty('dadGroup.color', 000000);
		setProperty('gfGroup.color', 000000);
		setProperty('iconP1.color', 000000);
		setProperty('iconP2.color', 000000);
		setProperty('healthBar.color', 000000);
		setProperty('healthBarP1.color', 000000);
		setProperty('healthBarP2.color', 000000);
		setProperty('true-fatal.color', 000000);
	end
end
function onBeatHit()
	if curBeat > 1999 and curBeat < 2064 then
		triggerEvent('Philly Glow', 1, '');
		triggerEvent('Philly Glow', 2, '');
	end
end
function opponentNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if curStep >= 12815 then
		setProperty('dad.idleSuffix','-nothing')
		runTimer('dad-idle', 0.3)
		if notedata == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'dad')
		end
		if notedata == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'dad')
		end
		if notedata == 2 then
			triggerEvent('Play Animation', 'singUP', 'dad')
		end
		if notedata == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'dad')
		end
	end
end
function goodNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if curStep >= 12815 then
		setProperty('boyfriend.idleSuffix','-nothing')
		runTimer('bf-idle', 0.3)
		if notedata == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'bf')
		end
		if notedata == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'bf')
		end
		if notedata == 2 then
			triggerEvent('Play Animation', 'singUP', 'bf')
		end
		if notedata == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'bf')
		end
	end
end
function onTweenCompleted(tag)
	if tag == 'jump1' and curStep <= 6640 then
		doTweenAlpha('jump2', 'simplejump', 0, 0.3875, 'linear');
	end
	if tag == 'jump2' and curStep <= 6640 then
		doTweenAlpha('jump1', 'simplejump', 1, 0.3875, 'linear');
	end
end