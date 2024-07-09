function goodNoteHit(membersIndex, notedata, noteType, isSustainNote)
	if noteType == 'GF and BF' then
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