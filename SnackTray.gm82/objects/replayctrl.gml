#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.lastroom!=mainmenu) {
    menumusic()
    game_reset()
} else {
    emptyreplaycache()
}

event_user(1)
cur=-1

with (instance_create(200,112,genericcursor)) {
    image_blend=playercol(0,0)
    special=1
}

if (!directory_exists(global.workdir+"replays")) exit

if (global.discordoverride<2) {discord_update_presence("","In Menu","boll-icon","cog-icon")}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ocur=cur
if (!selgo) with (genericcursor) if (abut) if (within(x,y,other.x,other.y,140,136)) {
    other.cur=floor((y-(other.y+2))/28)
    if (other.cur>=other.l) other.cur=-1
    else {
        sound("systemselect")
        replaybomber.bomb=0
        if (other.cur=other.ocur) with (replayplay) event_user(0)
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (replaybox.spr!=-1) sprite_delete(replaybox.spr)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dead=1
segafadeto(mainmenu,"systemreturn")
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
maps=updatereplaycache()

l=ds_list_size(maps)

dead=0

cur=-1
page=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<min(5,l);i+=1) {
    yy=y+4+28*(i)

    draw_sprite(spr_replaybox,(cur=i),x,yy)

    m=ds_list_find_value(maps,i+page)
    col=$ffffff if (ds_map_find_value(m,"ts")) col=$ff
    gmcol=$ffffff
    switch ds_map_find_value(m,"gm") {
        case "battle": gmcol=$4b4bff break
        case "timeattack":  gmcol=$ff3860 break
        case "sscreencoop": case "coop": gmcol=$4bff4b break
    }
    draw_systext(x+2,yy+2,i+1+page,$808080)
    draw_systext(x+26,yy+2,ds_map_find_value(m,"dt"),col)
    draw_systext(x+50,yy+14,ds_map_find_value(m,"sc"),gmcol)
    draw_systext(x+98,yy+14,ds_map_find_value(m,"lt"),$ffff)
    t=ds_map_find_value(m,"mp")
    for (j=0;j<t;j+=1) {
        draw_sprite_ext(spr_playercolor,0,x+2+11*j,yy+12,1,1,0,playercol(ds_map_find_value(m,"i"+string(j)),j),1)
        c=charm_get_id(ds_map_find_value(m,"n"+string(j)))
        if (c=-1) icon=spr_chariconb
        else icon=global.chariconr[c]
        draw_sprite(icon,0,x+2+11*j,yy+12)
    }
}

global.halign=1
draw_systext(200,32,lang("replays"))
global.halign=0

draw_sprite(spr_border,0,0,0)
#define KeyPress_27
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) event_user(0)
#define KeyPress_116
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
emptyreplaycache()
event_user(1)
