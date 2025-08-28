#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_number(airbubble)>50) {
    var old; old=verybignumber
    with (airbubble) if (id<old) old=id
    with (old) instance_destroy()
}

waterlevel=0
getregion(x)

spr=global.effectssheet[biome]

if (region.typebg="water") waterlevel=40
else {
    cx=floor(x/16)*16+8
    cy=floor(y/16)*16+8
    while (position_meeting(cx,cy,waterblock)) {
        cy-=16
    }
    waterlevel=min(cy+8,region.water)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
jet=max(0,jet-0.5)

x+=random_range(-jet,jet)

y-=1+sin(y/2)/2-jet
if (y<waterlevel && !jet) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_part(spr,0,158,133,24,24,floor(x-12),floor(y-12))
