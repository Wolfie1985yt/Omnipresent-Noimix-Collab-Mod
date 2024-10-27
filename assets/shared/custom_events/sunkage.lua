-- Code by KJP
-- Version 4.0

function onEvent(name, value1, value2)
	if name == 'sunkage' then
		if value2 == 'right' then
			makeLuaSprite('image', value1, -1100, -6)
			setObjectOrder('image', 99999)
			setObjectCamera('image', 'hud');
			runTimer('moveRight', 0.1)
		end

		if value2 == 'down' then
			makeLuaSprite('image', value1, 300, -800)
			setObjectOrder('image', 99999)
			setObjectCamera('image', 'hud');
			runTimer('moveDown', 0.1)
		end

		if value2 == 'left' then
			makeLuaSprite('image', value1, 1600, -6)
			setObjectOrder('image', 99999)
			setObjectCamera('image', 'hud');
			runTimer('moveLeft', 0.1)
		end

		if value2 == 'up' then
			makeLuaSprite('image', value1, 300, 800)
			setObjectOrder('image', 99999)
			setObjectCamera('image', 'hud');
			runTimer('moveUp', 0.1)
		end



		if value2 == 'staircase-right-up' then
			makeLuaSprite('image', value1, -1100, 800)
			setObjectOrder('image', 99999)
			setObjectCamera('image', 'hud');
			runTimer('moveStairRightUp', 0.1)
		end

		if value2 == 'staircase-right-down' then
			makeLuaSprite('image', value1, -1100, -800)
			setObjectOrder('image', 99999)
			setObjectCamera('image', 'hud');
			runTimer('moveStairRightDown', 0.1)
		end

		if value2 == 'staircase-left-up' then
			makeLuaSprite('image', value1, 930, 800)
			setObjectOrder('image', 99999)
			setObjectCamera('image', 'hud');
			runTimer('moveStairLeftUp', 0.1)
		end

		if value2 == 'staircase-left-down' then
			makeLuaSprite('image', value1, 1100, -800)
			setObjectOrder('image', 99999)
			setObjectCamera('image', 'hud');
			runTimer('moveStairLeftDown', 0.1)
		end
	end
end
function onCreate()
	makeLuaSprite('sunkage1', 'sunkage/cereal', 0, 0);
	setProperty('sunkage1.alpha',0.000001);
	addLuaSprite('sunkage1',false);
	
	makeLuaSprite('sunkage2', 'sunkage/sunkyMunch', 0, 0);
	setProperty('sunkage2.alpha',0.000001);
	addLuaSprite('sunkage2',false);

	makeLuaSprite('sunkage2', 'sunkage/sunkyPose', 0, 0);
	setProperty('sunkage2.alpha',0.000001);
	addLuaSprite('sunkage2',false);
end
function onTimerCompleted(tag)
    if tag == 'moveRight' then
        addLuaSprite('image', true)
        doTweenX('moveRight', 'image', 1500, 7, 'linear')
    end

    if tag == 'moveDown' then
        addLuaSprite('image', true)
        doTweenY('moveDown', 'image', 1500, 7, 'linear')
    end

    if tag == 'moveLeft' then
        addLuaSprite('image', true)
        doTweenX('moveLeft', 'image', -1500, 7, 'linear')
    end

    if tag == 'moveUp' then
        addLuaSprite('image', true)
        doTweenY('moveUp', 'image', -1500, 7, 'linear')
    end



    if tag == 'moveStairRightUp' then
        addLuaSprite('image', true)
        doTweenY('moveStairUp', 'image', -600, 7, 'linear')
        doTweenX('moveStairRight', 'image', 1500, 7, 'linear')
    end

    if tag == 'moveStairRightDown' then
        addLuaSprite('image', true)
        doTweenY('moveStairDown', 'image', 520, 7, 'linear')
        doTweenX('moveStairRight', 'image', 1500, 7, 'linear')
    end

    if tag == 'moveStairLeftUp' then
	addLuaSprite('image', true)
	doTweenY('moveStairUp', 'image', -720, 7, 'linear')
        doTweenX('moveStairLeft', 'image', -200, 7, 'linear')
    end

    if tag == 'moveStairLeftDown' then
        addLuaSprite('image', true)
        doTweenY('moveStairDown', 'image', 1520, 7, 'linear')
        doTweenX('moveStairLeft', 'image', -1500, 7, 'linear')
    end
end