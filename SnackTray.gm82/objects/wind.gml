#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
strength=2/3
dir=-1
image_xscale=1
image_yscale=1
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
strength=unreal(strength,-1)/3
dir=unreal(dir,-1)
image_xscale=unreal(w,-1)
image_yscale=unreal(h,-1)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.hyperspeed=strength*sign(dir)
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.hsp=strength*sign(dir)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.lemontest || global.debug) {image_alpha=0.35 draw_self()}
