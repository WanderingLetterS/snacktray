#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
image_speed=0
image_index=global.greenmode
alarm[0]=2

t=0
amp=8
freq=1.9
sel=1
sel2=1

imgind[0]=0
imgind[1]=1
imgind[2]=2
imgind[3]=1
imgind[4]=0
imgind[5]=10
imgind[6]=3
imgind[7]=1
imgind[8]=0
imgind[9]=1
imgind[10]=4
imgind[11]=5

sprite_index=spr_goombasmb3
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODAllStop()
with (globalmanager) {
    strmhandle=FMODSoundAdd(global.cache+"media\random.wav",1)
    FMODSoundSetGroup(strmhandle,1)
    FMODSoundLoop(strmhandle,0)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade
{
image_alpha += 0.05
}

if fading exit

input_get(0)
input_keystates()

if (up && !cool) {
    sel-=1
    if sel<1
        sel=9
    cool=2
}
else if (down && !cool) {
    sel+=1
    if sel>9
        sel=1
    cool=2
}
else if (!up && !down) cool-=1

if (left && !cool2) {
    sel2-=1

    cool2=2
}
else if (right && !cool2) {
    sel2+=1
    cool2=2
}
else if (!left && !right) cool2-=1

if sel2<1 {
    sel2=4
    if sel == 9 sel2=7
}

if ((sel!=9 && sel2>4) || (sel=9 && sel2>7)) {
    sel2=1
}

if (abut || sbut) {
    FMODAllStop()
    applylevelpack(global.lbase)
    // kelloggs was here

    var nextlevel;
    nextlevel = "world"+string(sel)+string(sel2)


    global.option[0]=charm_get_id("sonic")
    global.option[1]=-1
    global.option[2]=-1
    global.option[3]=-1
    global.playerskin[0]=0
    global.gamemode="classic"
    applyplayerskin(global.pskins[1+global.playerskin[0],global.option[0]],0,"all",global.option[0])
    global.pal_1[0]=(playerskindat(0,"defaultpal1"+string(0)))
    global.pal_2[0]=(playerskindat(0,"defaultpal2"+string(0)))
    global.pal_3[0]=(playerskindat(0,"defaultpal3"+string(0)))
    global.pal_4[0]=(playerskindat(0,"defaultpal4"+string(0)))

    var sprayloop, mydat;
    sprayloop=2
    repeat (3) {
        mydat = playerskindat(p2,"reroutepal"+string(sprayloop)+string(p2))
        if mydat!=0 {
            variable_global_array_set("pal_"+string(sprayloop),p2,variable_global_array_get("pal_"+string(mydat),p2))
        }
        sprayloop+=1
    }

    if sel!=9 {
        discord_update_presence("","Loading a level ("+global.nextlevel+")","boll-icon","dice-icon")
        segafadeto(change)
    } else {
        with (instance_create(x-256,y-40,player)) {
            p2=0
            move_lock=1
            instance_create(x,y+24,ground)
            player_start()
            other.players[0]=id
        }
        global.special=sel2-1
        global.moranplayed[global.special]=0
        instance_create(x,y,cclist)
    }
    fading=1 //like garcello
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=1
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
game_start()
global.nextlevel="world"+string(sel)+string(sel2)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
t+=1
for (i=0;i<12;i+=1) {
    so = t + (i*6);
    why = sin(so*pi*freq/room_speed)*amp;

    if imgind[i]!=10 draw_sprite(spr_koopasmb3,imgind[i],104+(16*i),16+why)
}

for (i=1;i<9;i+=1) {
    if sel == i initreplaycache(56,43+(16*(i-1)),"WORLD "+string(i),$00ffff)
    else initreplaycache(56,43+(16*(i-1)),"WORLD "+string(i),$ffffff)
    initreplaycache(256,43+(16*(i-1)),"ACT 1 2 3 4",$ffffff)
    for (j=1;j<5;j+=1) {
        if (sel2 == j && sel == i) initreplaycache(272+(16*(j)),43+(16*(i-1)),string(j),$00ffff)
    }
}
if sel!=9 initreplaycache(56,185,"SPECIAL STAGE",$ffffff)
else initreplaycache(56,185,"SPECIAL STAGE",$00ffff)
initreplaycache(240,185,"1 2 3 4 5 6 7",$ffffff)
if (sel==9) initreplaycache(240+((sel2-1)*16),185,string(sel2),$00ffff)
