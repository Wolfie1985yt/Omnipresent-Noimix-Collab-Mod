function opponentNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if noteType == 'DAD and GF' then
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
	if noteType == 'DAD and GF' and gfSection then
		setProperty('dad.idleSuffix','-nothing')
		runTimer('dad-idle', 0.3)
		if notedata == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'dad')
		end
		if notedata == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'dad')
		end
		if notedata == 2 then
			triggerEvent('Play Animation', 'singUP', 'dad')
		end
		if notedata == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'dad')
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
end