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

function goodNoteHit(id, direction, noteType, isSustainNote, gfNote)
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		if not isSustainNote and noteType == '' or noteType == 'GF and BF' and not isSustainNote then
			if not getPropertyFromGroup('notes', id, 'gfNote') then
				local strumTime = boyfriendName..getPropertyFromGroup('notes', id, 'strumTime')
				if bfRows[strumTime] then
					ghostTrail('boyfriend', bfRows[strumTime], isSustainNote)
				end
				local frameName = getProperty('boyfriend.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				bfRows[strumTime] = {frameName, getProperty('boyfriend.offset.x'), getProperty('boyfriend.offset.y')}
				runTimer('bfghost',0.01)
			end
		end
		if getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF and BF' then
			if not isSustainNote then
				local strumTime = gfName..getPropertyFromGroup('notes', id, 'strumTime')
				if gfRows[strumTime] then
					ghostTrail('gf', gfRows[strumTime], isSustainNote)
				end
				local frameName = getProperty('gf.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				gfRows[strumTime] = {frameName, getProperty('gf.offset.x'), getProperty('gf.offset.y')}
				runTimer('gfghost',0.01)
			end
		end
	end
end
	
function opponentNoteHit(id, direction, noteType, isSustainNote, gfSection)
	local strumTime = ''
	local frameName = ''
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		if not isSustainNote and noteType == '' and not getPropertyFromGroup('notes', i, 'gfNote') or noteType == 'DAD and GF' and not isSustainNote then
			strumTime = dadName..getPropertyFromGroup('notes', id, 'strumTime')
			if ddRows[strumTime] then
				ghostTrail('dad', ddRows[strumTime], isSustainNote)
			end
			frameName = getProperty('dad.animation.frameName')
			frameName = string.sub(frameName, 1, string.len(frameName) - 3)
			ddRows[strumTime] = {frameName, getProperty('dad.offset.x'), getProperty('dad.offset.y')}
			runTimer('dadghost',0.01)
		end
		if gfNote or noteType == 'DAD and GF' or getPropertyFromGroup('notes', i, 'gfNote') or noteType == 'DAD and GF' then
			if not isSustainNote then
				strumTime = gfName..getPropertyFromGroup('notes', id, 'strumTime')
				if gfRows[strumTime] then
					ghostTrail('gf', gfRows[strumTime], isSustainNote)
				end
				frameName = getProperty('gf.animation.frameName')
				frameName = string.sub(frameName, 1, string.len(frameName) - 3)
				gfRows[strumTime] = {frameName, getProperty('gf.offset.x'), getProperty('gf.offset.y')}
				runTimer('gfghost',0.01)
			end
		end
	end
end

function ghostTrail(char, noteData, reactivate)
	local ghost = char..'Ghost'
	local group = char
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
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
	end
end

function onEvent(name, value1, value2)
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		if name == 'Change Character' and value1 == 'dad' or name == 'Change Character' and value1 == 'bf' then
			setProperty('boyfriendGhost.alpha',0);
			setProperty('dadGhost.alpha',0);
			removeLuaSprite('dadGhost');
			removeLuaSprite('boyfriendGhost');
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- debugPrint(tag)
	if tag == 'bfghost' then
		runTimer('bfstr'..strumTime)
	end
	if tag == 'gfghost' then
		runTimer('gfstr'..strumTime)
	end
	if tag == 'dadghost' then
		runTimer('ddstr'..strumTime)
	end
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

function onUpdate()
	if curStep <= 12220 and curStep >= 0 or curStep >= 12776 and curStep <= 13104 then
		setProperty(ghost..'.antialiasing', getProperty(char..'.antialiasing'))
		setProperty(ghost..'.offset.x', noteData[2])
		setProperty(ghost..'.offset.y', noteData[3])
		setProperty(ghost..'.scale.x', getProperty(char..'.scale.x'))
		setProperty(ghost..'.scale.y', getProperty(char..'.scale.y'))
		setProperty(ghost..'.flipX', getProperty(char..'.flipX'))
		setProperty(ghost..'.flipY', getProperty(char..'.flipY'))
		setProperty(ghost..'.visible', getProperty(char..'.visible'))
		setProperty(ghost..'.color', getIconColor(char))
	end
end
-- i like number 45 :thumbs_up:
-- me too