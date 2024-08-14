local hasSpawned = false
function onEvent(name, value1, value2)
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
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'reset' then
        setProperty('whitebg.alpha',0.00001);
    end
end
function onCreate()
    makeLuaSprite('whitebg', '', -2000, -1000)
    setScrollFactor('whitebg', 0, 0)
    makeGraphic('whitebg', 3920, 3080, value2)
	setProperty('whitebg.alpha',0.00001);
end