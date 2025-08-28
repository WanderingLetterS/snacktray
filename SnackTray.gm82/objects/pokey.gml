#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
getregion(x)
xsc=-1
enemy2=1
sprite="pokey"
children=ds_list_create();
grav=0
hspeed=0
vspeed=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(i=0; i<ds_list_size(children); i+=1) {
    inst=ds_list_find_value(children,0)
    if instance_exists(inst) {if inst.object_index!=globalmanager with(inst) enemydie(id);}
}
ds_list_destroy(children)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (pitdeath()) instance_destroy()
if !ds_list_size(children) event_inherited();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !ds_list_size(children) event_inherited();
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;
height=unreal(height,0)
for (i=0; i<height; i+=1) {
    inst=instance_create(x,y,pokeybody)
    inst.head=id
    if (i<1) {inst.is_bottom=1 inst.hspeed=-0.5}
    ds_list_add(children,inst)
    y-=16
}

inst=ds_list_find_value(children,0)
inst.is_bottom=1
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
inst=ds_list_find_value(children,0)
inst.is_bottom=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}

ssw_enemy(sprite)
