///cement(object,onlyhorizontal)
//This coalesces large rows of colliders into very long blocks to reduce instance count
var coll;

repeat (50) {
    if (!argument[1]) with (argument[0]) {
        if (object_index=argument[0]) {
            coll=instance_place(x,y+8,argument[0])
            if (coll && coll.object_index=argument[0]) if (sign(image_yscale)=sign(coll.image_yscale) && x=coll.x && image_xscale=coll.image_xscale && coll.object_index=argument[0] && mask_index=coll.mask_index && image_index=coll.image_index) {
                image_yscale+=coll.image_yscale
                with (coll) instance_destroy()
            }
        }
    }
    with (argument[0]) {
        if (object_index=argument[0]) {
            coll=instance_place(x+8,y,argument[0])
            if (coll && coll.object_index=argument[0]) if (sign(image_xscale)=sign(coll.image_xscale) && y=coll.y && image_yscale=coll.image_yscale && coll.object_index=argument[0] && mask_index=coll.mask_index && image_index=coll.image_index) {
                image_xscale+=coll.image_xscale
                with (coll) instance_destroy()
            }
        }
    }
    if (current_time>global.loadtime+64) loadtext()
}
