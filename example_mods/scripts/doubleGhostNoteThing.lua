-- NOTHING HERE SHOULD BE TOUCHED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Except on the opponentNoteHit script, if you modified the notes the mom responds to.
-- DON'T MODIFY ANYTHING HERE IF YOU DON'T KNOW WHAT YOU'RE DOING AND JUST USE THIS AS IT IS, THOUGH!!
-- original script by CJRed#6258, modified by Kaite#1102

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end

local gfRows = {}
local bfRows = {}
local ddRows = {}
local mmRows = {}

function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		local strumTime = boyfriendName..getPropertyFromGroup('notes', id, 'strumTime')
	if bfRows[strumTime] then
		ghostTrail('boyfriend', bfRows[strumTime], isSustainNote)
	end
		local frameName = getProperty('boyfriend.animation.frameName')
		frameName = string.sub(frameName, 1, string.len(frameName) - 3)
		bfRows[strumTime] = {frameName, getProperty('boyfriend.offset.x'), getProperty('boyfriend.offset.y')}
		runTimer('bfstr'..strumTime)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if dadName ~= 'black' and noteType ~= 'Both Opponents Sing' then
		local strumTime = ''
		local frameName = ''
		if getPropertyFromGroup('notes', id, 'gfNote') then
			if not isSustainNote then
				strumTime = gfName..getPropertyFromGroup('notes', id, 'strumTime')
				if gfRows[strumTime] then
					ghostTrail('gf', gfRows[strumTime], isSustainNote)
				end
				frameName = getProperty('gf.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				gfRows[strumTime] = {frameName, getProperty('gf.offset.x'), getProperty('gf.offset.y')}
				runTimer('gfstr'..strumTime)
			end
		elseif noteType ~= 'Opponent 2 Sing' then
			if not isSustainNote then
				strumTime = dadName..getPropertyFromGroup('notes', id, 'strumTime')
				if ddRows[strumTime] then
					ghostTrail('dad', ddRows[strumTime], isSustainNote)
				end
				frameName = getProperty('dad.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				ddRows[strumTime] = {frameName, getProperty('dad.offset.x'), getProperty('dad.offset.y')}
				runTimer('ddstr'..strumTime)
			end
		else
			local momName = getProperty('mom.curCharacters')
			if not isSustainNote then
				strumTime = momName..getPropertyFromGroup('notes', id, 'strumTime')
				if mmRows[strumTime] then
					ghostTrail('mom', mmRows[strumTime], isSustainNote)
				end
				frameName = getProperty('mom.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				mmRows[strumTime] = {frameName, getProperty('mom.offset.x'), getProperty('mom.offset.y')}
				runTimer('mmstr'..strumTime)
			end
		end
	end
end

function ghostTrail(char, noteData, reactivate)
	local ghost = char..'Ghost'
	local group = char
	if char == 'mom' then
		group = 'dad'
	end
	makeAnimatedLuaSprite(ghost, getProperty(char..'.imageFile'), getProperty(char..'.x'), getProperty(char..'.y'))
	addAnimationByPrefix(ghost, 'idle', noteData[1], 24, false)
	setProperty(ghost..'.antialiasing', getProperty(char..'.antialiasing'))
	setProperty(ghost..'.offset.x', noteData[2])
	setProperty(ghost..'.offset.y', noteData[3])
	setProperty(ghost..'.scale.x', getProperty(char..'.scale.x'))
	setProperty(ghost..'.scale.y', getProperty(char..'.scale.y'))
	setProperty(ghost..'.flipX', getProperty(char..'.flipX'))
	setProperty(ghost..'.flipY', getProperty(char..'.flipY'))
	setProperty(ghost..'.visible', getProperty(char..'.visible'))
	setProperty(ghost..'.color', getIconColor(char))
	setProperty(ghost..'.alpha', 0.8 * getProperty(char..'.alpha'))
	setBlendMode(ghost, 'hardlight')
	addLuaSprite(ghost)
	playAnim(ghost, 'idle', true)
	setObjectOrder(ghost, getObjectOrder(group..'Group') - 0.1)
	cancelTween(ghost)
	doTweenAlpha(ghost, ghost, 0, 0.75, 'linear')

	local stage = string.lower(curStage)
	if stage == 'who' or stage == 'voting' or stage == 'nuzzus' or stage == 'idk' then
		--erm
	elseif stage == 'cargo' or stage == 'finalem' then
        setPropertyFromClass('flixel.FlxG', 'camera.zoom', getPropertyFromClass('flixel.FlxG', 'camera.zoom')+0.015)
        setProperty('camHUD.zoom', getProperty('camHUD.zoom')+0.015)
	else
        setPropertyFromClass('flixel.FlxG', 'camera.zoom', getPropertyFromClass('flixel.FlxG', 'camera.zoom')+0.015)
        setProperty('camHUD.zoom', getProperty('camHUD.zoom')+0.03)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- debugPrint(tag)
	if string.match(tag, 'bfstr') then
		bfRows[string.sub(tag, 6, string.len(tag))] = nil
	elseif string.match(tag, 'ddstr') then
		ddRows[string.sub(tag, 6, string.len(tag))] = nil
	elseif string.match(tag, 'mmstr') then
		mmRows[string.sub(tag, 6, string.len(tag))] = nil
	elseif string.match(tag, 'gfstr') then
		gfRows[string.sub(tag, 6, string.len(tag))] = nil
	end
end

function onTweenCompleted(tag)
	if string.match(tag, 'Ghost') then
		removeLuaSprite(tag, true)
	end
end
-- i like number 45 :thumbs_up:
-- me too