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
			doTweenAlpha('icon1Tween', 'iconP1', 0, value2, 'easeIn');
			doTweenAlpha('icon2Tween', 'iconP2', 0, value2, 'easeIn');
			doTweenAlpha('healthBarTween', 'healthBar', 0, value2, 'easeIn');
			doTweenAlpha('healthBarBGTween', 'healthBarBG', 0, value2, 'easeIn');
			doTweenAlpha('scoreTween', 'scoreTxt', 0, value2, 'easeIn');
		end
		if value1 == '6' then --show healthBar
			doTweenAlpha('icon1Tween', 'iconP1', 1, value2, 'easeIn');
			doTweenAlpha('icon2Tween', 'iconP2', 1, value2, 'easeIn');
			doTweenAlpha('healthBarTween', 'healthBar', 1, value2, 'easeIn');
			doTweenAlpha('healthBarBGTween', 'healthBarBG', 1, value2, 'easeIn');
			doTweenAlpha('scoreTween', 'scoreTxt', 1, value2, 'easeIn');
		end
		if value1 == '7' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --swap notes
			noteTweenX('XDAD1', 0, 732, 0.1, 'quartInOut');
			noteTweenX('XDAD2', 1, 844, 0.1, 'quartInOut');
			noteTweenX('XDAD3', 2, 956, 0.1, 'quartInOut');
			noteTweenX('XDAD4', 3, 1068, 0.1, 'quartInOut');
			noteTweenX('XBF1', 4, 92, 0.1, 'quartInOut');
			noteTweenX('XBF2', 5, 204, 0.1, 'quartInOut');
			noteTweenX('XBF3', 6, 316, 0.1, 'quartInOut');
			noteTweenX('XBF4', 7, 428, 0.1, 'quartInOut');
		end
		if value1 == '8' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --reswap notes
			noteTweenX('XBF1', 4, 732, 0.1, 'quartInOut');
			noteTweenX('XBF2', 5, 844, 0.1, 'quartInOut');
			noteTweenX('XBF3', 6, 956, 0.1, 'quartInOut');
			noteTweenX('XBF4', 7, 1068, 0.1, 'quartInOut');
			noteTweenX('XDAD1', 0, 92, 0.1, 'quartInOut');
			noteTweenX('XDAD2', 1, 204, 0.1, 'quartInOut');
			noteTweenX('XDAD3', 2, 316, 0.1, 'quartInOut');
			noteTweenX('XDAD4', 3, 428, 0.1, 'quartInOut');
		end
		if value1 == '9' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --middle
			noteTweenX('MiddleXBF0', 4, 422, 2, 'quartInOut');
			runTimer('middle1',0.1);
			runTimer('middle2',0.2);
			runTimer('middle3',0.3);
		end
		if value1 == '10' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --middle opp
			noteTweenX('MiddleXDAD0', 3, 752, 0.5, 'quartInOut');
			runTimer('middle4',0.05);
			runTimer('middle5',0.1);
			runTimer('middle6',0.15);
		end
		if value1 == '11' and not getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') then --move back
			noteTweenX('XDAD1', 0, 92, value2, 'quartInOut');
			noteTweenX('XDAD2', 1, 204, value2, 'quartInOut');
			noteTweenX('XDAD3', 2, 316, value2, 'quartInOut');
			noteTweenX('XDAD4', 3, 428, value2, 'quartInOut');
		end
	end
end
function onTimerCompleted(tag)
	if tag == 'middle1' then
		noteTweenX('MiddleXBF1', 5, 532, 2, 'quartInOut');
	end
	if tag == 'middle2' then
		noteTweenX('MiddleXBF2', 6, 642, 2, 'quartInOut');
	end
	if tag == 'middle3' then
		noteTweenX('MiddleXBF3', 7, 752, 2, 'quartInOut');
	end
	if tag == 'middle4' then
		noteTweenX('MiddleXDAD1', 2, 642, 0.5, 'quartInOut');
	end
	if tag == 'middle5' then
		noteTweenX('MiddleXDAD2', 1, 532, 0.5, 'quartInOut');
	end
	if tag == 'middle6' then
		noteTweenX('MiddleXDAD3', 0, 422, 0.5, 'quartInOut');
	end
end