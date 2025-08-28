#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
length = "0"

pos=0

repeat (x mod 384) {
    pos=(pos+1) mod 384

    c=string_char_at(global.plattable,pos+1)
    if (c="a") y+=1
    if (c="b") y+=2
    if (c="c") y-=1
    if (c="d") y-=2
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
pos=(pos+1) mod 384

c=string_char_at(global.plattable,pos+1)

var p; p=y
if (c="a") y+=1
if (c="b") y+=2
if (c="c") y-=1
if (c="d") y-=2
vsp=y-p
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if length = "0"
{
ssw_tile("platform")
}
else
{
draw_background_part_ext(global.master[biome],328,8,16,16,x-16,y,image_xscale,image_yscale,c_white,image_alpha)
draw_background_part_ext(global.master[biome],360,8,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)
}
