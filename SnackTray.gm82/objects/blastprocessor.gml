#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=201
state=0

part1=sprite_add(global.cache+"media\blast1.png",1,0,0,0,0)
part2=sprite_add(global.cache+"media\blast2.png",1,0,0,0,0)
part3=FMODSoundAdd(global.cache+"media\blast3.ogg",0)

inst=FMODSoundPlay(part3,0)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=1
frame=0
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_delete(part1)
sprite_delete(part2)
FMODInstanceStop(inst)
FMODSoundFree(part3)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (message) instance_destroy()
if (state=1) {
    frx=floor(frame mod 4)
    fry=floor(frame div 4)
    draw_sprite_part_ext(part1,0,128*frx,80*fry,127,79,29,8,342/127,200/79,$ffffff,1)
    frame+=0.25
    if (frame>38) {state=2 frame=0}
} else if (state=2) {
    frx=floor(frame mod 8)
    fry=floor(frame div 8)
    draw_sprite_part_ext(part2,0,128*frx,80*fry,127,79,29,8,342/127,200/79,$ffffff,1)
    frame+=0.21
    if (frame>131) {state=3 frame=2}
}
if (state=3) {
    frame=max(0,frame-0.05)
    rect(0,0,400,224,$ffffff,min(1,frame))
    if (frame=0) introctrl.cango=1
}
if (state=1 || state=2) draw_sprite(spr_border,0,0,0)
