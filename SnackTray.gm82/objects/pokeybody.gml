#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
xsc=-1

damage_player_on_contact=1
enemy2=1
sprite="pokeybody"
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(head) {
    val=ds_list_find_index(head.children,id)
    ds_list_delete(head.children,val)
    inst=ds_list_find_value(head.children,val)
    if instance_exists(inst) {
        if (inst.object_index != globalmanager) {
            inst.hspeed=hspeed
            inst.grav=grav
        }
    }
    with(head) event_user(4);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (is_bottom) && instance_exists(head) {
    s=s+3 mod 360
    for(i=0; i<ds_list_size(head.children); i+=1) {
        inst=ds_list_find_value(head.children, i)
        if !(inst.is_bottom) {
            inst.y=y-16*i
            inst.x=x
            inst.xsc=xsc

            //inst.xoff=round(lengthdir_y(4,s*ds_list_size(head.children)/2)+i)
        }
    }
    head.y=y-16*ds_list_size(head.children)
    head.x=x
    head.xsc=xsc
    //head.xoff=round(lengthdir_y(4,s*ds_list_size(head.children)/2))

    grav=0.25
    //xoff=round(lengthdir_y(4,s*ds_list_size(head.children)/2)-1)
} else {
    grav=0
    hspeed=0
    vspeed=0
}

if !instance_exists(head)
enemydie(id)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (is_bottom) event_inherited()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (is_bottom) event_inherited()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy(sprite)
