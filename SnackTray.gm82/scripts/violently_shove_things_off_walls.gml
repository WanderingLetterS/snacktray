var coll,left,right,top,bottom;

coll=instance_place(x,y,collider)
if (coll) { //ANTI CLIPPING
    //sorry this is a little bit wacky but its the best i know LOL
    left=point_distance(bbox_left+sprite_width/2,bbox_top+sprite_height/2,coll.bbox_left,coll.y)
    right=abs(point_distance(bbox_left+sprite_width/2,bbox_top+sprite_height/2,coll.bbox_right,coll.y))
    top=point_distance(bbox_left+sprite_width/2,bbox_top+sprite_height/2,coll.x,coll.bbox_top)
    bottom=abs(point_distance(bbox_left+sprite_width/2,bbox_top+sprite_height/2,coll.x,coll.bbox_bottom))

    if (right < left) && (right < top) && (right < bottom)
    x+=1;
    else if (bottom > right) && (bottom > left) && (bottom > top)
    y-=1;
    else if (right > left) && (right > top) && (right > bottom)
    x-=1;
    else if (bottom < right) && (bottom < left) && (bottom < top)
    y+=1;

    return 1
} else return 0
