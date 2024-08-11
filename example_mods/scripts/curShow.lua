function onCreatePost()
  makeLuaText('tag1', 'shit', 800, 0, 0);
  setObjectCamera('tag1', 'other');
  addLuaText('tag1') --do this twice?
  
  makeLuaText('tag2', 'piss', 1000, 0, 0);
  setObjectCamera('tag2', 'other');
  addLuaText('tag2') --do this twice?
end
function onBeatHit()
  setTextString('tag1', 'beat: '..curBeat);
end
function onStepHit()
  setTextString('tag2', 'step: '..curStep);
end

--688 xterion position
--4190 wechidna position and .x
--fix pixel bf size in chaotix
--fix satanos and eggman positions
--6471 lordx and fatal positions
--7560 sanic position
--8460 sanic and sunky positions
--8965 faker position
--9850 exe position
--flipped bf in satanos fast part
--char scroll speed after fast fleetway part