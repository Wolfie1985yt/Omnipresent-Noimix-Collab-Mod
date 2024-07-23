--by sloow

local scale = 1
local ldim = 'funkay' --put here your image name (the image must have a size of 1675 x 1083)
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

    makeLuaSprite('circle', 'StartScreens/Circle-omnipresent', -1050, 0) -- creating the image
    setObjectCamera('circle', 'other')
    scaleObject('circle', scale, scale)
    addLuaSprite('circle')
    runTimer('start', 0.5)
    runTimer('bye', 1.9)
	

    makeLuaSprite('text', 'StartScreens/Text-omnipresent', 1050, 0) -- creating the image
    setObjectCamera('text', 'other')
    scaleObject('text', scale, scale)
    addLuaSprite('text')

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
        doTweenX('startstuff1', 'circle', 0, 0.8, 'linear')
        doTweenX('startstuff2', 'text', 0, 0.8, 'linear')
	end
    if tag == 'bye' then
        loading = true
        startCountdown()
        doTweenAlpha('startstuff3', 'circle', 0, 0.6, 'linear')	
        doTweenAlpha('startstuff4', 'text', 0, 0.6, 'linear')	
        doTweenAlpha('startstuff5', 'black', 0, 0.6, 'linear')	
    end

end

function onTweenCompleted(tag) --this is for delete the loading screen
    
    if tag == 'startstuff5' then
        removeLuaSprite('circle')
        removeLuaSprite('text')
        removeLuaSprite('black')
    end

end