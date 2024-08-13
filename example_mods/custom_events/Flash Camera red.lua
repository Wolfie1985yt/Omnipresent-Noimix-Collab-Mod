function onCreate()
	if getPropertyFromClass('states.PlayState','chartingMode') == false then
		makeLuaSprite('flashred', '', 0, 0);
		makeGraphic('flashred',1920,1080,'FF0000')
		addLuaSprite('flashred', false);
		setLuaSpriteScrollFactor('flashred',0,0)
		setProperty('flashred.scale.x',2)
		setProperty('flashred.scale.y',2)
		setObjectCamera('flashred', 'HUD')
		setProperty('flashred.alpha',0);
	end
end
function onEvent(event,value1,value2)
	if event == 'Flash Camera red' and getPropertyFromClass('states.PlayState','chartingMode') == false then
		makeLuaSprite('flashred', '', 0, 0);
		makeGraphic('flashred',1920,1080,'FF0000')
		setLuaSpriteScrollFactor('flashred',0,0)
		setProperty('flashred.scale.x',2)
		setProperty('flashred.scale.y',2)
		setObjectCamera('flashred', 'HUD')
		doTweenAlpha('flTw','flashred',0,value1,'linear')
		addLuaSprite('flashred', true);
	end
end