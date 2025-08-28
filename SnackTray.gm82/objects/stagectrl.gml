#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cursort=0
lok=0

if (global.lastroom!=roster) mus_play("extra",1)

var i,yes;
yes=0
for (i=0;i<4;i+=1) if (global.input[i]!=-1) with (instance_create(200,112,genericcursor)) {
    p2=i
    image_blend=playercol(global.input[p2],p2)
    yes=1
}
with (genericcursor) with (genericcursor) if (id!=other.id && global.input[p2]=global.input[other.p2]) instance_destroy()

if (!yes) with (instance_create(200,112,genericcursor)) {
    image_blend=playercol(0,0)
    special=1
}

if (global.stagecount=0) str=lang("stage screen")
else str=lang("stage screen2")

alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (groundblock) event_user(0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cursort=(cursort+1) mod JOY+4

with (genericcursor) if (p2=other.cursort) depth=-!(-depth)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// kelloggs was here

if (starting) {
    if (global.stages=0 || global.stages=1) {
        global.nextlevel=global.levellist[stagepick.sel+1,0]
        global.randstage[0]=global.nextlevel
    }
    game_start()
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.levellist[stagepick.sel+1,2] == 1) {
    sound("systemcodeblockfail")
} else if (segafadeto(change,"systemstart")) {
    starting=1
    discord_update_presence("","Loading a level ("+global.nextlevel+")","boll-icon","dice-icon")

}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.halign=1
draw_systext(x,y,str)
global.halign=0

draw_sprite(spr_border,0,0,0)
