#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=assetdepth+1

for (i=0;i<8;i+=1) lm[i]=d3d_model_create()

getregion(x)

tex=background_get_texture(global.master[region.biome])
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<8;i+=1) d3d_model_destroy(lm[i])
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (view_xview[view_current]=median(region.lefthand-400,view_xview[view_current],region.x))
    d3d_model_draw(lm[global.frame88],-0.5,-0.5,0,tex)
