function onEvent(n,v1,v2)
    if n == "Cam Zoom" then
        if v1 ~= nil and v2 ~= nil then
            local zoom = tonumber(v1)
            local v = stringSplit(v2, ', ')
            local speed = v[1]
            local ease = v[2]
            startTween('camz', 'this', {defaultCamZoom = zoom, ['camGame.zoom'] = zoom}, speed, {ease = ease})
        end

    end
end