#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
length = "0"
top=24
vspd=0
vsp=0
yy=y
sub=id
getregion(x)
wait=0
draw=1
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var p,wc1,wc2;

if (fall) {
    those_who_respawn=1
    vspd=min(4,vspd+0.2)

    yy+=vspd
    p=y
    y=round(yy)
    vsp=y-p

    sub.yy+=vspd
    p=sub.y
    sub.y=round(sub.yy)
    sub.vsp=sub.y-p

    count+=1
    if (count=480) {
        vspd=0
        y=yfall
        sub.vspd=0
        sub.y=syfall
        wait=0
        fall=0
        flash=1
        x=-verybignumber
        sub.x=-verybignumber
    }
    exit
}

wc1=0 wc2=0
with (player) if ((!jump || climb) && instance_place(x+4*climb*xsc,y+4*!climb,other.id)) wc1+=weight
with (player) if ((!jump || climb) && instance_place(x+4*climb*xsc,y+4*!climb,other.sub)) wc2+=weight

if (wc1!=0 || wc2!=0) wait=120

if (flash) {
    flash+=1
    if (abs(y-ystart)<4 && abs(vspd)<1.5) {
        flash=0
        x=xstart
        sub.x=sub.xstart
        those_who_respawn=0
    }
    draw=(flash mod 5<3)
}

wait=max(0,wait-1)
wc1+=0.5*sign(ystart-y)*(120-wait)/120

vspd+=0.075*sqrt(abs(wc1-wc2))*sign(wc1-wc2)
vspd=max(0,abs(vspd)-(0.033 - (0.00825 * !!flash)))*sign(vspd)

yy+=vspd
sub.yy=sub.ystart+(ystart-yy)

if (sub.yy<top+16) {if (vsp>2 && coll2) {coll2.sprung=1 coll2.jump=1 coll2.vsp=min(-2,-vsp*2/coll2.weight) sound("itemspring") springsmoke(coll2.x,coll2.y+8)} sub.yy=top+16 vsp=0 sub.vsp=0 vspd=0 yy=ystart+(sub.ystart-sub.yy) count+=1 if (count=8) {fall=1 yfall=y syfall=sub.y with (coll) {coll=id doscore_p(1000,1)}}}
else if (yy<top+16) {if (vsp<-2 && coll) {coll.sprung=1 coll.jump=1 coll.vsp=min(-2,vsp*2/coll.weight) sound("itemspring") springsmoke(coll.x,coll.y+8)} yy=top+16 vsp=0 sub.vsp=0 vspd=0 count+=1 if (count=8) {fall=1 yfall=y syfall=sub.y with (coll2) {coll=id doscore_p(1000,1)}}}
else count=0

p=y
y=round(yy)
vsp=y-p
p=sub.y
sub.y=round(sub.yy)
sub.vsp=sub.y-p

yg=y
sub.yg=sub.y
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
test=16384
with (pulley_sub) {if (x<other.test && x>other.x) {other.test=x other.sub=id main=other.id}}

sheet=global.master[biome]

tile_bake(sheet,272,8,16,16,xstart-8,top,999998)
tile_bake(sheet,304,8,16,16,sub.xstart-8,top,999998)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
p=xstart+(sub.yg mod 16)+8
repeat ((sub.xstart-xstart)/16-2) {
    draw_background_part(sheet,296,8,16,16,p,top)
    p+=16
}

draw_background_part(sheet,296+16-(sub.yg mod 16),8,(sub.yg mod 16),16,xstart+8,top)
draw_background_part(sheet,296,8,16-(sub.yg mod 16),16,p,top)

p=yg-16
repeat ((yg-top-24)/16) {
    draw_background_part(sheet,312,24,16,16,xstart-8,p)
    p-=16
}

draw_background_part(sheet,312,24+16-(p-top),16,p-top,xstart-8,top+16)

p=sub.yg-16
repeat ((sub.yg-top-24)/16) {
    draw_background_part(sheet,312,24,16,16,sub.xstart-8,p)
    p-=16
}

draw_background_part(sheet,312,24+16-(p-top),16,p-top,sub.xstart-8,top+16)

if (draw) {
    x=xstart
    sub.x=sub.xstart
    if length = "0"
    {
    ssw_tile("platform")
    }
    else
    {
    draw_background_part_ext(global.master[biome],328,8,16,16,x-16,y,image_xscale,image_yscale,c_white,image_alpha)
    draw_background_part_ext(global.master[biome],360,8,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)
    }
    with (sub) {
        if length = "0"
        {
        ssw_tile("platform")
        }
        else
        {
        draw_background_part_ext(global.master[biome],328,8,16,16,x-16,y,image_xscale,image_yscale,c_white,image_alpha)
        draw_background_part_ext(global.master[biome],360,8,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)
        }
    }
    if (flash) {
        x=-verybignumber
        sub.x=-verybignumber
    }
}
