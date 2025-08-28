#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile_delete(mytile)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

mytile=tile_dyn(global.master[biome],8,312+16*!!position_meeting(x+8,y-8,hardblock),16,16,x,y,999999)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

switch (place){
    case 0: mytile=tile_dyn(global.master[biome],8,248+32*!!position_meeting(x+8,y-8-16,hardblock),16,16,x,y,999999) break;
    case 1: mytile=tile_dyn(global.master[biome],8+16,248+32*!!position_meeting(x+8,y-8-16,hardblock),16,16,x,y,999999) break;
    case 2: mytile=tile_dyn(global.master[biome],8,248+16+32*!!position_meeting(x+8,y-8-16,hardblock),16,16,x,y,999999) break;
    case 3: mytile=tile_dyn(global.master[biome],8+16,248+16+32*!!position_meeting(x+8,y-8-16,hardblock),16,16,x,y,999999) break;


}
