#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !place_meeting(x,y,rostercursor) over=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///clicked, change spray
if (global.cpu[p2]==0) {
    global.cpu[p2]=1
    global.input[p2+4]=-1
    global.option[p2+4]=0
    global.playerskin[p2+4]=0
    if global.option[p2+4]>=0{
        replaceinfo(global.pbase+global.charname[global.option[p2+4]]+"\"+"player.txt")
        applyplayerskin(global.pskins[1+global.playerskin[p2+4],global.option[p2+4]],p2+4,"less",global.option[p2+4])
        sndi=chosesnd(p2+4)
        global.pal_1[p2+4]=min(playerskindat(p2+4,"defaultpal1"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_2[p2+4]=min(playerskindat(p2+4,"defaultpal2"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_3[p2+4]=min(playerskindat(p2+4,"defaultpal3"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_4[p2+4]=min(playerskindat(p2+4,"defaultpal4"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
    }
}  else{



    //Skin+Character Switch
    if within(other.x,other.y,x,y,14,14){
        if (global.pskins[0,global.option[p2+4]]>1) {
            global.playerskin[p2+4]=(global.playerskin[p2+4]+1) mod global.pskins[0,global.option[p2+4]]
            if (global.charmod[global.option[p2+4]]) replaceinfo(globalmanager.moddir+"character\"+global.charname[global.option[p2+4]]+"\"+"player.txt")
            else replaceinfo(global.pbase+global.charname[global.option[p2+4]]+"\"+"player.txt")
            global.displayname[p2]=skindat(global.charname[global.option[p2+4]]+" name")
            applyplayerskin(global.pskins[1+global.playerskin[p2+4],global.option[p2+4]],p2+4,"less",global.option[p2+4])
            sndi=chosesnd(p2+4)
            global.pal_1[p2+4]=min(playerskindat(p2+4,"defaultpal1"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
            global.pal_2[p2+4]=min(playerskindat(p2+4,"defaultpal2"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
            global.pal_3[p2+4]=min(playerskindat(p2+4,"defaultpal3"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
            global.pal_4[p2+4]=min(playerskindat(p2+4,"defaultpal4"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))

            var sprayloop, mydat;
            sprayloop=2
            repeat (3) {
                mydat = playerskindat(p2+4,"reroutepal"+string(sprayloop)+string(p2+4))
                if mydat!=0 {
                    variable_global_array_set("pal_"+string(sprayloop),p2+4,variable_global_array_get("pal_"+string(mydat),p2+4))
                }
                sprayloop+=1
            }
        }

        exit
    }

    //Palette Switch
    if within(other.x,other.y,x+13+6,y,8,12) {global.pal_1[p2+4]= (global.pal_1[p2+4]+1) mod playerskindat(p2+4,"totpal"+string(p2+4)) exit}
    if within(other.x,other.y,x+21+6,y,8,12) {global.pal_2[p2+4]= (global.pal_2[p2+4]+1) mod playerskindat(p2+4,"totpal"+string(p2+4)) exit}
    if within(other.x,other.y,x+29+6,y,8,12) {global.pal_3[p2+4]= (global.pal_3[p2+4]+1) mod playerskindat(p2+4,"totpal"+string(p2+4)) exit}
    if within(other.x,other.y,x+37+6,y,8,12) {global.pal_4[p2+4]= (global.pal_4[p2+4]+1) mod playerskindat(p2+4,"totpal"+string(p2+4)) exit}


    //change character left
    if within(other.x,other.y,x+19,y+12,12,7){
        global.option[p2+4]= (global.option[p2+4]-1)
        if global.option[p2+4] <0 global.option[p2+4] =global.characters-1

        global.playerskin[p2+4]=0
        if (global.charmod[global.option[p2+4]]) replaceinfo(globalmanager.moddir+"character\"+global.charname[global.option[p2+4]]+"\"+"player.txt")
        else replaceinfo(global.pbase+global.charname[global.option[p2+4]]+"\"+"player.txt")
        global.displayname[p2]=skindat(global.charname[global.option[p2+4]]+" name")
        applyplayerskin(global.pskins[1+global.playerskin[p2+4],global.option[p2+4]],p2+4,"less",global.option[p2+4])
        sndi=chosesnd(p2+4)
        global.pal_1[p2+4]=min(playerskindat(p2+4,"defaultpal1"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_2[p2+4]=min(playerskindat(p2+4,"defaultpal2"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_3[p2+4]=min(playerskindat(p2+4,"defaultpal3"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_4[p2+4]=min(playerskindat(p2+4,"defaultpal4"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))

        var sprayloop, mydat;
        sprayloop=2
        repeat (3) {
            mydat = playerskindat(p2+4,"reroutepal"+string(sprayloop)+string(p2+4))
            if mydat!=0 {
                variable_global_array_set("pal_"+string(sprayloop),p2+4,variable_global_array_get("pal_"+string(mydat),p2+4))
            }
            sprayloop+=1
        }
    }

    //change character right
    if within(other.x,other.y,x+30,y+12,12,7){
        global.option[p2+4]= (global.option[p2+4]+1) mod global.characters
        global.playerskin[p2+4]=0
        if (global.charmod[global.option[p2+4]]) replaceinfo(globalmanager.moddir+"character\"+global.charname[global.option[p2+4]]+"\"+"player.txt")
        else replaceinfo(global.pbase+global.charname[global.option[p2+4]]+"\"+"player.txt")
        global.displayname[p2]=skindat(global.charname[global.option[p2+4]]+" name")
        applyplayerskin(global.pskins[1+global.playerskin[p2+4],global.option[p2+4]],p2+4,"less",global.option[p2+4])
        sndi=chosesnd(p2+4)
        global.pal_1[p2+4]=min(playerskindat(p2+4,"defaultpal1"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_2[p2+4]=min(playerskindat(p2+4,"defaultpal2"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_3[p2+4]=min(playerskindat(p2+4,"defaultpal3"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))
        global.pal_4[p2+4]=min(playerskindat(p2+4,"defaultpal4"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4)))

        var sprayloop, mydat;
        sprayloop=2
        repeat (3) {
            mydat = playerskindat(p2+4,"reroutepal"+string(sprayloop)+string(p2+4))
            if mydat!=0 {
                variable_global_array_set("pal_"+string(sprayloop),p2+4,variable_global_array_get("pal_"+string(mydat),p2+4))
            }
            sprayloop+=1
        }

    }

}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.option[p2]<0 exit
if within(other.x,other.y,x+13,y,8,12) {global.pal_1[p2+4]=0 exit}
if within(other.x,other.y,x+21,y,8,12) {global.pal_2[p2+4]=0 exit}
if within(other.x,other.y,x+29,y,8,12) {global.pal_3[p2+4]=0 exit}
if within(other.x,other.y,x+37,y,8,12) {global.pal_4[p2+4]=0 exit}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/



if (global.cpu[p2]!=0){
    //draw_sprite(sprite_index,1,x,y)

    showsprays=playerskindat(p2+4,"offersprays"+string(p2+4))
    if showsprays {
        draw_sprite(sprite_index,3,x,y)
         draw_sprite_part(global.ogpalsprite[p2+4],0,9,59,37,11,x+11+6,y)
        draw_sprite_part(global.ogpalsprite[p2+4],0,9+(8*global.pal_1[p2+4]),26,8,8,x+12+6,y+1)
        draw_sprite_part(global.ogpalsprite[p2+4],0,9+(8*global.pal_2[p2+4]),34,8,8,x+21+6,y+1)
        draw_sprite_part(global.ogpalsprite[p2+4],0,9+(8*global.pal_3[p2+4]),42,8,8,x+30+6,y+1)
        draw_sprite_part(global.ogpalsprite[p2+4],0,9+(8*global.pal_4[p2+4]),50,8,8,x+39+6,y+1)
        scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[p2+4*100],global.pal_1[p2+4]+1,global.pal_2[p2+4]+1,global.pal_3[p2+4]+1,global.pal_4[p2+4]+1,playerskindat(p2+4,"rostersize"+string(p2+4)),playerskindat(p2+4,"totpal"+string(p2+4))+1)
    } else draw_sprite(sprite_index,2,x,y)




    draw_sprite(skindat("tex_"+global.charname[global.option[p2+4]]+"emblem"+string(p2+4)),0,x,y  )
    //draw_sprite(global.chariconr[global.option[p2+4]],0,x+12,y+10)


    shader_reset()
} else draw_sprite(sprite_index,!!over,x,y)
