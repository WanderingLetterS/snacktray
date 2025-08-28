#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
if !position_meeting(x-8,y-8,castleceiling){
if (!(((x+y) div 16) mod 2)) {
    if (position_meeting(x-8,y+8,castleceiling)) tile_bake(global.master[biome],40,312,32,16,x-16,y,999999)
    else tile_bake(global.master[biome],72,312,16,16,x,y,999999)
} else if (!position_meeting(x+24,y+8,castleceiling)) tile_bake(global.master[biome],72,312,16,16,x,y,999999)
}else{
if (!(((x+y) div 16) mod 2)) {
    if (position_meeting(x-8,y+8,castleceiling)) tile_bake(global.master[biome],56,328,32,16,x-16,y,999999)
    else tile_bake(global.master[biome],40,328,16,16,x,y,999999)
} else if (!position_meeting(x+24,y+8,castleceiling)) tile_bake(global.master[biome],40,328,16,16,x,y,999999)

}
instance_create(x,y,ground)
