#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i,yes;
yes=0
for (i=0;i<1;i+=1) if (global.input[i]!=-1) with (instance_create(200,112,genericcursor)) {
    p2=i
    image_blend=playercol(global.input[p2],p2)
    yes=1
}
with (genericcursor) with (genericcursor) if (id!=other.id && global.input[p2]=global.input[other.p2]) instance_destroy()

if (!yes) with (instance_create(200,112,genericcursor)) {
    image_blend=playercol(0,0)
    special=1
}
go=0
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global.fix ta_load() //don't do when fixing times
alarm[0]=620
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go {
    game_start()
    if (global.stages=0 || global.stages=1) {
        global.nextlevel=global.levellist[stagepick.sel+1,0]
        global.randstage[0]=global.nextlevel
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.levellist[stagepick.sel+1,2] == 1) {
    sound("systemcodeblockfail")
} else {
    go=1
    discord_update_presence("","Loading a level ("+global.nextlevel+")","boll-icon","dice-icon")
    segafadeto(change,"systemstart")
    settings("ta_ratchet",settings("ratchet"))
    settings("ta_randblock",settings("randblock"))

    settings("ratchet",0)
    settings("randblock",0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_border,0,0,0)
