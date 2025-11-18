function iparts()
    parts={}

    for i=1,50 do
        add(parts,{
            x=(plr.x+4)+rnd(16),
            y=(plr.y+4)+rnd(16),
            r=8,
            c={10,9,6},
            spd=rnd({1,2,3,4,5}),
            dir=rnd({1,2,3,4}),
            f=rnd(3),
            l=20
        })
    end

    partsplrpos=false
end

function uparts()
    for part in all(parts) do
        if part.dir==1 then
            part.x+=part.spd
            part.y+=part.f
        elseif part.dir==2 then
            part.y+=part.spd
            part.x-=part.f
        elseif part.dir==3 then
            part.x-=part.spd
            part.y-=part.f
        else
            part.y-=part.spd
            part.x+=part.f
        end
        part.l-=1
        if rnd(3)<1 then
            part.r-=1
        end
    end
    -- this code makes insect like movement!
    -- for part in all(parts) do
    --     local dir=rnd({1,2,3,4})
    --     if dir==1 then
    --         part.x+=part.spd
    --     elseif dir==2 then
    --         part.y+=part.spd
    --     elseif dir==3 then
    --         part.x-=part.spd
    --     else
    --         part.y-=part.spd
    --     end
    -- end
end

function dparts()
    for part in all(parts) do
        if part.l>=9 then
            circfill(part.x,part.y,part.r,part.c[1])
        elseif part.l>=5 then
            circfill(part.x,part.y,part.r,part.c[2])
        else
            circfill(part.x,part.y,part.r,part.c[3])
        end
        if part.l==0 then
            del(parts,part)
        end
    end
end