#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

if (mode==4) if (!goinup) {
    global.coll=instance_place(x+srcx,y+srcy,player)
    if (global.coll) {if (!tlock) {insted=1 go=-1 event_user(0) insted=0} tlock=1}
    else {if (tlock) {insted=1 go=1 event_user(0) insted=0} tlock=0}
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (mode) turingblock()
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///detect remote blocks (called from hittable)

if (mode=3 || mode=4) if (instance_position(x+srcx+8,y+srcy+8,other.id)) {insted=1 go=other.go owner=other.owner if (mode=3) go=-go mode3flag=1 event_user(0) insted=0}
#define Other_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tlock=0

p=string_pos(",",src)
srcx=unreal(string_copy(src,1,p-1),0)*16
srcy=unreal(string_delete(src,1,p),0)*16

p=string_pos(",",dst)
dstx=unreal(string_copy(dst,1,p-1),0)*16
dsty=unreal(string_delete(dst,1,p),0)*16

if (srcx==0 && srcy==0) mode=1 else mode=2
if (srcx==dstx && srcy==dsty) {
    mode=0
    if (srcx!=0 || srcy!=0) mode=3
}
if (mode=2 && dstx==0 && dsty==0) mode=4
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,mode,x,y+dy)
if (global.lemontest) {
    if (mode=2 || mode=3 || mode=4) draw_sprite(sprite_index,5,x+srcx,y+srcy+dy)
    if (mode=1 || mode=2 || mode=3) draw_sprite(sprite_index,6,x+dstx,y+dsty+dy)
}
