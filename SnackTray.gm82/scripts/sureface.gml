///sureface(name,w,h):id
//makes SURE that your surFACE is ready :)
var name,p,s,w,h,nw,nh,mem;

name=argument[0]
nw=argument[1]
nh=argument[2]

p=ds_list_find_index(global.surefacenames,name)

if (p!=-1) {
    s=ds_map_find_value(global.surefaces,name)
    w=ds_map_find_value(global.surefaces,name+"_sf_w")
    h=ds_map_find_value(global.surefaces,name+"_sf_h")

    if (surface_exists(s)) {
        if (nw=w && nh=h && surface_get_width(s)=w && surface_get_height(s)=h) {
            ds_map_set(global.surefaces,name+"_sf_t",60)
            return s
        }
        show_debug_message("sureface: size mismatch "+qt+name+qt)
        sureface_free(name)
    }
}

s=surface_create(nw,nh)
if (surface_exists(s)) {
    ds_map_set(global.surefaces,name,s)
    ds_map_set(global.surefaces,name+"_sf_w",nw)
    ds_map_set(global.surefaces,name+"_sf_h",nh)
    ds_map_set(global.surefaces,name+"_sf_t",60)
    ds_list_add(global.surefacenames,name)
    show_debug_message("sureface: new surface "+qt+name+qt+" ("+string(nw)+"x"+string(nh)+")")
    mem=(nw*nh*4)/1024
    ds_map_set(global.surefaces,"_sf_totmem",ds_map_find_value(global.surefaces,"_sf_totmem")+mem)
    show_debug_message("sureface: allocated "+string(mem)+"KB of vram")
    show_debug_message("(total: "+string(ds_map_find_value(global.surefaces,"_sf_totmem"))+"KB)")
    return s
}

show_message(lang("error sureface1")+string(nw)+"x"+string(nh)+lang("error sureface2"))
with (all) instance_destroy()
show_error(lang("error lowram"),1)
return -1
