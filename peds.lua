function ipeds()
    peds={}
    spawnpeds()
end

function ped(x,y)
    return {
        sp=4,
        x=x*8,
        y=y*8,
        h=6,
        w=1,
        spd=2,
        dir="down",
        col=false,
        coldir="",
        coldir2=""
    }
end

function upeds()
    for ped in all(peds) do
        ped.col=false
        ped.coldir=""
        ped.coldir2=""
        local ly=ped.y --last y pos
        if ped.dir=="down" then
            ped.y+=ped.spd --move ped down
        elseif ped.dir=="up" then
            ped.y-=ped.spd --move ped up
        end
        mapcol(ped,0) --check collision with flag 0 (walls)
        if ped.col then
            ped.y=ly --revert to last y position
            if ped.dir=="down" then
                ped.dir="up"
            elseif ped.dir=="up" then
                ped.dir="down"
            end
        end
        boxcol(ped) --check collision with player
    end
end

function dpeds()
    for ped in all(peds) do
        spr(4,ped.x,ped.y) --spawn ped sprites
    end
end

function spawnpeds()
    for x=0,15 do
        for y=0,15 do
            if mget(x,y)==3 then --if tile is ped spawn tile
                add(peds,ped(x,y)) --add new ped to peds table
                mset(x,y,21) --set to floor tile
            end
        end
    end
end