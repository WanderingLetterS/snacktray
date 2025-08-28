#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
beforelife=global.lifes
if (give_item(other.id,"1up")) {
    with (instance_create(x,y-16,scoreeffect)) value=10+settings("cog inflives")
    if settings("cog inflives") global.lifes=beforelife global.scor[other.p2]+=10000 //i am sorry.
    instance_destroy()
    visible=1
}

if (egg() && !global.worldskin) instance_create(0,0,weirdlife)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_items("lifemush")
