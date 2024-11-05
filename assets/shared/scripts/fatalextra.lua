---@diagnostic disable: undefined-global, lowercase-global
local json

--Name of the char json
local char2parse = 'true-fatal'

--Sing Anims
local anims = {
    'singLEFT',
    'singDOWN',
    'singUP',
    'singRIGHT'
}

--Name of the Notetype that the character sings with
local noteTypeName = 'ALL'
--Name of the alt anim suffix, will be used for the noteType name too so e.g: 'rizz-alt'
local altAnimSuffix = '-alt'

--If the character is the player or not 
local isPlayer = false 

--Character stage offset
local stageOffsets = {
    720, --x
    0 --y
}

local idleSuffix = '' --alt idle thing don't touch


local idleLoop 
local doIdle = true
local specialAnim = false
function onCreate()
    json = require("assets/shared/scripts/jsonlua")

    local charJson = json.parse(getTextFromFile('characters/'..char2parse..'.json'))

    makeAnimatedLuaSprite(char2parse, charJson.image, charJson.position[1] + stageOffsets[1], charJson.position[2] + stageOffsets[2])
    scaleObject(char2parse, charJson.scale, charJson.scale)

    for i,animation in ipairs(charJson.animations) do
        addAnimationByPrefix(char2parse, animation.anim, animation.name, animation.fps, animation.loop)
        addOffset(char2parse, animation.anim, animation.offsets[1], animation.offsets[2])
        if animation.anim == 'idle' then
            idleLoop = animation.loop
        end
    end

    setProperty(char2parse..'.flipX', charJson.flip_x)


    addLuaSprite(char2parse)


    playAnim(char2parse, 'idle'..idleSuffix)
end

function onUpdate(elapsed)
    if specialAnim and getProperty(char2parse..'.animation.curAnim.finished') then
        specialAnim = false
    end
end

function onBeatHit()
    if not idleLoop then
        if curBeat % 2 == 0 and doIdle and not specialAnim then
            playAnim(char2parse, 'idle'..idleSuffix)
        end
        doIdle = true
    end
end

function singStuff(membersIndex, noteData, noteType, isSustainNote)
    if noteType == noteTypeName then
        doIdle = false
        playAnim(char2parse, anims[noteData + 1], true)
    elseif noteType == noteTypeName..altAnimSuffix then
        doIdle = false
        playAnim(char2parse, anims[noteData + 1]..altAnimSuffix, true)
    end
end

function onCreatePost()
	setProperty('true-fatal.visible',false);
	setProperty('true-fatal.antialiasing',false);
end

function onStepHit()
	if curStep == 12480 then
		setProperty('true-fatal.visible',true);
	end
	if curStep == 12528 then
		setProperty('true-fatal.visible',false);
	end
end

if isPlayer then
    function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
        singStuff(membersIndex, noteData, noteType, isSustainNote)
    end

else
    function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
        singStuff(membersIndex, noteData, noteType, isSustainNote)
    end
end


function onEvent(eventName, value1, value2)
    if eventName == 'Play Animation' then
        if value2 == char2parse then
            specialAnim = true
            playAnim(char2parse, value1)
        end
    end
    if eventName == 'Alt Idle Animation' then
        if value1 == char2parse then
            idleSuffix = value2
            playAnim(char2parse, 'idle'..idleSuffix)
        end
    end
end