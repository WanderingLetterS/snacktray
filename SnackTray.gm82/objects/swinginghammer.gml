#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
base=instance_create(x-16,y-16,collider);
base.image_xscale=2;
base.image_yscale=2;
length=88;
rot_amount=0.1;
released=0;
STOP_IT_RIGHT_NOW_STOP=0;
rot=real(startingrot);
range=112;
alarm[0]=1;

getregion(x);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=real(startingrot)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase) {if (!invincible(phase)) {phasec+=1 if (phasec>=10) {phase=-1 phasec=0}}}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///i give up lol
switch real(startingrot)
{
    case 0: event_user(0) break;
    case 90: event_user(1) break;
    case 180: event_user(2) break;
    case 270: event_user(3) break;
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.flash || other.hurt || other.piped || other.id=phase) exit

with (other) {
    if (spinjump && vsp>0) {
        vsp=-4-ckey*1.5
        instance_create(x,y+14,kickpart)
        playsfx(name+"spinbounce")
        other.phase=id
        exit
    } else {
        if (flash || hurt || piped || invincible()) exit
    }
}

if (other.power_lv<2) with (other) hurtplayer("spike")
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///0
if (abs(nearestplayer().x-x)<range)
released=1;

if (real(reversed))
swingdir=1
else
swingdir=-1

if (released) && !(STOP_IT_RIGHT_NOW_STOP)
{
    rot_amount+=0.1;
    rot+=rot_amount*real(swingdir);
    rot=wrap_val(rot,0,359)

    collhit=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),hittable,false,true)
    if (collhit) {
        with(collhit)
        {
        sound("itemblockbreak")
        instance_destroy();
         i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
         i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
         i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
        i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
        }
    }



    collhb=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),hardblock,false,true)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){type=4 hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){type=4 hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){type=4 hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){type=4 hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=instance_place(x,y,hardblock)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){type=4 hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){type=4 hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){type=4 hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){type=4 hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),crackedground,false,true)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){type=5 hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){type=5 hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){type=5 hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){type=5 hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=instance_place(x,y,crackedground)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){type=5 hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){type=5 hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){type=5 hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){type=5 hspeed=1 vspeed=-3+2*go}
     }
    }

    if (place_meeting(x,y,ground)) {
        STOP_IT_RIGHT_NOW_STOP=1
        screenshake(x,4)
        instance_create(x+lengthdir_x(length,rot+22.5),y+lengthdir_y(length,rot+22.5),kickpart)
        shoot(x+lengthdir_x(length,rot+22.5),y+lengthdir_y(length,rot+22.5),smoke,-0.1,-3)
        shoot(x+lengthdir_x(length,rot+22.5),y+lengthdir_y(length,rot+22.5),smoke,-0.1,3)
    }


    if (real(swingdir)) == 1 {
        if (round(rot)>=wrap_val(real(startingrot)-5,0,355)) {
            screenshake(x,8)
            STOP_IT_RIGHT_NOW_STOP=1
        }
    }

    if (real(swingdir)) == -1
    {
        if (round(rot)<=wrap_val(real(startingrot)+5,0,355)) {
            STOP_IT_RIGHT_NOW_STOP=1
            screenshake(x,8)
        }
    }
}

if (STOP_IT_RIGHT_NOW_STOP)
{
    released=0
    rot_amount=0.5;
    if (real(swingdir)) == 1
    {
        rot-=0.5;
        screenshake(x,2)
    }else{
        rot+=0.5;
        screenshake(x,2)
    }
    rot=wrap_val(rot,0,359)

    if round(rot)>=real(startingrot)-2 && round(rot)<=real(startingrot)+2{
        STOP_IT_RIGHT_NOW_STOP=0;
        rot=real(startingrot)
    }
}

image_angle=rot;
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///90
if (abs(nearestplayer().x-x)<range)
released=1;

if (real(reversed))
swingdir=1
else
swingdir=-1

if (released) && !(STOP_IT_RIGHT_NOW_STOP)
{
    rot_amount+=0.1;
    rot+=rot_amount*real(swingdir);
    rot=wrap_val(rot,0,359)

    owner=nearestplayer()

    collhit=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),hittable,false,true)
    if (collhit) {
        with(collhit)
        {
        sound("itemblockbreak")
        instance_destroy();
         i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
         i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
         i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
        i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
        }
    }



    collhb=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),hardblock,false,true)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=instance_place(x,y,hardblock)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),crackedground,false,true)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=instance_place(x,y,crackedground)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    if (place_meeting(x,y,ground)) {
        STOP_IT_RIGHT_NOW_STOP=1
        screenshake(x,4)
        instance_create(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot-22.5),kickpart)
        shoot(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot+22.5),smoke,-0.1,-3)
        shoot(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot+22.5),smoke,-0.1,3)
    }

    if (real(swingdir)) == 1 {

        if (round(rot)<=wrap_val(90-5,0,355) && round(rot)>=wrap_val(90-15,0,355))  {
            screenshake(x,8)
            STOP_IT_RIGHT_NOW_STOP=1
        }
    }

    if (real(swingdir)) == -1
    {

        if (round(rot)>=wrap_val(90+5,0,355) && round(rot)<=wrap_val(90+15,0,355)) {
            STOP_IT_RIGHT_NOW_STOP=1
            screenshake(x,8)
        }
    }
}

if (STOP_IT_RIGHT_NOW_STOP)
{
    released=0
    rot_amount=0.5;
    if (real(swingdir)) == 1
    {
        rot-=0.5;
        screenshake(x,2)
    }else{
        rot+=0.5;
        screenshake(x,2)
    }
    rot=wrap_val(rot,0,359)

    if round(rot)==real(startingrot) {
        STOP_IT_RIGHT_NOW_STOP=0;
        rot=real(startingrot)
    }
}

image_angle=rot;
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///180
if (abs(nearestplayer().x-x)<range)
released=1;

if (real(reversed))
swingdir=1
else
swingdir=-1

if (released) && !(STOP_IT_RIGHT_NOW_STOP)
{
    rot_amount+=0.1;
    rot+=rot_amount*real(swingdir);
    rot=wrap_val(rot,0,359)

    owner=nearestplayer()

    collhit=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),hittable,false,true)
    if (collhit) {
        with(collhit)
        {
        sound("itemblockbreak")
        instance_destroy();
         i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
         i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
         i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
        i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
        }
    }



    collhb=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),hardblock,false,true)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=instance_place(x,y,hardblock)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),crackedground,false,true)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=instance_place(x,y,crackedground)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    if (place_meeting(x,y,ground)) {
        STOP_IT_RIGHT_NOW_STOP=1
        screenshake(x,4)
        instance_create(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot-22.5),kickpart)
        shoot(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot+22.5),smoke,-0.1,-3)
        shoot(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot+22.5),smoke,-0.1,3)
    }

    if (real(swingdir)) == 1 {

        if (round(rot)<=wrap_val(180-5,0,355) && round(rot)>=wrap_val(180-15,0,355))  {
            screenshake(x,8)
            STOP_IT_RIGHT_NOW_STOP=1
        }
    }

    if (real(swingdir)) == -1
    {

        if (round(rot)>=wrap_val(180+5,0,355) && round(rot)<=wrap_val(180+15,0,355)) {
            STOP_IT_RIGHT_NOW_STOP=1
            screenshake(x,8)
        }
    }
}

if (STOP_IT_RIGHT_NOW_STOP)
{
    released=0
    rot_amount=0.5;
    if (real(swingdir)) == 1
    {
        rot-=0.5;
        screenshake(x,2)
    }else{
        rot+=0.5;
        screenshake(x,2)
    }
    rot=wrap_val(rot,0,359)

    if round(rot)==real(startingrot) {
        STOP_IT_RIGHT_NOW_STOP=0;
        rot=real(startingrot)
    }
}

image_angle=rot;
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///270
if (abs(nearestplayer().x-x)<range)
released=1;

if (real(reversed))
swingdir=1
else
swingdir=-1

if (released) && !(STOP_IT_RIGHT_NOW_STOP)
{
    rot_amount+=0.1;
    rot+=rot_amount*real(swingdir);
    rot=wrap_val(rot,0,359)

    owner=nearestplayer()

    collhit=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),hittable,false,true)
    if (collhit) {
        with(collhit)
        {
        sound("itemblockbreak")
        instance_destroy();
         i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
         i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
         i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
        i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
        }
    }



    collhb=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),hardblock,false,true)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=instance_place(x,y,hardblock)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=collision_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)),crackedground,false,true)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    collhb=instance_place(x,y,crackedground)
    if (collhb) {
    with (collhb)
    {
    sound("itemblockbreak")
    instance_destroy();
     i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
     i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
     i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
     i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
     }
    }

    if (place_meeting(x,y,ground)) {
        STOP_IT_RIGHT_NOW_STOP=1
        screenshake(x,4)
        instance_create(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot-22.5),kickpart)
        shoot(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot+22.5),smoke,-0.1,-3)
        shoot(x+lengthdir_x(length,rot-22.5),y+lengthdir_y(length,rot+22.5),smoke,-0.1,3)
    }

    if (real(swingdir)) == 1 {

        if (round(rot)<=wrap_val(270-5,0,355) && round(rot)>=wrap_val(270-15,0,355))  {
            screenshake(x,8)
            STOP_IT_RIGHT_NOW_STOP=1
        }
    }

    if (real(swingdir)) == -1
    {

        if (round(rot)>=wrap_val(270+5,0,355) && round(rot)<=wrap_val(270+15,0,355)) {
            STOP_IT_RIGHT_NOW_STOP=1
            screenshake(x,8)
        }
    }
}

if (STOP_IT_RIGHT_NOW_STOP)
{
    released=0
    rot_amount=0.5;
    if (real(swingdir)) == 1
    {
        rot-=0.5;
        screenshake(x,2)
    }else{
        rot+=0.5;
        screenshake(x,2)
    }
    rot=wrap_val(rot,0,359)

    if round(rot)==real(startingrot) {
        STOP_IT_RIGHT_NOW_STOP=0;
        rot=real(startingrot)
    }
}

image_angle=rot;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterobjects[biome],216,376,32,32,base.x,base.y,1,1,c_white,image_alpha)

radrot=degtorad(rot)
//if egg()
//draw_background_general(global.masterobjects[biome],480,552,88,96,x+lengthdir_x(((length/2)+256)-margin,rot+90),y+lengthdir_y(((length/2)+8)-margin,rot+90),1,1,rot,$ffffff,$ffffff,$ffffff,$ffffff,1)

draw_background_general(global.masterobjects[biome],472,232,88,96,(x-7*cos(radrot))-sin(radrot) *(96/2),(y+7*sin(radrot))-cos(radrot)*(96/2),1,1,rot,$ffffff,$ffffff,$ffffff,$ffffff,1)



draw_background_part_ext(global.masterobjects[biome],248,376,32,32,base.x,base.y,1,1,c_white,image_alpha)

if (global.debug) {
    draw_line(x,y,x+lengthdir_x(length,rot+(45*swingdir)),y+lengthdir_y(length,rot+(45*swingdir)))
    draw_systext(x,y,rot)
    draw_systext(x,y+16,startingrot)
    draw_systext(x,y+32,STOP_IT_RIGHT_NOW_STOP)
}
