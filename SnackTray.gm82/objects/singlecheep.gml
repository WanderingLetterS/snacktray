#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type="0"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
p=instance_nearest(x,y,player) if (p) {
    if (x>view_xview[p.p2]-16 && y>view_yview[p.p2]-16 && x<view_xview[p.p2]+416 && y<view_yview[p.p2]+240) {
        if (type="0") o=cheepred
        if (type="1") o=cheepwhite
        if (type="2") o=cheepfly
        i=instance_create(x,y,o)
        i.hspeed=abs(i.hspeed)*esign(x-p.x,1)
        i.xsc=sign(i.hspeed)
        if (o=cheepfly) with (i) event_user(0)
        instance_destroy()
    }
}
