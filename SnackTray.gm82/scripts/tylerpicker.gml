var l,t,w,h,p,str,draw,vww,vhh,sels,bw,bh,mw,mh,biome,sheet;

str=argument[0]
vww=floor(view_wview[0]/2)
vhh=floor(view_hview[0]/2)

if (data[7]="-1") biome=getbiomeid(lemongrab.typeobj[drawregion.region])
else biome=unreal(data[7],0)

if argument[1]=0
sheet=global.master[biome]
if argument[1]=1
sheet=global.masterterrain[biome]
if argument[1]=2
sheet=global.masterobjects[biome]
if argument[1]=3
sheet=global.masterdecor[biome]

bw=background_get_width(sheet)
bh=background_get_height(sheet)


mw=floor(bw/8-1)
mh=floor(bh/8-1)

p=string_pos(",",str)
l=unreal(string_copy(str,1,p-1),0)*8+8
str=string_delete(str,1,p)

p=string_pos(",",str)
t=unreal(string_copy(str,1,p-1),0)*8+8
str=string_delete(str,1,p)

p=string_pos(",",str)
w=unreal(string_copy(str,1,p-1),1)
str=string_delete(str,1,p)

h=unreal(str,1)

io_clear()

draw=0
sels=0

global.tscale=2
global.halign=1

if (data[7]="-1") biome=getbiomeid(lemongrab.typeobj[drawregion.region])
else biome=unreal(data[7],0)

while (1) {
    sels+=0.1
    rect(vww-bw/2-32,vhh-bh/2-32,bw+64,bh+64,0,1)
    draw_systext(vww,vhh-bh/2-24,"Please select a rectangle:")
    rect(vww-bw/2,vhh-bh/2,bw,bh,$ff00ff,1)
    draw_background(sheet,vww-bw/2,vhh-bh/2)
    draw_sprite_ext(spr_cursor,0,median(vww-bw/2,mouse_x,vww+bw/2),median(vhh-bh/2,mouse_y,vhh+bh/2),2,2,0,$ffffff,1)
    rect(vww-bw/2+l,vhh-bh/2+t,w*8,h*8,merge_color($ff0000,$ffffff,0.5+0.5*sin(sels)),0.5)
    if (mouse_check_button(mb_left)) {
        if (!draw) {l=max(8,floor((mouse_x-(vww-bw/2))/8)*8) t=max(8,floor((mouse_y-(vhh-bh/2))/8)*8) draw=1}
        w=min(mw-l/8,max(1,floor((mouse_x-(vww-bw/2)-l)/8)+1)) h=min(mh-t/8,max(1,floor((mouse_y-(vhh-bh/2)-t)/8)+1))
    } else draw=0
    if (mouse_check_button(mb_right) || keyboard_check(vk_anykey)) break
    screen_refresh()
    sleep(16)
    io_handle()
}

global.tscale=1
global.halign=0

io_clear()

return string(floor((l-8)/8))+","+string(floor((t-8)/8))+","+string(floor(w))+","+string(floor(h))
