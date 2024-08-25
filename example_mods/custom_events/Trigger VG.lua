local beat = 0;
local color = 'FFFFFF';
function onEvent(name, value1, value2)
	if name == 'Trigger VG' then
		beat = value1;
		color = value2;
		doTweenColor('VG3Color', 'VG3', color, 0.00001, 'linear');
		setProperty('VG3.alpha',0.7);
		doTweenAlpha('VG3Tween', 'VG3', 0, 0.4, 'linear');
	end
	if name == 'Trigger VG' and value1 == 0 then
		beat = 0;
		setProperty('VG3.alpha',0);
	end
end
function onBeatHit()
	if curBeat % beat == 0 then
		setProperty('VG3.alpha',0.7);
		doTweenAlpha('VG3Tween', 'VG3', 0, 0.4, 'linear');
	end
end
function onCreate()
	makeLuaSprite('VG3', 'WhiteVG', 0, 0);
	setScrollFactor('VG3', 0, 0);
	screenCenter('VG3');
	addLuaSprite('VG3', false);
	screenCenter('VG3');
	setObjectCamera('VG3', 'camOther');
	setProperty('VG3.alpha', 0.00001);
end