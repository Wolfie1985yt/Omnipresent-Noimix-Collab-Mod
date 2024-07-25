function onEvent(n,v1,v2)
    if n == "Cam Zoom" then
        if v1 ~= nil and v2 ~= nil then
            local zoom = tonumber(v1)
            local v = stringSplit(v2, ', ')
            local speed = v[1]
            local ease = v[2]
            startTween('camz', 'this', {defaultCamZoom = zoom, ['camGame.zoom'] = zoom}, speed, {ease = ease})
        if zoom >= 0.8 then --this doesn't work imma kms - Raimbowcore12
            doTweenAlpha('groundop', 'groundFront', 0.3, 0.4)
        elseif zoom < 0.8 then
                doTweenAlpha('groundop', 'groundFront', 1, 0.6)
        end
        end

    end
end