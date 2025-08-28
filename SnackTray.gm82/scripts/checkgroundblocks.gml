///checkgroundblocks(start,count)
//i'm 1.9ing out rn
var xx;

xx=argument0+8
if (xx>region.x) return 0
repeat (argument1) {
    if (!instance_position(xx,y+24,collider)) return 0
    xx+=16
}
return 1
