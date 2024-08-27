local speed = 0;
local color = 'FFFFFF';
local stop = true;
function onEvent(name, value1, value2)
	if name == 'VG Pulse' then
		if value1 == '0' then
			cancelTimer('First');
			cancelTimer('Second');
			doTweenAlpha('VG3Tween', 'VG2', 0, speed);
			speed = 0;
			stop = true;
			cancelTween('VG2Color');
			cancelTween('VG2Tween');
		else
			stop = false;
			speed = value1;
			color = value2;
			doTweenColor('VG2Color', 'VG2', color, 0.00001, 'linear');
			doTweenAlpha('VG3Tween', 'VG2', 0.7, speed, 'linear');
			setProperty('VG2.alpha',0);
			runTimer('First',speed);
		end
	end
end
function onUpdate()
	if stop == true then
		setProperty('VG2.alpha',0);
	end
end
function onTimerCompleted(tag)
	if tag == 'First' then
		doTweenAlpha('VG2Tween', 'VG2', 0, speed, 'linear');
		runTimer('Second',speed);
	end
	if tag == 'Second' then
		doTweenAlpha('VG2Tween', 'VG2', 0.7, speed, 'linear');
		runTimer('First',speed);
	end
end
function onCreate()
	makeLuaSprite('VG2', 'WhiteVG', 0, 0);
	setScrollFactor('VG2', 0, 0);
	screenCenter('VG2');
	addLuaSprite('VG2', false);
	screenCenter('VG2');
	setObjectCamera('VG2', 'camOther');
	setProperty('VG2.alpha', 0.00001);
end