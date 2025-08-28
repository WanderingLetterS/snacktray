#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sel=0
event_user(3)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over1=0
over2=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///left click

if (other.y<y+19) {
    sel=median(0,sel-1,max(0,global.bundles[0,0]-1))
    sound("systemselect")
}
if (other.y>y+116) {
    sel=median(0,sel+1,max(0,global.bundles[0,0]-1))
    sound("systemselect")
}

event_user(3)
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///scroll wheel
if (other.wdown || other.wup) sound("systemselect")

sel=median(0,sel+other.wdown-other.wup,max(0,global.bundles[0,0]-1))

event_user(3)
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///load bundle

if (global.bundles[0,0]) applybundle(global.bundles[1+sel,0])
else skinstr("bundledesc",lang("error bundles")+global.workdir+"bundles")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y)
if (over1) draw_sprite(sprite_index,1,x,y)
if (over2) draw_sprite(sprite_index,2,x,y)

if (global.bundles[0,0]) {
    if (global.bundles[sel+1,1]) draw_sprite_stretched(global.bundles[sel+1,1],0,x+1,y+20,96,96)
    else {
        global.halign=1
        global.valign=1
        draw_systext(x+49,y+68,wordwrap(skinstr("bundlename"),10))
        global.halign=0
        global.valign=0
    }
}

draw_sprite(sprite_index,3,x,y)
