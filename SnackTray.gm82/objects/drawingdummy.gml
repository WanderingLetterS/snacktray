#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color = $ffffff
getregion(x)
draweffect=""
image = global.effectssheet[biome]
alpha=1
xscale=1
yscale=1
width=24
height=24
left=58
top=83
xsc=1
bgdrawer=0
maxindex=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if delimageondest{
    sprite_delete(image)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if maxindex>0 {if index>=maxindex index=indexloop index+=frspd }
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
collwithplayer=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if draweffect!=""
ssw_effects(draweffect)
else if bgdrawer=0
draw_sprite_general(
        image,floor(index),
        left,top,
        width,height,
        x+xoff,
        y+yoff,
        xscale,yscale,rot,
        color,color,color,color,alpha
    )
else
draw_background_general(
        global.master[biome],
        left,top,
        width,height,
        x+xoff,
        y+yoff,
        xscale,yscale,rot,
        color,color,color,color,alpha
    )
