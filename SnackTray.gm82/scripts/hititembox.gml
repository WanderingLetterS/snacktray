//Ran by charm the same way it does vine_climbing
with (blockcoll){

    if (!insted) {
    owner.vsp=1.5
    }
    if (!wait || owner.tempbrick) {
        if (object_index!=turing) sound("itemblockbump")
        wait=13
        if (!hit) {
            if (content="coins"){ picked=owner.is_coinexplosive || other.is_coinexplosive}
            x=xstart
            if (object_index=invisibox) {
                with (player) if (instance_place(x,y,other.id)) y+=other.bbox_bottom-bbox_top
            }
            untouched=0
            if (respawning) alarm[2]=400
            upwardthrust()
            if (object_index=goalblock) {
                hsp=0
                event_user(4)
            } else if (object_index=turing) {
                if (mode=0) turingblock()
            } else if (content!="bros") {
                if object_index=bigitembox {
                    x-=16
                    if (left_content="coins" && left_cc) {
                        left_cc=com_spawncoinitembox(left_cc)
                    }
                    x+=16
                    if (center_content="coins" && center_cc) {
                        center_cc=com_spawncoinitembox(center_cc)
                    }
                    x+=16
                    if (right_content="coins" && right_cc) {
                        right_cc=com_spawncoinitembox(right_cc)
                    }
                    x-=16


                    if (left_content!="coins" && center_content!="coins" && right_content!="coins"){

                        owner.blockc+=1
                        hit=1
                        sound("itemappear")
                        mush=!owner.size
                        if owner.name="somari" mush=0
                        if !mush mush=owner.size==5
                        alarm[0]=18

                    }

                    if (left_cc||center_cc||right_cc) hit=0

                } else if (object_index=talkbox) {
                    if (string_pos("sfx",text)) {
                        sound(string_delete(text,1,4))
                    } else {
                        if (!open) {
                            with (talkbox) open=0
                            open=1
                            cur=0
                            sound("itemmessage")
                        } else {
                            if (trans) cur+=1
                            if (cur+1>=pages) open=0
                            else {sf=0 trans=1}
                        }
                    }
                } else if (content="coins") {
                    cc=com_spawncoinitembox(cc)
                } else {
                    owner.blockc+=1
                    hit=1
                    if (object_index == bigitembox) {
                    //with (instance_create(x+8,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
                    //with (instance_create(x+8+(offset*2),y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
                    //global.scor[owner.p2]+=200
                    //global.coins[owner.p2]+=2
                     //   owner.coint+=2
                    }
                    sound("itemappear")
                    mush=!owner.size
                    if owner.name="somari" mush=0
                    if !mush mush=owner.size==5
                    alarm[0]=18
                }
            }
            tpos=1
            spendblock()
        }
    }

}
