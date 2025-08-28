///lemonrunner()

/*

             LEMON
       File loader module
   initial v. renex nov/2018

*/
var offx,o,i,j,count,lg;

lg=lemongrab.id

with (spawner) {
    if (global.lemontest) {
        x=lg.tspawnx*16
        y=lg.tspawny*16+16
    } else {
        x=lg.spawnx*16
        y=lg.spawny*16+16
    }
}

offx=0
i=0
repeat (8) {
    with (instance_create(offx+lg.w[i]*16,0,regionmarker)) {
        type=lg.typeobj[i]
        typebg=lg.typebg[i]
        typemus=lg.typemus[i]
        lefthand=offx
        ky=lg.h[i]*16+16
        water=(lg.h[i]-lg.water[i])*16+16
        horizon=(lg.h[i]-lg.horizon[i])*16
        bpm=lg.bpm[i]
        bpb=lg.bpb[i]
        lightlevel=lg.lightlevel[i]
        if horizon<=0 horizon=-verybignumber
        else horizon+=16
        if (water==16) {water=-16 with (instance_create(offx,0,barrier)) {image_xscale=(other.x-x)/16}}
    }



    with (lg.gods[i]) {
        if obj {
            o=instance_create(offx+x*16+off+off2x,y*16+off+off2y+16,obj)
            count=lg.objlist[dataid,3]
            if (count) {j=0 repeat (count) {variable_instance_set(o,lg.objlist[dataid,5+j],data[j]) j+=1}}
            if (current_time>global.loadtime+64) loadtext()
        }
    }
    with (lg.waters[i]) {
        instance_create(offx+x*16,y*16+16,waterblock)
        if (current_time>global.loadtime+64) loadtext()
    }
    with (lg.semis[i]) {
        if obj {
            instance_create(offx+x*16,y*16+16,obj)
            if (current_time>global.loadtime+64) loadtext()
        }
    }
    with (lg.backs[i]) {
        if obj {
            instance_create(offx+x*16,y*16+16,obj)
            if (current_time>global.loadtime+64) loadtext()
        }
    }

    j=0
    k=0
    repeat(72) {
        v=lg.cambitmap[i,k]
        v2=lg.cambitmap2[i,k]
        v3=lg.cambitmap3[i,k]
        b=128
        repeat (8) {
            if (j mod 24<lg.w[i]/25 && j div 24<lg.h[i]/14) {
                if (v & b) instance_create(offx+(j mod 24)*400,(j div 24)*224+16,camblock)
                if (v2 & b) instance_create(offx+(j mod 24)*400,(j div 24)*224+16,camsecret)
                if (v3 & b) instance_create(offx+(j mod 24)*400,(j div 24)*224+16,camsecret)
                b=b>>1
            }
            j+=1
        } k+=1
    }
    offx+=lg.w[i]*16+global.screenwidth
    i+=1
}

with (objcontainer) instance_destroy()
with (watercontainer) instance_destroy()
with (semicontainer) instance_destroy()
with (backcontainer) instance_destroy()
