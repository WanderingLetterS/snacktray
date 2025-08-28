var p,nx,ny,mx,my,w,h,u,v,str;

p=ds_priority_create()

nx=2016
ny=2016
mx=0
my=0
with (specialeobj) {
    nx=min(nx,x)
    mx=max(mx,x)
    ny=min(ny,y)
    my=max(my,y)
    ds_priority_add(p,id,x+1000*y)
}

w=(mx-nx)/32
h=(my-ny)/32

for (v=0;v<=h;v+=1) for (u=0;u<=w;u+=1) {
    if (!place_meeting(u*32+nx,v*32+ny,specialeobj)) ds_priority_add(p,0,(u+v*1000)*32+nx+ny*1000)
}

str=""

repeat (h+1) {
    repeat (w+1) {
        b=ds_priority_delete_min(p)
        if (b) with (b) str+=string_char_at(global.specialestr,image_index+1)
        else str+="x"
    }
    str+="|"
}

ds_priority_destroy(p)

skinstr("specialstr9999",str)
skindat("specialtime9999",time)
skindat("specialchk19999",check[0])
skindat("specialchk29999",check[1])
skindat("specialchk39999",check[2])
