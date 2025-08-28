#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y-=16
p=position_meeting(x+8,y+24,treewall)
y+=16

if (p) if (side=p.side && id>p.id) exit

if bottom=1 tile_bake(global.master[biome],104+16*side,200,16,16,x,y-16,1000005)
else
tile_bake(global.master[biome],104+16*side,184,16,16,x,y,1000005)
