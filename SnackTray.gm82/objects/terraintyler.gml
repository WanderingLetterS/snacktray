#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
layer=unreal(layer,0)
blend=unreal(blend,$ffffff)
str=tile

if (bim="-1") getregion(x)
else biome=unreal(bim,0)

d=assetdepth+2
if (layer=1) d=999998
if (layer=2) d=-1

p=string_pos(",",str) l=unreal(string_copy(str,1,p-1),0)*8+8 str=string_delete(str,1,p)
p=string_pos(",",str) t=unreal(string_copy(str,1,p-1),0)*8+8 str=string_delete(str,1,p)

p=string_pos(",",str)
w=unreal(string_copy(str,1,p-1),1)
h=unreal(string_delete(str,1,p),1)

str=off p=string_pos(",",str)
xd=unreal(string_copy(str,1,p-1),0)*8
yd=unreal(string_delete(str,1,p),0)*8

str=rep p=string_pos("x",str)
ur=unreal(string_copy(str,1,p-1),0)
vr=unreal(string_delete(str,1,p),0)

flip=unreal(mirror,0)
col=blend

w=max(1,w)
h=max(1,h)
ur=max(1,ur)
vr=max(1,vr)

xsc=1 ysc=1
if (flip&1) {xsc=-1}
if (flip&2) {ysc=-1}

tiles[0]=0

for (u=0;u<ur;u+=1) for (v=0;v<vr;v+=1) {
    tile=tile_dyn(global.masterterrain[biome],l,t,w*8,h*8,x+xd+u*w*8-8*-(xsc=-1)*w,y+yd+v*h*8-8*-(ysc=-1)*h,d,1)
    tile_set_scale(tile,xsc,ysc)
    tile_set_blend(tile,col)
    tiles[0]+=1
    tiles[tiles[0],0]=tile
    tiles[tiles[0],1]=xd+u*w*8+8-8*xsc
    tiles[tiles[0],2]=yd+v*h*8+8-8*ysc
}

coll=unreal(coll,0)
if (coll) {
    if (coll=1) mycoll=instance_create(x+xd,y+yd,tilerground)
    if (coll=2) mycoll=instance_create(x+xd,y+yd,phaser)
    if (coll=3) mycoll=instance_create(x+xd,y+yd,spike)
    if (coll=4) mycoll=instance_create(x+xd,y+yd,sonicspike)
    mycoll.image_xscale=ur*w/2
    mycoll.image_yscale=vr*h/2
}
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=1;i<=tiles[0];i+=1) {
    tile_set_position(tiles[i,0],x+i*w+(xsc=-1 *w),y+tiles[i,2])
    mycoll.x=x+xd
    mycoll.y=y+yd
}
