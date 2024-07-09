function opponentNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if noteType == 'DAD and GF' then
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