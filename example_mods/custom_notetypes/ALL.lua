function opponentNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if noteType == 'ALL' then
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
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'gf-idle' then
		setProperty('gf.idleSuffix','')
	end
end