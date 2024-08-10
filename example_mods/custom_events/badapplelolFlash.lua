local hasSpawned = false
function onEvent(name, value1, value2)
	if name == 'badapplelolFlash' then
		setProperty('iconP1.color', 000000);
		setProperty('iconP2.color', 000000);
		setProperty('healthBar.alpha',0);
		setProperty('boyfriendGroup.color', 000000);
		setProperty('gfGroup.color', 000000);
		setProperty('dadGroup.color', 000000);
		makeLuaSprite('whitebg', '', -2000, -1000)
		setScrollFactor('whitebg', 0, 0)
		makeGraphic('whitebg', 3920, 3080, value2)
		screenCenter('whitebg');
		addLuaSprite('whitebg', false)
		setProperty('whitebg.alpha',1);
		runTimer('reset', value1);
		doTweenAlpha('applebadxd', 'whitebg', 0, value1, 'linear')
		doTweenColor('badapplexd3', 'boyfriendGroup', 'FFFFFF', value1, 'linear')
		doTweenColor('badapplexd4', 'dadGroup', 'FFFFFF', value1, 'linear')
		doTweenColor('badapplexd5', 'gfGroup', 'FFFFFF', value1, 'linear')
		doTweenAlpha('badapplexd7', 'healthBar', 1, value1, 'linear')
		doTweenColor('badapplexd101', 'iconP1', 'FFFFFF', value1, 'linear')
		doTweenColor('badapplexd11', 'iconP2', 'FFFFFF', value1, 'linear')
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'reset' then
		removeLuaSprite('whitebg');
	end
end