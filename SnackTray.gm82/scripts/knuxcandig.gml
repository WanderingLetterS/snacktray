///knuxcandig(object)
//returns if the specified object can be dug into
var o;

if (argument[0]<=0) return 0
o=argument[0].object_index
if (o=finalwall || o=barrier || o=spring || o=grateblock || o=punchblock) return 0
if (object_is_ancestor(o,hittable)) {
    if (position_meeting(argument[0].x+8,argument[0].y+24,collider)) return 0
}
return 1
