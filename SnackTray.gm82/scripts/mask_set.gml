///mask_set(w,h,[dont check ceiling])
//sets the size of the player's collision mask
var check;
if argument[0]-1=bbox_right-bbox_left 
    if argument[1]-1=bbox_bottom-bbox_top
    exit


if (argument_count<3 && argument[1]>mask_h) {
    check=argument[1]-mask_h
} else {
    check=0
}

mask_w=median(2,argument[0],96)
mask_h=median(2,argument[1],96)

if (dotkid) {
    mask_w=2
    mask_h=2
}

sprite_collision_mask(global.playermask[p2],0,2,48-ceil(mask_w/2),96-ceil(mask_h),48+floor(mask_w/2)-1,96-1,1,0)
mustabovemoving=1
if (check) if (collision(0,0)) y+=check
mustabovemoving=0
