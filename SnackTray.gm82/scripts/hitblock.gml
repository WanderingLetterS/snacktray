///hitblock(block,owner,insted,direction,picked)

global.coll=argument[1]
if (object_is_ancestor(argument[0].object_index,hittable))
    with (argument[0]) if ((!goinup || other.tempbrick) && (!hit || object_index!=brick)) {insted=argument[2] go=argument[3] picked=argument[4] event_user(0) insted=0 picked=0}
