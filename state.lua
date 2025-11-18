function ist()
    st={
        mode="start",
        level=1
    }

    lvl={
        {x=5,y=4,dist=32},
        {x=4,y=28,dist=0},
        {x=4,y=52,dist=0}
    }

    timer={
        explode=30
    }
end

function ust()
    if st.mode=="start" then
        if btnp(🅾️)then
            st.mode="lore"
            sfx(sounds.menubtn)
        end
        if btnp(❎) then
            st.mode="play"
            sfx(sounds.menubtn)
        end
    elseif st.mode=="lore" then
        if btnp(🅾️)then
            st.mode="run"
        end
    elseif st.mode=="run" then
        if btnp(🅾️)then
            st.mode="play"
        end
    elseif st.mode=="play" then
        -- upeds() not implemented
        if btnp(➡️)then
            plr.run=true
            music(msc.play)
        end
        if plr.run then
            uplrmove()
            umatchmove()
            ucam()
        end
        if match.col then
            if not partsplrpos then
                for part in all(parts) do
                    part.x=(plr.x-4)+rnd(16)
                    part.y=(plr.y-4)+rnd(16)
                end
                partsplrpos=true
            end
            uparts()
            timer.explode-=1
            if timer.explode==0 then
                st.mode="lose"
                timer.explode=30
                sfx(sounds.lose)
            end
        end
        if exitcol() then
            if st.level==3 then
                st.mode="win"
                sfx(sounds.win)
            else
                st.mode="next"
                st.level+=1 --change to next level
            end
        end
    elseif st.mode=="next" then
            music(msc.off)
        if btnp(🅾️) then
            lvl[st.level].dist=plr.x-match.x
            st.mode="play"
            plr.run=false
            iplr()
            imatch()
            icam()
            sfx(sounds.menubtn)
        end
    elseif st.mode=="lose" then
            music(msc.off)
        if btnp(🅾️) then
            st.mode="play"
            st.level=1
            plr.run=false
            iplr()
            imatch()
            icam()
            reload(0x1000, 0x1000, 0x2000) --reset map
            iparts()
            sfx(sounds.menubtn)
        end
    elseif st.mode=="win" then
            music(msc.off)
        if btnp(🅾️) then
            run()
            sfx(sounds.menubtn)
        end
    end
end

function dst()
    if st.mode=="start" then
        cls()
        map()
        resetcam(112*8,0)
        print("press 🅾️ for story",(112*8)+28,78,0)
        print("press ❎ to play",(112*8)+32,88,0)
    end
    if st.mode=="lore" then
        cls(1)
        resetcam(0,0)
        print("you fell asleep in a chair",4,24,6)
        print("at the airport...",4,30,6)
        print("you are awakened by a man",4,42,6)
        print("strapping a band of explosives",4,48,6)
        print("around you!",4,54,6)
        print("he smiles at you then lights a",4,66,6)
        print("match...",4,72,6)
        print("press 🅾️",48,90,6)
    end
    if st.mode=="run" then
        cls(0)
        resetcam(0,0)
        print("run",56,54,8)
        print("press 🅾️",48,90,6)
    end
    if st.mode=="play" then
        cls()
        map()
        dplr()
        dmatch()
        dcam()
        -- dpeds() not implemented
        if not plr.run then
            print("tap ➡️ to start running",cam.x+4,cam.y+4,6)
        end
        if match.col then
            dparts()
            plr.sp=63
        end
    end
    if st.mode=="next" then
        cls(1)
        resetcam(0,0)
        print("level "..st.level,52,48,6)
        print("press 🅾️ to continue",26,90,6)
    end
    if st.mode=="lose" then
        cls(1)
        resetcam(0,0)
        print("game over",46,48,7)
        print("press 🅾️ to restart",26,90,6)
    end
    if st.mode=="win" then
        cls(1)
        resetcam(0,0)
        print("you got away!",42,48,7)
        print("press 🅾️ to restart",26,90,6)
    end
end