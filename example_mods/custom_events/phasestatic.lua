local fps = 0;
local framecount = 39;
function onEvent(name, value1, value2)
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
		addLuaSprite('staticstuff', false);
		objectPlayAnimation('staticstuff', 'idle', true)
		runTimer('end',value1);
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'end' then
		removeLuaSprite('staticstuff');
	end
end
function onCreate()
	precacheImage('Phase3Static');
end
function onSongStart()
	triggerEvent('phasestatic', 1.56, 1);
	setProperty('staticstuff.alpha',0);
	if value2 == '' then
		doTweenAlpha('startstatic', 'staticstuff', 0.5, value1, 'linear');
	else
		doTweenAlpha('startstatic', 'staticstuff', value2, value1, 'linear');
	end
end