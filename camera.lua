function icam()
    cam={
        x=plr.x-64,
        y=plr.y-64
    }
end

function ucam()
    cam.x=plr.x-64
    cam.y=plr.y-64
end

function dcam()
    camera(cam.x,cam.y)
end

function resetcam(x,y)
    camera(x,y)
end