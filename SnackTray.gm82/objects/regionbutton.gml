#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
empty=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
editloadregion(n)


if !(settings("nolemonsound")) sound("lemonselectitem")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(spr_editorregionshadow,0,x,y,1,1,0,c_black,0.5)
draw_sprite(spr_editorregion,over || n=drawregion.region,x,y)
if (n=drawregion.region) draw_sprite(spr_editorregion,2,x,y)
draw_sprite_part(spr_biomes,getbiomeid(lemongrab.typebg[n]),0,0,20,30,x,y)
if (empty) rect(x,y,20,30,0,0.5)

if (over) drawtooltip((bbox_left+bbox_right)/2,97,"Region "+string(n+1),1)
