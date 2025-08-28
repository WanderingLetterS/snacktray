#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
friction=0.1
getregion(x)
growsize=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fr=fr+0.2

if growsize!=0{
    image_xscale*=1+(growsize*0.1*0.25)
    image_yscale*=1+(growsize*0.1*0.25)
}
if drag{
speed*=0.99*drag

}
frame=floor(fr)

if (frame>=4) {instance_destroy() visible=0}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if owner.snacklayout{

    if owner.size==4 drawsize=1 else if owner.size==5 drawsize=0 else
    drawsize=(owner.size- (2*(owner.size>3)))
    draw_sprite_part_ext(owner.sheetshields,0,369+frame*25,9+25*drawsize,24,24,round(x-12*image_xscale),round(y-12*image_yscale),image_xscale,image_yscale,c_white,1)

}else ssw_effects("poof")
