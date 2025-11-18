function mapcol(ent,flg) --universal map collision
    local x1=ent.x/8
    local y1=ent.y/8
    local x2=(ent.x+7)/8
    local y2=(ent.y+7)/8
    local y3=(ent.y+(ent.h*2))/8
    local y4=(ent.y+(ent.h*5))/8

    local tl=fget(mget(x1,y1),flg) --top left
    local bl=fget(mget(x1,y2),flg) --bottom left
    --local tr=fget(mget(x2,y1),flg) --top right
    --local br=fget(mget(x2,y2),flg) --bottom right
    local cr1=fget(mget(x2,y3),flg) --center right1
    local cr2=fget(mget(x2,y4),flg) --center right2

    if --[[(tr and br) or]] cr1 or cr2 then
        ent.col=true
        ent.coldir="front"
        if not playingsfx.col then
            sfx(sounds.col)
            playingsfx.col=true
        end
        if tl then
            ent.coldir2="top"
        end
        if bl then
            ent.coldir2="bottom"
        end
    elseif tl or bl then
        ent.col=true
        ent.coldir="side"
    else
        ent.col=false
        ent.coldir=""
        playingsfx.col=false
    end
    --better to return {true/false,front/side,top/bottom}
    --then do whatever on the receiving end
end

function matchplrcol() --check collision between player and match
    if plr.x==match.x+((plr.w*8)-1) then
        match.col=true
        if not playingsfx.explode then
            sfx(sounds.explode)
            playingsfx.explode=true
        end
    else
        playingsfx.explode=false
    end
end

function matchmapcol()
    local x=(match.x+4)/8
    local y=(match.y+4)/8
    local tile=mget(x,y)
    local rubble={6,7,8,9}

    if fget(tile,0) then
        mset(x,y,rnd(rubble))
        sfx(sounds.rubble)
        playingsfx.rubble=true
    else
        playingsfx.rubble=false
    end
end

function exitcol()
    local x=(plr.x+4)/8
    local y=(plr.y+4)/8

    if fget(mget(x,y),1) then
        sfx(sounds.exit)
        return true
    end
end

-- collision between player and peds,not working, not implemented
-- function boxcol(ped) --check collision between player and peds
--   local xd=abs((plr.x+(plr.w/2))-(ped.x+(ped.w/2)))
--   local xs=plr.w*0.5+ped.w*0.5
--   local yd=abs((plr.y+(plr.h/2))-(ped.y+(ped.h/2)))
--   local ys=plr.h/2+ped.h/2
--   if xd<xs and yd<ys then
--     plr.col=true
--     plr.coldir="front"
--   else
--     plr.col=false
--     plr.coldir=""
--   end
-- end