#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (pos=0;pos<6;pos+=1) {
    list[pos,0]=x
    list[pos,1]=y
}

follower=noone

jump=0
xsc=1
xp=x
frc=0
frame=0
bob=0
posbob=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(owner) || !instance_exists(follow)) {instance_create(x,y,smoke) instance_destroy() exit}

if (owner.hold=id) exit

grounded=position_meeting(list[pos,0],list[pos,1]+9,collider)
image_xscale=0.5
walled=place_meeting(x,y,collider)
image_xscale=1

if (abs(x-follow.x)>8 || abs(bbox_bottom-follow.bbox_bottom)>14 || !(grounded || position_meeting(x,y+9,collider)) || walled) {
    list[pos,0]=follow.x
    list[pos,1]=follow.bbox_bottom-6
    list[pos,2]=follow.depth
    pos=(pos+1) mod (6-3*!!owner.piped)
    posbob+=0.4
} else if (!grounded) {
    list[pos,1]+=1
    list[pos,0]+=sign(list[pos,0]-follow.x)
    x+=sign(x-follow.x)
}

if (!grounded) bob=0

x=mean(x,x,list[pos,0]+6*sign(x-owner.x)*!!grounded*!walled)
y=mean(y,list[pos,1])
if (point_distance(x,y,follow.x,follow.y)>100) {
    instance_create(x,y,smoke)
    x=follow.x
    y=follow.y
    for (pos=0;pos<6;pos+=1) {
        list[pos,0]=x
        list[pos,1]=y
        list[pos,2]=owner.depth
    }
}

bob=(bob*9+abs(x-xprevious)*1.5)/10
depth=list[pos,2]
k=id
do {k=k.follow depth+=0.1} until (k=owner || depth>5)
if (owner.piped) depth=owner.depth
if (abs(x-xp)>4) {xp=x xsc=esign(x-xp,xsc)}
frc+=1 if (frc=30) {frc=0 frame=!frame}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_items("keyfollow")
