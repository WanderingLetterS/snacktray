if (tpos) {
    if (tpos=1) {depth=1 goinup=1 going=go dy=going}
    if (tpos=2) dy+=2*going
    if (tpos=3 || tpos=4 || tpos=5) dy+=1*going
    if (tpos=11 || tpos=12 || tpos=14) dy-=1*going
    if (tpos=13 || tpos=15) dy-=2*going
    if (tpos=16) {dy=0 goinup=0 depth=2 tpos=0 event_user(1)}
    else tpos+=1
    if (object_index=brick||object_index=brick && !anim && !carry) tile_set_position(tile,x,y+dy)
}
