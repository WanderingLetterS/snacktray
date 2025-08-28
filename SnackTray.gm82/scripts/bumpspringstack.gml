///bumpspringstack()

with (instance_place(x,y-2,spring)) if (vspeed>=0) {
    vspeed=-2
    y=other.y-17
    bumpspringstack()
}
