///rectangle_bounce(coll)
//makes the current instance bounce realistically off the
//rectangle defined by the argument's bounding box

var i;
i=argument[0]

if (hspeed>0) if (lines_intersect(x-hspeed*5,y-vspeed*5,x+hspeed*5,y+vspeed*5,i.bbox_left,i.bbox_top,i.bbox_left,i.bbox_bottom+1)!=0) {
    //left edge
    hspeed=-abs(hspeed)
    x+=hspeed
    return 1
}
if (hspeed<0) if (lines_intersect(x-hspeed*5,y-vspeed*5,x+hspeed*5,y+vspeed*5,i.bbox_right,i.bbox_top,i.bbox_right,i.bbox_bottom+1)!=0) {
    //right edge
    hspeed=abs(hspeed)
    x+=hspeed
    return 1
}
if (vspeed>0) if (lines_intersect(x-hspeed*5,y-vspeed*5,x+hspeed*5,y+vspeed*5,i.bbox_left,i.bbox_top,i.bbox_right+1,i.bbox_top)!=0) {
    //top edge
    vspeed=-abs(vspeed)
    y+=vspeed
    return 1
}
if (vspeed<0) if (lines_intersect(x-hspeed*5,y-vspeed*5,x+hspeed*5,y+vspeed*5,i.bbox_left,i.bbox_bottom,i.bbox_right+1,i.bbox_bottom)!=0) {
    //bottom text
    vspeed=abs(vspeed)
    y+=vspeed
    return 1
}

direction+=180
return 0
