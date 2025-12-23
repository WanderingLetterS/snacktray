#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t=0
alarm[0]=10
alpha=0.5
blend=$ffffff
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
k=(k+1) mod 8

visible=k<2
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
k=global.boosttrail

name=other.name
p2=other.p2
sprite=other.sprite
sheet=other.sheet
frame=other.frame
size=other.size
xsc=other.xsc
ysc=other.ysc
super=other.super
dir=other.dir
hsp=other.hsp
vsp=other.vsp
dotkid=other.dotkid
depth=other.depth+4
sid=other.sid
sprite_angle=other.sprite_angle
blend=other.afterimageblend
charm_init()
sheets[other.size]=other.sheets[other.size]
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
if owner.usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,size,totpal+1)

spriteswitch(0)
shader_reset()
draw_set_blend_mode(0)
