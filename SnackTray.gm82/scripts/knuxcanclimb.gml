///knuxcanclimb(object)
//returns if the specified object can be hung onto
var o;

if (argument[0]<=0) return climb
o=argument[0].object_index
if (o=finalwall || o=barrier || o=punchblock || o=spring) return 0
return 1
