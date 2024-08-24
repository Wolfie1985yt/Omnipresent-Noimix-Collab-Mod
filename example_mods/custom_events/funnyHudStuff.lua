function onEvent(name, value1, value2)
	if name == 'funnyHudStuff' then
		if value1 == '1' then --hide notes bf
			noteTweenAlpha('BFAlpha1', 4, 0, value2, 'easeIn');
			noteTweenAlpha('BFAlpha2', 5, 0, value2, 'easeIn');
			noteTweenAlpha('BFAlpha3', 6, 0, value2, 'easeIn');
			noteTweenAlpha('BFAlpha4', 7, 0, value2, 'easeIn');
		end
		if value1 == '2' then --fix notes bf
			noteTweenAlpha('BFAlpha1', 4, 1, value2, 'easeIn');
			noteTweenAlpha('BFAlpha2', 5, 1, value2, 'easeIn');
			noteTweenAlpha('BFAlpha3', 6, 1, value2, 'easeIn');
			noteTweenAlpha('BFAlpha4', 7, 1, value2, 'easeIn');
		end
		if value1 == '3' then
			noteTweenAlpha('OpponentAlpha1', 0, 0, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha2', 1, 0, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha3', 2, 0, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha4', 3, 0, value2, 'easeIn');
		end
		if value1 == '4' then
			noteTweenAlpha('OpponentAlpha1', 0, 1, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha2', 1, 1, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha3', 2, 1, value2, 'easeIn');
			noteTweenAlpha('OpponentAlpha4', 3, 1, value2, 'easeIn');
		end
		if value1 == '5' then --hide healthBar
			doTweenAlpha('iconP1', 0, value2, 'easeIn');
			doTweenAlpha('iconP2', 0, value2, 'easeIn');
			doTweenAlpha('healthBar', 0, value2, 'easeIn');
		end
		if value1 == '6' then --show healthBar
			doTweenAlpha('iconP1', 1, value2, 'easeIn');
			doTweenAlpha('iconP2', 1, value2, 'easeIn');
			doTweenAlpha('healthBar', 1, value2, 'easeIn');
		end
		if value1 == '7' then --swap notes
			noteTweenX('XDAD1', 0, 732, 0.01, 'quartInOut');
			noteTweenX('XDAD2', 1, 844, 0.01, 'quartInOut');
			noteTweenX('XDAD3', 2, 956, 0.01, 'quartInOut');
			noteTweenX('XDAD4', 3, 1068, 0.01, 'quartInOut');
			noteTweenX('XBF1', 4, 92, 0.01, 'quartInOut');
			noteTweenX('XBF2', 5, 204, 0.01, 'quartInOut');
			noteTweenX('XBF3', 6, 316, 0.01, 'quartInOut');
			noteTweenX('XBF4', 7, 428, 0.01, 'quartInOut');
		end
		if value1 == '8' then --reswap notes
			noteTweenX('XBF1', 4, 732, 0.01, 'quartInOut');
			noteTweenX('XBF2', 5, 844, 0.01, 'quartInOut');
			noteTweenX('XBF3', 6, 956, 0.01, 'quartInOut');
			noteTweenX('XBF4', 7, 1068, 0.01, 'quartInOut');
			noteTweenX('XDAD1', 0, 92, 0.01, 'quartInOut');
			noteTweenX('XDAD2', 1, 204, 0.01, 'quartInOut');
			noteTweenX('XDAD3', 2, 316, 0.01, 'quartInOut');
			noteTweenX('XDAD4', 3, 428, 0.01, 'quartInOut');
		end
		if value1 == '9' then --middle
			noteTweenX('MiddleXBF0', 4, 415, 0.7, 'easeInOut');
			runTimer('middle1',0.1);
			runTimer('middle2',0.2);
			runTimer('middle3',0.3);
		end
	end
end