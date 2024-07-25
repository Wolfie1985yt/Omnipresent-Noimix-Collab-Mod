function onEvent(n,v1,v2)
    if n == "Cam Speed" then
        setProperty('cameraSpeed', tonumber(v1))
    end
end