--by sloow

local scale = 1
local loading = false

function onCreate()
	makeLuaSprite('black', '', 0, 0);
	makeGraphic('black',1920,1080,'000000')
	addLuaSprite('black');
	setLuaSpriteScrollFactor('black',0,0)
	setProperty('black.scale.x',2)
	setProperty('black.scale.y',2)
	setProperty('black.alpha',1)
	setObjectCamera('black', 'other')

    makeLuaSprite('circle', 'StartScreens/Circle-omnipresent', 0, 0) -- creating the image
    setObjectCamera('circle', 'other')
    scaleObject('circle', scale, scale)
    addLuaSprite('circle')
	setProperty('circle.alpha',0)
    runTimer('start', 0.5)
    runTimer('bye', 1.9)

    makeLuaSprite('text', 'StartScreens/Text-omnipresent', 0, 0) -- creating the image
    setObjectCamera('text', 'other')
    scaleObject('text', scale, scale)
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

function onStartCountdown() -- cotidoun
    if loading == false then
        return Function_Stop
    elseif loading == true then
        return Function_Continue
    end
end

function onTimerCompleted(tag, loops, loopsLeft) -- penis
	if tag == 'start' then
        doTweenAlpha('startstuff3', 'circle', 1, 0.8, 'linear')
        doTweenAlpha('startstuff4', 'text', 1, 0.8, 'linear')
	end
    if tag == 'bye' then
        loading = true
        startCountdown()
    end
end
function onSongStart()
    doTweenAlpha('startstuff5', 'red', 1, 1.56, 'linear')
end
function onTweenCompleted(tag) --this is for delete the loading screen
	if tag == 'startstuff5' then
		setProperty('white.alpha',1);
		doTweenAlpha('startstuff6', 'white', 0, 0.5, 'linear')
		removeLuaSprite('red');
		removeLuaSprite('circle')
		removeLuaSprite('text')
		removeLuaSprite('black')
	end
	if tag == 'startstuff6' then
		removeLuaSprite('white');
	end
end