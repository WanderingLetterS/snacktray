#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

if (!lock) {
    if (!position_meeting(x-8,y+8,groundblock) && !position_meeting(x+24,y+8,groundblock)) event_user(1)
    else lock=1
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!funnytruefalse(noblock)) {
    tile_bake(global.masterobjects[biome],280,328,16,16,x,y,1000000)
    instance_create(x,y,ground)
}
if (string(type)="0") type="normal"
angle=unreal(angle,0)

if (!no && type!="off") {
    i=instance_create(x+8,y+8,firebar)
    if (funnytruefalse(clockwise)) i.dir=-1
    i.length=unreal(length,6)
    if !angle
    i.image_angle=(round((x*3)/30)*30)+angle
    else
    i.image_angle=round(angle)
    if (type="cookie") {i.cookie=1 i.mask_index=spr_round12}
    else {i.length=max(1,i.length) i.image_xscale=i.length*2-1}
}
instance_destroy()
