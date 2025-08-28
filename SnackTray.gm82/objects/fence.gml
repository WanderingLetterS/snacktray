#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

c9=position_meeting(x+24,y-8,fence) || position_meeting(x+24,y-8,slopeground) || position_meeting(x+24,y-8,slopel1) || position_meeting(x+24,y-8,slopel2) || x=region.x-16
c6=position_meeting(x+24,y+8,fence) || position_meeting(x+24,y+8,slopeground) || position_meeting(x+24,y+8,slopel1) || position_meeting(x+24,y+8,slopel2) || x=region.x-16
c7=position_meeting(x-8,y-8,fence) || position_meeting(x-8,y-8,slopeground) || position_meeting(x-8,y-8,sloper1) || position_meeting(x-8,y-8,sloper2) || x=region.lefthand
c4=position_meeting(x-8,y+8,fence) || position_meeting(x-8,y+8,slopeground) || position_meeting(x-8,y+8,sloper1) || position_meeting(x-8,y+8,sloper2) || x=region.lefthand
c1=position_meeting(x-8,y+24,fence) || position_meeting(x-8,y+24,slopeground) || x=region.lefthand || y=region.ky-16
c3=position_meeting(x+24,y+24,fence) || position_meeting(x+24,y+21,slopeground) || x=region.x-16 || y=region.ky-16
c8=position_meeting(x+8,y-8,fence) || position_meeting(x+8,y-8,slopeground)
c2=position_meeting(x+8,y+24,fence) || y=region.ky-16
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var bx,by,sheet;

bx=x mod 16
by=y mod 16
sheet=global.master[biome]

if (c1 && c2 && c3 && c4 && c6 && c7 && c8 && c9) {/*middle fill*/ tile_bake(sheet,504,328,16,16,x,y,999998)}
else if (!c8 && !c4 && !c6 && !c2) {/*lone tile*/ tile_bake(sheet,536,360,16,16,x,y,999998)}
else if (!c8 && !c2) {
    if (!c4) {/*platform left*/ tile_bake(sheet,488,360,16,16,x,y,999998)}
    else if (!c6) {/*platform right*/ tile_bake(sheet,520,360,16,16,x,y,999998)}
    else {/*platform middle*/ tile_bake(sheet,504,360,16,16,x,y,999998)}
} else if (!c4 && !c6) {
    if (!c8) {/*pole top*/ tile_bake(sheet,536,312,16,16,x,y,999998)}
    else if (!c2) {/*pole bottom*/ tile_bake(sheet,536,344,16,16,x,y,999998)}
    else {/*pole middle*/ tile_bake(sheet,536,328,16,16,x,y,999998)}
} else {
    if (!c4) {
        if (!c8) {
            if (!c3) {corner=1} else {/*corner top left*/ tile_bake(sheet,488,312,16,16,x,y,999998)}
        } else if (!c2) {
            if (!c9) {corner=1} else {/*corner bottom left*/ tile_bake(sheet,488,344,16,16,x,y,999998)}
        } else {
            if (!c9 || !c3) {corner=1} else {/*left wall*/ tile_bake(sheet,488,328,16,16,x,y,999998)}
        }
    } else if (!c6) {
        if (!c8) {
            if (!c1) {corner=1} else {/*corner top right*/ tile_bake(sheet,520,312,16,16,x,y,999998)}
        } else if (!c2) {
            if (!c7) {corner=1} else {/*corner bottom right*/ tile_bake(sheet,520,344,16,16,x,y,999998)}
        } else {
            if (!c7 || !c1) {corner=1} else {/*right wall*/ tile_bake(sheet,520,328,16,16,x,y,999998)}
        }
    } else {
        if (!c8) {
            {/*floor*/ tile_bake(sheet,504,312,16,16,x,y,999998)}
        } else if (!c2) {
            {/*ceiling*/ tile_bake(sheet,504,344,16,16,x,y,999998)}
        } else {
            if (!c7) {/*inner corner top left*/ tile_bake(sheet,456,312,16,16,x,y,999998)}
            else if (!c9) {/*inner corner top right*/ tile_bake(sheet,472,312,16,16,x,y,999998)}
            else if (!c1) {/*inner corner bottom left*/ tile_bake(sheet,456,328,16,16,x,y,999998)}
            else if (!c3) {/*inner corner bottom right*/ tile_bake(sheet,472,328,16,16,x,y,999998)}
        }
    }
}
