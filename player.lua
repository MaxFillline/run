function iplr()
    plr={
        sp=1,
        x=lvl[st.level].x*8,
        y=lvl[st.level].y*8,
        lx=0,
        ly=0,
        w=1,
        h=1,
        xspd=2,
        yspd=2,
        defxspd=2,
        defyspd=2,
        col=false,
        coldir="",
        coldir2="",
        run=false
    }
end

function uplrmove()

    plr.col=false
    plr.coldir=""
    plr.coldir2=""

    plr.lx=plr.x --last x pos
    plr.ly=plr.y --last y pos

    if timer.explode==30 then
        if btn(⬆️)then
            plr.y-=plr.yspd
        elseif btn(⬇️)then
            plr.y+=plr.yspd
        end
    end

    plr.x+=plr.xspd --auto move forward

    plr.sp+=.25 --animate player
    if plr.sp==3 then
        plr.sp=1
    end

    mapcol(plr,0) --check collision with flag 0 (walls,peeps)

    if plr.coldir=="front" then
       plr.x=plr.lx -- revert to last x position, allowing y movement
    end

    if plr.coldir=="side" then
       plr.y=plr.ly -- revert to last y position, allowing x movement
    end

    if plr.coldir2=="top" then
       plr.y+=plr.yspd --push down
    end

    if plr.coldir2=="bottom" then
       plr.y-=plr.yspd --push up
    end

end

function dplr()
    spr(plr.sp,plr.x,plr.y,plr.w,plr.h)
end