#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
count=0
frame=0
countscore=0
passed[3]=0
counted[3]=0
yup=0
issign=0
no1up=0
angle=0
anglego=0
angleoffset=0

fwcoordx[1]=-19-8 fwcoordy[1]=-69-8
fwcoordx[2]=-51-8 fwcoordy[2]=-21-8
fwcoordx[3]= 47-8 fwcoordy[3]=-53-8
fwcoordx[4]= 47-8 fwcoordy[4]= -5-8
fwcoordx[5]= -3-8 fwcoordy[5]=-53-8
fwcoordx[6]=-51-8 fwcoordy[6]=-21-8
fwcoordx[7]=-19-8 fwcoordy[7]=-69-8
fwcoordx[8]=-51-8 fwcoordy[8]=-21-8
fwcoordx[9]= 47-8 fwcoordy[9]=-53-8

getregion(x)
class=skindat("classflag")

ending=0
descend=0
stop=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (count=global.mplay) {
    if (object_index=flag) {if !issign && !isblock { y=ystart+144 visible=1 instance_create(x+16,y,smoke) }descend=1} else
        alarm[4]=40
    with (player) stopsuper(0)
    alarm[3]=250
    alarm[2]=175
    if other.issign mus_play("finishsign",0)
    else if other.isblock mus_play("finishblock",0)
    else mus_play("finish",0) global.finishmusic=1}
else {
    frspd=0
    frame=0
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///firework is never over
var i;

fwcount+=1

Yes=0

for (i=0;i<global.mplay;i+=1) if (firework[i]>=fwcount) {
    if (object_index=flag) with (instance_create(x+96+fwcoordx[fwcount],144+fwcoordy[fwcount],fireworkeff)) type=i
    global.scor[i]+=500
    Yes=1
}

if (Yes) {
    alarm[1]=32
    sound("itemfirework")
} else alarm[7]=max(60,120-30*fwcount)
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frspd=0
frame=4
with (player) {
    finish=1
    jet=0
    glide=0
    climb=0
}
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
countscore=1
sound("systemtimecount",1)
with (instance_create(0,0,timecounter)) myflag=other.id
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frspd=0
frame=4
#define Alarm_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.nextlevel=nextlevel
game_stageend()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i,o,e;

if (issign) {
    anglego=inch(anglego,0,median(2,anglego/30,22.5))
    angle=-(anglego mod 360)+angleoffset
    if (!owner) {with(player) if flag.passed[p2] other.owner=id}
}

if (ending) { //stage end
    if (descend) {
        if !issign && !isblock{
            with (player) if latchedtoflagpole{
                y+=2.01
                if y>=other.maxplayery||place_meeting(x,y,collider) {latchedtoflagpole=0 grabflagpole=0}
            }
            if y>flagmaxrise && y>maxdrawflagy
            y-=2
        }
        frspd=0
        if issign||isblock{
            if (y+vspeed>ystart+122) {
                vspeed=-abs(vspeed)/2
                y=ystart+122
                if (abs(vspeed)<0.5) {descend=0 stop=1 vspeed=0 if (class) frspd=0}
            }
        } else {
            if y<ystart{
            y=ystart
            descend=0 stop=1
            }

        }
    }
} else { //check for players passing the flag
    for (i=0;i<global.mplay;i+=1) {
        o=gamemanager.players[i]
        if (((isblock && o.blocked=id) || (!isblock && ((((o.x>x-6 && o.xpr<=x-6) || (o.x<x-6 && o.xpr>=x-6)))) && abs(x-o.x)<128)) && !passed[i]) {
            if ((o.y>ystart-88 && o.y<ystart+144) || isblock) {
                if !issign && !isblock {
                if (o.y>ystart-16 && o.x<x+6) {
                    if (!no1up && abs((ystart)-(o.bbox_top+o.bbox_bottom)/2)<8) {give_item(o,"1up") e=instance_create(x+24,max(ystart-160,round(o.y))+12,scoreeffect) e.value=10 e.vspeed=0 no1up=1}

                    with (o) {charm_run("grabflagpole")

                        other.flagmaxrise=y
                        if !noflagpolegrab{
                            xsc=1
                            latchedtoflagpole=1
                            if y>other.maxdrawflagy other.y=maxdrawflagy
                            x=other.x
                        }
                    }
                    if (flag.count=0) owner=o
                    instance_create(x-16,y,smoke) visible=0
                    } else exit
                }
                o.timeend=o.time
                o.ending="flag"
                if (isblock) o.ending="block"
                flag.passed[i]=1
                if (o.timeend mod 10==(o.timeend mod 60) div 10) firework[i]=o.timeend mod 10
                if (!class) frspd=1
                if (issign) {anglego=360*6.5 angleoffset=180 if (flag.count=0) owner=o}
                flag.count+=1
                if (!isblock) with (instance_create(x+24,max(ystart-160,round(o.y)),tein)) {p2=i event_user(0)}
                with (o) {
                    global.coll=id
                    with (enemy) if (abs(x-other.x)<200 && active) enemyexplode(id)
                }
                if (flag.count=global.mplay) {
                    ending=1
                    gamemanager.timedead=1
                    if (isblock) sound("itemgoalblock")
                    else sound("itemflagpole")
                    if (gamemanager.timeleft>0) {if (gamemanager.timeleft<=12) stagemusic(id,-1) gamemanager.timeleft=-1}
                    yup=1
                    if (class) alarm[0]=1 else alarm[0]=30
                } else {
                    if (count=1) gamemanager.timeleft=30
                    sound("itemflagpole2p")
                    alarm[0]=60
                }
            }
        }
    }
}

frame=min(3,frame+frspd)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.snacklayout || instance_nearest(x,y,player).snacklayout){
    if !owner my_man=instance_nearest(x,y,player) else my_man=owner


    if (issign){
        //interpolation sadly messes with our beloved shader so uh... no interpolation here.
        if (angle<90 || angle>270) draw_sprite_part_ext(my_man.sheets[drawsize],0,345,11,40,28,x+lengthdir_x(-20,angle),y+8-18,lengthdir_x(1,angle),1,$ffffff,1) //bowser face
        else {

            draw_sprite_part_ext(my_man.sheets[drawsize],0,345,11,40,28,x+lengthdir_x(-20,angle+180),y+8-18,lengthdir_x(1,angle+180),1,$ffffff,1) //boser side
            if owner.usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,owner.size,owner.totpal+1)
            draw_sprite_part_ext(my_man.sheets[drawsize],0,386+41*floor(signframe mod 3),11,40,28,x+lengthdir_x(-20,angle+180),y+8-18,lengthdir_x(1,angle+180),1,$ffffff,1) //player face
            shader_reset()
        }
        if (angle<180) draw_sprite_part_ext(my_man.sheets[drawsize],0,509,13,4,24,x+lengthdir_x(-20,angle)+lengthdir_x(-4,angle+90),y+8-16,lengthdir_x(1,angle+90),1,$ffffff,1) //singpost side
        else draw_sprite_part_ext(my_man.sheets[drawsize],509,13,72,4,24,x+lengthdir_x(-20,angle+180)+lengthdir_x(-4,angle+270),y+8-16,lengthdir_x(1,angle+270),1,$ffffff,1) //singpost side
        if anglego!=0 signframe=0
        else if signframe!=3 signframe+=0.1
    } else if !isblock{

        if !owner {draw_sprite_part_ext(my_man.sheets[drawsize],0,213+33*global.frame,8,32,35,x,y-14+8,1,1,$ffffff,1)     dontdrawtimer=40}
        else if y>=ystart {if dontdrawtimer dontdrawtimer-=1 else draw_sprite_part_ext(my_man.sheets[drawsize],0,81+33*global.frame,8,32,35,x,y-23+8,1,1,$ffffff,1) }

    }
}else{
    if (issign) {
        texture_set_interpolation(1)
        if (angle<90 || angle>270) draw_background_part_ext(global.master[biome],424,40,40,24,x+lengthdir_x(-20,angle),y-8,lengthdir_x(1,angle),1,$ffffff,1)
        else {
            rect(x+lengthdir_x(-20,angle+180),y-8,lengthdir_x(40,angle+180),24,0,1)
            if owner.usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,owner.size,owner.totpal+1)
             texture_set_interpolation(0)
            draw_sprite_part_ext(owner.sheet,0,21,58,40,24,x+lengthdir_x(-20,angle+180),y-8,lengthdir_x(1,angle+180),1,$ffffff,1)
            shader_reset();  texture_set_interpolation(1)
            draw_background_part_ext(global.master[biome],424,71,40,24,x+lengthdir_x(-20,angle+180),y-8,lengthdir_x(1,angle+180),1,$ffffff,1)
            if owner.usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,owner.size,owner.totpal+1)
             texture_set_interpolation(0)
            draw_sprite_part_ext(owner.sheet,0,21,33,40,24,x+lengthdir_x(-20,angle+180),y-8,lengthdir_x(1,angle+180),1,$ffffff,1)
            shader_reset()  texture_set_interpolation(1)
        }
        if (angle<180) draw_background_part_ext(global.master[biome],472,72,4,24,x+lengthdir_x(-20,angle)+lengthdir_x(-4,angle+90),y-8,lengthdir_x(1,angle+90),1,$ffffff,1)
        else draw_background_part_ext(global.master[biome],472,72,4,24,x+lengthdir_x(-20,angle+180)+lengthdir_x(-4,angle+270),y-8,lengthdir_x(1,angle+270),1,$ffffff,1)
        texture_set_interpolation(0)
    } else if (!isblock){
        y-=2
        if !owner
        ssw_tile("flag")
        else {
            depth=1000000-1
            if owner.usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,owner.size,owner.totpal+1)
            draw_sprite_part_ext(owner.sheet,0,320+33*global.frame,10,32,24,x,y-8,1,1,$ffffff,1)
            shader_reset()
        }
        y+=2
    }

}
