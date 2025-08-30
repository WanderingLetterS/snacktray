#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
randvalue=instance_number(intro_fallingobject) mod 10
switch(randvalue){
case 1: sprite_index=spr_coin break;
case 2: sprite_index=spr_redcoin break;
case 3: sprite_index=spr_mushroom break;
case 4: sprite_index=spr_1up break;
case 5: sprite_index=spr_poison break;
case 6: sprite_index=spr_flower break;
case 7: sprite_index=spr_feather break;
case 8: sprite_index=spr_starman break;
case 9: sprite_index=spr_shield break;
case 0: sprite_index=spr_ring break;
case 10: sprite_index=spr_tflower break;
case 11: sprite_index=spr_wflower break;
case 12: sprite_index=spr_iflower break;
case 13: sprite_index=spr_cflower break;
case 14: sprite_index=spr_questionmush break;
}
if egg(1) sprite_index=spr_mark
image_speed=0
y-=random(90)
x=random_range(view_xview,view_xview+view_hview*2)
gravity=0.7//+random(1)
rot=-2+random(4)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=rot
