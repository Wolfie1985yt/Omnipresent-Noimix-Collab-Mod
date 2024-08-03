function goodNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if noteType == 'GF and BF' then
		setProperty('gf.idleSuffix','-nothing')
		runTimer('gf-idle', 0.3)
		if notedata == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'gf')
		end
		if notedata == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'gf')
		end
		if notedata == 2 then
			triggerEvent('Play Animation', 'singUP', 'gf')
		end
		if notedata == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'gf')
		end
	end
	if noteType == 'GF and BF' and gfSection then
		setProperty('boyfriend.idleSuffix','-nothing')
		runTimer('bf-idle', 0.3)
		if notedata == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'bf')
		end
		if notedata == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'bf')
		end
		if notedata == 2 then
			triggerEvent('Play Animation', 'singUP', 'bf')
		end
		if notedata == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'bf')
		end
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'dad-idle' then
		setProperty('dad.idleSuffix','')
	end
	if tag == 'gf-idle' then
		setProperty('gf.idleSuffix','')
	end
	if tag == 'bf-idle' then
		setProperty('boyfriend.idleSuffix','')
	end
end