#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch(real(dir))
{
case 0:
    velocity=-10
    hvelocity=0
    image_index=0
break;
case 1:
    velocity=10
    hvelocity=0
    image_index=1
break;
case 2:
    velocity=0
    hvelocity=-10
    image_index=2
break;
case 3:
    velocity=0
    hvelocity=10
    image_index=3
break;
case 4:
    velocity=-10
    hvelocity=-10
    image_index=4
break;
case 5:
    velocity=-10
    hvelocity=10
    image_index=5
break;
case 6:
    velocity=10
    hvelocity=-10
    image_index=6
break;
case 7:
    velocity=10
    hvelocity=10
    image_index=10
break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.debug) draw_self();
ssw_objects("terrainsprong")
