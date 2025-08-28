#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_wview[0]/2-400+xstart
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//percent bar

this=instance_number(objcontainer)+instance_number(watercontainer)+instance_number(semicontainer)+instance_number(backcontainer)
sum=0
for (i=0;i<8;i+=1) if (i=drawregion.region) sum+=this else sum+=drawregion.count[i]
n=this/8192
n2=sum/16384

draw_sprite_ext(spr_editorquotashadow,0,x,y,1,1,0,c_black,0.5)
draw_sprite(sprite_index,0,x,y)
draw_sprite_part(sprite_index,1,0,0,floor(sprite_width*n),sprite_height,x-3,y-3)
draw_sprite_part(sprite_index,2,0,0,floor(sprite_width*n2),sprite_height,x-3,y-3)

if (over) drawtooltip(bbox_right,97,"Object count#This region: "+string(floor(n*100))+"%#Total limit: "+string(floor(n2*100))+"%",2)
