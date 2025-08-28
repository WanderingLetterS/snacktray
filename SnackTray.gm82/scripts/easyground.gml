///easyground()

//im SO close to being able to delete this script and when i can itll be Awesome.. -moster
var yg,check,coll2;

//avoid zipping up walls
if (collision(0,0) && collision(0,-8)) {
    violently_shove_things_off_walls()
    return round(y/16)*16+16
}

yg=doslopshit()
if (yg<bbox_bottom-8) yg=verybignumber
check=4
if (yg=verybignumber && object_index=player) {
belt=collision(0,1)
if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
x=x+belt.beltspd;
    while check>0{
        coll=collision(0,check)
        if coll{
            coll2=collision(0,check)
            if (coll2) check-=1
            else {yg=ceil(y) check =0}
        }else check=0
    }
}else if (yg=verybignumber) {
    coll=collision(0,4)
    if (coll) yg=coll.bbox_top
}
return yg
