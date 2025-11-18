function imatch()
    match={
        sp=10,
        x=plr.x-lvl[st.level].dist,
        y=plr.y,
        lx=0,
        ly=0,
        w=1,
        h=1,
        xspd=2,
        yspd=2,
        defxspd=2,
        defyspd=2,
        col=false,
        coldir=""
    }
end

function umatchmove()

    match.col=false

    match.lx=match.x --last x pos
    match.ly=match.y --last y pos

    if plr.col and plr.coldir=="front" then
        match.xspd=.5 --lower x speed if player is colliding in front
    else
        match.xspd=match.defxspd --normal x speed
    end

    match.x+=match.xspd --move match forward automatically

     match.sp+=.25 --animate match
    if match.sp==12 then
        match.sp=10
    end

    if plr.col and (plr.coldir=="side" or plr.coldir2=="top" or plr.coldir2=="bottom") then
        return
    else
        match.y=plr.y
        -- if btn(⬆️)then
        --     match.y-=match.yspd --move match up
        -- elseif btn(⬇️)then
        --     match.y+=match.yspd --move match down
        -- end
    end

    matchplrcol() --check collision with flag 1 (player)

    if match.col then
        match.x=match.lx --if collided with player, stop moving forward
    end

    matchmapcol()

end

function dmatch()
    spr(match.sp,match.x,match.y,match.w,match.h)
end