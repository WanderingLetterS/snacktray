#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sheet=global.master[biome]

if (type="l") tile_bake(sheet,168,24,16,16,x,y,1000000)
if (type="r") tile_bake(sheet,184,24,16,16,x,y,1000000)
if (type="1") tile_bake(sheet,168,40,16,16,x,y,1000000)
if (type="2") tile_bake(sheet,184,40,16,16,x,y,1000000)
if (type="3") tile_bake(sheet,184,56,16,16,x,y,1000000)
if (type="4") tile_bake(sheet,168,56,16,16,x,y,1000000)

if (type="lu") tile_bake(sheet,168,104,16,16,x,y,1000000)
if (type="ru") tile_bake(sheet,184,104,16,16,x,y,1000000)
if (type="1u") tile_bake(sheet,168,72,16,16,x,y,1000000)
if (type="2u") tile_bake(sheet,184,72,16,16,x,y,1000000)
if (type="3u") tile_bake(sheet,184,88,16,16,x,y,1000000)
if (type="4u") tile_bake(sheet,168,88,16,16,x,y,1000000)

j=place_meeting(x,y,collider)
if (!j || j.object_index!=collider) instance_create(x,y,ground)
instance_destroy()
