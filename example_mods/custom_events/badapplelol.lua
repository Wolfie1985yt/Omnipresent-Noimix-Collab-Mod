local hasSpawned = false
function onEvent(name, value1, value2)
	if name == 'badapplelol' and value1 == 'a' and hasSpawned == false then
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
		hasSpawned = true
	end
	if name == 'badapplelol' and value1 == 'a' and hasSpawned == true then
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
end
function onUpdate()
	if curStep >= 12240 then
		setObjectOrder('whitebg2',1);
	end
end
function onCreate()

end