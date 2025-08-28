var l,tx,i,u,v,vert,async,walpha;

async=!skindat("liqsync")
walpha=skindat("walpha")

with (regionmarker) {instance_create(x,0,liquidlayer)}

with (liquidlayer) for (i=0;i<8;i+=1) {
    d3d_model_primitive_begin(lm[i],pr_trianglelist)
    vert[i]=0
}

tx=background_get_texture(global.master[0])
u=(1/background_get_width(global.master[0]))*texture_get_width(tx)
v=(1/background_get_height(global.master[0]))*texture_get_height(tx)

with liquidlayer with (waterfall) {
    getregion(x)
    top=1
        if (!position_meeting(x+8,y-8,waterblock)) top=0
    for (i=0;i<8;i+=1) { //i forgot how much i hate this way of rendering the waterfalls :thumbs_up: - -S-
        m=other.lm[i] l=88+(16*i+x*async) mod 128 t=360+top*16
        d3d_model_vertex_texture_color(m,x,y,0,l*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,walpha)
        d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y+16,0,(l+16)*u,(t+16)*v,$ffffff,walpha)
        vert[i]+=6 if (vert[i]>31000) {vert[i]=0 d3d_model_primitive_end(m) d3d_model_primitive_begin(m,pr_trianglelist)}
    }

    i=instance_create(x,y,waterblock)
    i.selfdestructnow=1
    instance_destroy()
}

with (waterblock) {
    getregion(x)
    while (!position_meeting(x+8,y+24,ground) && !position_meeting(x+8,y+24,groundsemi) && !position_meeting(x+8,y+24,waterblock) && y<region.ky) {y+=16 i=instance_create(x,y,waterfall) i.region=region}
    y=ystart
    if (selfdestructnow) instance_destroy()
    if (y=region.ky-16) instance_create(x,y+16,waterfall)

}


with (liquidlayer) {
    with (waterblock) if (region=other.region) {
        top=1
        if (!position_meeting(x+8,y-8,waterblock)) top=0
        for (i=0;i<8;i+=1) {
            m=other.lm[i] l=88+(16*i+x*async) mod 128 t=328+top*16
            d3d_model_vertex_texture_color(m,x,y,0,l*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,walpha)
            d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y+16,0,(l+16)*u,(t+16)*v,$ffffff,walpha)
            vert[i]+=6 if (vert[i]>31000) {vert[i]=0 d3d_model_primitive_end(m) d3d_model_primitive_begin(m,pr_trianglelist)}
        }
    }
    with (waterfall) if (region=other.region) {
        top=0
        if (!position_meeting(x+8,y-8,waterblock)) top=1
        for (i=0;i<8;i+=1) {
            m=other.lm[i] l=88+(16*i+x*async) mod 128 t=360+top*16
            d3d_model_vertex_texture_color(m,x,y,0,l*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,walpha)
            d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,walpha) d3d_model_vertex_texture_color(m,x+16,y+16,0,(l+16)*u,(t+16)*v,$ffffff,walpha)
            vert[i]+=6 if (vert[i]>31000) {vert[i]=0 d3d_model_primitive_end(m) d3d_model_primitive_begin(m,pr_trianglelist)}
        }
        instance_destroy()
    }
}

cement(waterblock)

with liquidlayer with (lavafall) {
    getregion(x)
    for (i=0;i<8;i+=1) {
            m=other.lm[i] l=216+(16*i+x*async) mod 128 t=360+top*16
            d3d_model_vertex_texture_color(m,x,y,0,l*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,1)
            d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y+16,0,(l+16)*u,(t+16)*v,$ffffff,1)
            vert[i]+=6 if (vert[i]>31000) {vert[i]=0 d3d_model_primitive_end(m) d3d_model_primitive_begin(m,pr_trianglelist)}
    }

    i=instance_create(x,y,lavablock)
    i.selfdestructnow=1
    instance_destroy()
}


with (lavablock) {
    getregion(x)
    while (!position_meeting(x+8,y+24,ground) && !position_meeting(x+8,y+24,lavablock) && y<region.ky) {y+=16 i=instance_create(x,y,lavafall) i.region=region}
    y=ystart
        if selfdestructnow instance_destroy()
}
with (lavablock) {
    if (position_meeting(x-8,y+8,ground) && !position_meeting(x-8,y+8,lavablock)) i=instance_create(x-16,y,lavablock) i.region=region i.kill=0
    if (position_meeting(x+24,y+8,ground) && !position_meeting(x+24,y+8,lavablock)) i=instance_create(x+16,y,lavablock) i.region=region i.kill=0
}

with (liquidlayer) {
    with (lavablock) if (region=other.region) {
        top=1
        if (!position_meeting(x+8,y-8,lavablock)) top=0
        for (i=0;i<8;i+=1) {
            m=other.lm[i] l=216+(16*i+x*async) mod 128 t=328+top*16
            d3d_model_vertex_texture_color(m,x,y,0,l*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,1)
            d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y+16,0,(l+16)*u,(t+16)*v,$ffffff,1)
            vert[i]+=6 if (vert[i]>31000) {vert[i]=0 d3d_model_primitive_end(m) d3d_model_primitive_begin(m,pr_trianglelist)}
        }
        if (!top) {mask_index=spr_masklava y+=8}
    }
    with (lavafall) if (region=other.region) {
        top=0
        if (!position_meeting(x+8,y-8,lavablock)) top=1
        for (i=0;i<8;i+=1) {
            m=other.lm[i] l=424+(16*i+x*async) mod 128 t=264+top*16
            d3d_model_vertex_texture_color(m,x,y,0,l*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,1)
            d3d_model_vertex_texture_color(m,x,y+16,0,l*u,(t+16)*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y,0,(l+16)*u,t*v,$ffffff,1) d3d_model_vertex_texture_color(m,x+16,y+16,0,(l+16)*u,(t+16)*v,$ffffff,1)
            vert[i]+=6 if (vert[i]>31000) {vert[i]=0 d3d_model_primitive_end(m) d3d_model_primitive_begin(m,pr_trianglelist)}
        }
        instance_destroy()
    }
}

with (lavablock) if (!kill) instance_destroy()

cement(lavablock)

with (lavafall) instance_destroy()

with (liquidlayer) for (i=0;i<8;i+=1) {
    d3d_model_primitive_end(lm[i])
}
