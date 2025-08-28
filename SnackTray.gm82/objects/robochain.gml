#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=0
mode=0
captype=-1

image_xscale=6
image_yscale=6
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (c>=56) mode=1
if (mode) c-=2 else c+=3
if (c<=0) {
    visible=0

    if (captype=mushroom) give_item(owner,"mushroom")
    if (captype=flower) give_item(owner,"flower")
    if (captype=lifemush) give_item(owner,"lifemush")
    if (captype=starman) give_item(owner,"star")
    if (captype=starshard) enter_special(owner)
    if (captype=mushpoison) with (owner) hurtplayer("poison")
    owner.myhitbox=noone
    instance_destroy()
}
#define Collision_item
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.object_index=redcoin) with (other) {gibcoinred(other.owner,1)}
else if (other.object_index=coin) with (other) {give_item(other.owner,"coin") instance_destroy()}
else if (other.object_index=token) with (other) {gibtoken(other.owner) instance_destroy()}
else if (captype=-1) {captype=other.object_index biome=other.biome fuel=other.fuel p2=other.p2 offx=median(-8,x-other.x,8) offy=median(-8,y-other.y,8) with (other) instance_destroy()}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=owner.x+c*xsc
y=owner.y
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_effects("robochain")
if (captype) {
    x-=offx y-=offy
    if (captype=mushroom) ssw_items("mushroom")
    if (captype=flower) ssw_items("fflower")
    if (captype=lifemush) ssw_items("lifemush")
    if (captype=starman) ssw_items("star")
    if (captype=starshard) ssw_items("shard")
    if (captype=mushpoison) ssw_items("mushpoison")
    x+=offx y+=offy
}
if (global.debug) draw_self()
