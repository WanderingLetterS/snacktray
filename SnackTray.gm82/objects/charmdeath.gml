#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=used in charm
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=#define death
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event="step"
event_user(p2)
spriteswitch(1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if owner.usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,totpal+1)

spriteswitch(0)
shader_reset()
event="draw"
event_user(p2)
