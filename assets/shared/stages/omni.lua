local xx = 600;
local yy = 380;
local ofs = 20;
local ofs2 = 20;
local xx2 = 900;
local yy2 = 480;
local forceCamera = true;

function onCreate()
	precacheSong('omnipresent/Inst');
	precacheSong('omnipresent/Voices-Opponent');
	precacheSong('omnipresent/Voices-Players');
end
function onUpdate(elapsed)
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
        triggerEvent('Camera Follow Pos','','')
	end
end
function onStepHit()
	if curStep == 136 or curStep == 400 or curStep == 592 or curStep == 848 or curStep == 944 then --xterion
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
	if curStep == 272 or curStep == 528 or curStep == 656 or curStep == 912 then --tailsdoll
		xx = 600;
		yy = 380;
		xx2 = 900;
		yy2 = 480;
		setProperty('boyfriendGroup.x',800);
		setProperty('boyfriendGroup.y',125);
		setProperty('dadGroup.x',-100);
		setProperty('dadGroup.y',100);
		setProperty('gfGroup.x',75);
		setProperty('gfGroup.y',100);
		setProperty('defaultCamZoom',0.7);
	end
	if curStep == 1040 or curStep == 1296 or curStep == 1552 or curStep == 1808 then --needlemouse
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
	if curStep == 1168 or curStep == 1424 or curStep == 1680 or curStep == 1936 then --tails
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
	if curStep == 2064 then
		xx = 450;
		yy = 300;
		xx2 = 950;
		yy2 = 300;
		setProperty('boyfriendGroup.x',1400);
		setProperty('boyfriendGroup.y',210);
		setProperty('dadGroup.x',-150);
		setProperty('dadGroup.y',0);
		setProperty('gfGroup.x',600);
		setProperty('gfGroup.y',230);
		setProperty('defaultCamZoom',0.1);
	end
end