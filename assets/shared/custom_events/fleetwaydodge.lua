function onEvent(name)
	if name == 'fleetwaydodge' then
		runTimer('laser', 0.4);
		runTimer('deathalmost', 1);
	end
end
function onTimerCompleted(tag)
	if tag == 'deathalmost' then
		setProperty('health',0.2)
		triggerEvent('Change Character', 'dad', 'fleetway');
	end
	if tag == 'laser' then
		triggerEvent('Change Character', 'dad', 'fleetwaylaser');
		triggerEvent('Play Animation', 'laser', 'dad');
	end
end