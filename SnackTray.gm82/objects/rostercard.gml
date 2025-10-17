#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
selflash=0
image_speed=0
pointed=-1
bundle=0
flash=0
xsc=1
counter=0
is_gold=0;
show_lock=1;

is_mod=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
selflash=max(0,selflash-1)
if (selflash) flash=((selflash mod 8)>3)
else flash=0
pointed=-1
counter+=1
if (counter>=32) counter=0

if (page!=rosterctrl.page) x=verybignumber
else x=xstart
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_self()

lookx=instance_nearest(x,y,rostercursor).x
looky=instance_nearest(x,y,rostercursor).y
mindistance=999999
with rostercursor{
    if visible{
        other.newdistance=point_distance(x,y,other.x,other.y)
        if other.mindistance>=other.newdistance {other.mindistance=other.newdistance other.lookx=x other.looky=y}
    }
}



dx=-(lookx-x)/32
dy=-(looky-y)/32


repeat (5){
    dx=floor(dx)
    dy=floor(dy)
    draw_sprite(spr_rostercard,11*is_gold,x+dx,y+dy)

    if (flash) draw_sprite(spr_rostercard,6,x+dx,y+dy)

    locked=settings("lock "+global.charname[p2])

    {
        if (p2=-1) draw_sprite(spr_rostercard,7,x+dx,y+dy)
        else {
            if (locked) && (show_lock) d3d_set_fog(1,0,0,0)


            draw_sprite(icon,0,x+dx -( sprite_get_width(icon)-24 )/2  ,y+dy -( sprite_get_height(icon)-24 )/2)



            if (locked) && (show_lock) {
                d3d_set_fog(0,0,0,0)
                if lock==spr_unknown draw_sprite(spr_rostercard,8,x+dx,y+dy)
                else draw_sprite(lock,0,x+dx,y+dy)
            }
        }
    }

    with (rosterbox) if (ready && card=other.id) with (other) {
        draw_sprite_ext(spr_rostercard,other.p2+1,x+dx,y+4*bundle+dy,1,1,0,playercol(global.input[other.p2]),1)
    }

    if myswapto!=id {if string(swap)!="" {draw_sprite(spr_rostercard,9,x+dx,y+dy)  } else draw_sprite(spr_rostercard,10,x+dx,y+dy)}

    if (over) {
        if (!flash || over>2) draw_sprite_ext(spr_rostercard,5,x+dx,y+dy,1,1,0,playercol(over-1),1) //"over" doubles as rostercursor's "p2" + 1, see rostercursor step
        if (myswapto!=id && counter>=16) {
            global.halign=1
            if (string(swap)!="") {
                with globalmanager draw_systext(other.x,other.bbox_bottom-8,replacebuttonnames("[c]"))
            } else {
                with globalmanager draw_systext(other.x,other.bbox_top,replacebuttonnames("[c]"))
            }
            global.halign=0
        }
    }
    
    dy*=0.8
    dx*=0.8
    
}
over=0
