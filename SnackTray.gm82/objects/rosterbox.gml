#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ready=0
frame=0
sndi=-1
frh=1
lok=0
hlok=0
showbox=0

card=noone
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if !showbox {
global.topleftplayerskin[p2]=global.playerskin[p2] - (global.playerskin[p2] mod 2)
sideselect=global.playerskin[p2] mod 2
currsel=global.playerskin[p2]
topleft=global.topleftplayerskin[p2]-vertselect*2
}

if (showbox) {


    //Horizontal movement
    if (held.wright || held.right || held.wleft || held.left) {
        if (hlok!=1) {
            hlok=1
            sideselect=!sideselect
            if (held.wright || held.right) {
                currsel+=1
                if sideselect=0 triggerdown=1
            }
            if (held.wleft || held.left){
                currsel-=1
                if sideselect=1 triggerup=1
            }
        }
    }
    else if (hlok=1) hlok=0

    //Down movement
    if (held.wdown || held.down||triggerdown) {
        if (lok!=1||triggerdown) {
            vertselect=!vertselect
            if vertselect=0 {topleft+=2 vertselect=1}
            lok=1
            if !triggerdown
                currsel=(currsel+2)
            else triggerdown=0
        }
    }
    else if (lok=1) lok=0
    //Up movement
    if (held.wup || held.up || triggerup) {
        if (lok!=-1||triggerup) {
            vertselect=!vertselect
            if vertselect=1 {topleft-=2 vertselect=0}
            lok=-1
            if !triggerup
                currsel=(currsel-2)
            else triggerup=0

        }
    }
    else if (lok=-1) lok=0

    if global.pskins[0,global.option[p2]] mod 2 =0{
    if (currsel<0)  currsel=global.pskins[0,global.option[p2]]+currsel//wrap up

    if (currsel>global.pskins[0,global.option[p2]]-1)  currsel=sideselect //wrap down
    } else {
    if (currsel<0)  currsel=global.pskins[0,global.option[p2]]+currsel//wrap up

    if (currsel>global.pskins[0,global.option[p2]]-1)  currsel=0 //wrap down

    }


    {
    held.canmouse=0
    held.x=x
    held.y=y
    held.visible=0}
    global.topleftplayerskin[p2]=topleft
    global.playerskin[p2]=currsel
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready && global.option[p2]!=-1) {
    if (skindat("noicon"+string(p2))) icon=spr_noicon
    else icon=skindat("tex_"+global.charname[global.option[p2]]+"icon"+string(p2))
    if (skindat("noiconbg"+string(p2))) iconbg=-1
    else iconbg=skindat("tex_"+global.charname[global.option[p2]]+"iconbg"+string(p2))


    frh=max(1,floor(sprite_get_height(icon)/48))
    frn=max(1,frh*floor(sprite_get_width(icon)/48))
    if (playerskindat(p2,"iconloop"+string(p2))) frame=(frame+playerskindat(p2,"iconspd"+string(p2))) mod frn
    else frame=min(frame+playerskindat(p2,"iconspd"+string(p2)),frn-1)
    if (frame=0) frame=playerskindat(p2,"iconloopback"+string(p2))


} else frame=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mem=global.playerskin[p2]
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sndi) FMODInstanceStop(sndi)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///click event
if showbox {
    if (ready && global.option[p2]!=-1) {
            showbox=0
            FMODInstanceStop(sndi)
            if (other.pf2) if (global.pskins[0,global.option[p2]]>1) {
            global.playerskin[p2]=(global.playerskin[p2]+1) mod global.pskins[0,global.option[p2]]
            event_user(3)
            if (global.charmod[global.option[p2]]) replaceplayerinfo(p2,globalmanager.moddir+"character\"+global.charname[global.option[p2]]+"\"+"player.txt")
            else replaceplayerinfo(p2,global.pbase+global.charname[global.option[p2]]+"\"+"player.txt")
            global.displayname[p2]=skindat(global.charname[global.option[p2]]+" name")
            applyplayerskin(global.pskins[1+global.playerskin[p2],global.option[p2]],p2,"less",global.option[p2])
            sndi=chosesnd(p2)
            frame=0
            global.pal_1[p2]=min(playerskindat(p2,"defaultpal1"+string(p2)),playerskindat(p2,"totpal"+string(p2)))
            global.pal_2[p2]=min(playerskindat(p2,"defaultpal2"+string(p2)),playerskindat(p2,"totpal"+string(p2)))
            global.pal_3[p2]=min(playerskindat(p2,"defaultpal3"+string(p2)),playerskindat(p2,"totpal"+string(p2)))
            global.pal_4[p2]=min(playerskindat(p2,"defaultpal4"+string(p2)),playerskindat(p2,"totpal"+string(p2)))

            var sprayloop, mydat;
            sprayloop=2
            repeat (3) {
                mydat = playerskindat(p2,"reroutepal"+string(sprayloop)+string(p2))
                if mydat!=0 {
                    variable_global_array_set("pal_"+string(sprayloop),p2,variable_global_array_get("pal_"+string(mydat),p2))
                }
                sprayloop+=1
            }
            exit
        }
    }
}

var selected_spray, changed;
selected_spray = false;
if point_in_rectangle(other.x,other.y,x-23,y-23,x-23+8,y-23+8) {
    global.pal_1[p2]=(global.pal_1[p2]+1) mod playerskindat(p2,"totpal"+string(p2))
    changed=1
    selected_spray = true;
}
if point_in_rectangle(other.x,other.y,x-23+8,y-23,x-23+16,y-23+8) {
    global.pal_2[p2]=(global.pal_2[p2]+1) mod playerskindat(p2,"totpal"+string(p2))
    changed=2
    selected_spray = true;
}
if point_in_rectangle(other.x,other.y,x-23+16,y-23,x-23+24,y-23+8) {
    global.pal_3[p2]=(global.pal_3[p2]+1) mod playerskindat(p2,"totpal"+string(p2))
    changed=3
    selected_spray = true;
}
if point_in_rectangle(other.x,other.y,x-23+24,y-23,x-23+32,y-23+8) {
    global.pal_4[p2]=(global.pal_4[p2]+1) mod playerskindat(p2,"totpal"+string(p2))
    changed=4
    selected_spray = true;
}
if changed {
    var sprayloop, mydat;
    sprayloop=2
    repeat (3) {
        mydat = playerskindat(p2,"reroutepal"+string(sprayloop)+string(p2))
        if mydat!=0 {
            variable_global_array_set("pal_"+string(sprayloop),p2,variable_global_array_get("pal_"+string(mydat),p2))
            if changed==sprayloop sound("ta_epicfail")
        }
        sprayloop+=1
    }
}

if (ready && global.option[p2]!=-1 && !selected_spray) if (global.pskins[0,global.option[p2]]>1) showbox=1
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///release event
alarm[0]=-1
if (ready && global.option[p2]!=-1) {
    FMODInstanceStop(sndi)
         if (other.pf2) if (global.pskins[0,global.option[p2]]>1) {
        global.playerskin[p2]=(global.playerskin[p2]+1) mod global.pskins[0,global.option[p2]]
        event_user(3)
        if (global.charmod[global.option[p2]]) replaceplayerinfo(p2,globalmanager.moddir+"character\"+global.charname[global.option[p2]]+"\"+"player.txt")
        else replaceplayerinfo(p2,global.pbase+global.charname[global.option[p2]]+"\"+"player.txt")
        global.displayname[p2]=skindat(global.charname[global.option[p2]]+" name")
        applyplayerskin(global.pskins[1+global.playerskin[p2],global.option[p2]],p2,"less",global.option[p2])
        global.pal_1[p2]=(playerskindat(p2,"defaultpal1"+string(p2)))
        global.pal_2[p2]=(playerskindat(p2,"defaultpal2"+string(p2)))
        global.pal_3[p2]=(playerskindat(p2,"defaultpal3"+string(p2)))
        global.pal_4[p2]=(playerskindat(p2,"defaultpal4"+string(p2)))

        var sprayloop, mydat;
        sprayloop=2
        repeat (3) {
            mydat = playerskindat(p2,"reroutepal"+string(sprayloop)+string(p2))
            if mydat!=0 {
                variable_global_array_set("pal_"+string(sprayloop),p2,variable_global_array_get("pal_"+string(mydat),p2))
            }
            sprayloop+=1
        }

        sndi=chosesnd(p2)
        frame=0
    }
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///navigate skin back
/*if (ready && global.option[p2]!=-1) if (global.pskins[0,global.option[p2]]>1) {
    FMODInstanceStop(sndi)
    global.playerskin[p2]=(global.playerskin[p2]-1)
    if (global.playerskin[p2]<0) global.playerskin[p2]=global.pskins[0,global.option[p2]]-1
    event_user(3)
    applyplayerskin(global.pskins[1+global.playerskin[p2],global.option[p2]],p2,"less",global.option[p2])
    sndi=chosesnd(p2)
    frame=0
}*/
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!settings("notice_skin")) {settings("notice_skin",1) ping(lang("first skin"))}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_rosterbox,0,x,y)
if (ready) {


    ye=global.input[p2]+2
    draw_sprite_ext(spr_rosterbox,ye,x,y,1,1,0,playercol(global.input[p2]),1)
    draw_sprite(spr_rosterbox,1,x,y)
    if (global.option[p2]=-1) draw_sprite(spr_rostercard,7,x,y)
    else if !(showbox) {

        var showsprays;
        showsprays=playerskindat(p2,"offersprays"+string(p2))

        if showsprays {
            scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,playerskindat(p2,"rostersize"+string(p2)),playerskindat(p2,"totpal"+string(p2))+1)
        }
        if iconbg!=-1{

            //draw the loop
            sbgframe= (sbgframe+0.5) mod 44
            bgframe=floor(sbgframe)

            draw_sprite_part(iconbg,0,2+(bgframe+1),2,44-(bgframe+1),44,x-22,y-22)
            draw_sprite_part(iconbg,0,2,2,(bgframe+1),44,x-22+44-(bgframe+1),y-22)

            //draw the borders
            draw_sprite_part(iconbg,0,0,0,2,48,x-24,y-24)
            draw_sprite_part(iconbg,0,0,0,48,2,x-24,y-24)
            draw_sprite_part(iconbg,0,46,0,2,48,x-24+46,y-24)
            draw_sprite_part(iconbg,0,0,46,48,2,x-24,y-24+46)
        }

        draw_sprite_part(icon,0,1+48*floor(frame/frh),1+floor(frame mod frh)*48,46,46,x-23,y-23)

        shader_reset()

        //drawing spray selector
        if showsprays {
             draw_sprite_part(global.ogpalsprite[p2],0,9,59,37,9,x-18,y-33)
            draw_sprite_part(global.ogpalsprite[p2],0,9+(8*global.pal_1[p2]),26,8,8,x-17,y-32)
            draw_sprite_part(global.ogpalsprite[p2],0,9+(8*global.pal_2[p2]),34,8,8,x-16+8,y-32)
            draw_sprite_part(global.ogpalsprite[p2],0,9+(8*global.pal_3[p2]),42,8,8,x-15+16,y-32)
            draw_sprite_part(global.ogpalsprite[p2],0,9+(8*global.pal_4[p2]),50,8,8,x-14+24,y-32)
        }


    }

    global.halign=1
    if (global.option[p2] != -1) draw_omitext(x,y+16,global.charname[global.option[p2]])
    else draw_omitext(x,y+16,lang("roster random"))
    global.halign=0
    if (showbox) {

        draw_sprite(spr_skinbox,0,x,y)
        for (i=0;i<4;i+=1) {
            skin=modulo(global.topleftplayerskin[p2]+i,0,global.pskins[0,global.option[p2]])
            if skin=0 skin=-1
            draw_sprite(global.charicon[global.option[p2],skin+1],0,x-13+(i mod 2)*26,y-5+(i>1)*27)


            draw_set_color(c_lime)
            draw_rectangle(x-26+sideselect*26,y-18+vertselect*27,x-1+sideselect*26,y+7+vertselect*27,1)
            draw_set_color(c_white)
        }
    }
}
over=0
