//drawassets()
exit


var j,i,spr,w,h,fh,hw,top,dx,dy,type,ab,blend;
global.hassprite=0
instance_activate_object(anchor)
if instance_exists(anchor)
for (j=1;j<=global.asset[0,0];j+=1) {
    i=global.assetz[j]
    if (global.asset[i,8]!="" && global.asset[i,1]=0 && global.asset[i,5]=argument[0]) {


        spr=global.asset[i,0]

        dx=global.asset[i,2]
        dy=global.asset[i,3]
        anim=global.asset[i,4]
        anim2=global.asset[i,7]
        type=global.asset[i,8]
        if i!=1
            //if type!=global.asset[i-1,8]
                global.hassprite=0
        ab=global.asset[i,9]
        blend=global.asset[i,10]
        w=global.asset[i,11]
        h=global.asset[i,12]

        biomefoundforasset=0
        if global.asset[i,4]<=1 noanimasset=1 else noanimasset=0

        fh=round(h/global.asset[i,4])

        top=fh*floor((bgmanager.animcarl*global.asset[i,7]) mod global.asset[i,4])
        hw=floor(w/2)
        if (blend=1) draw_set_blend_mode(bm_add)
        if (blend=2) draw_set_blend_mode(bm_subtract)
        // -S- here, I need to test this new asset shit I'm making, so checkpoints and the castle flag are currently not viewable
        /*
        if (type="left") with (regionmarker) if (self.type=ab || ab==-1) draw_sprite_part(spr,0,0,top,w,fh,lefthand+dx,ky+dy-fh)
        if (type="right") with (regionmarker) if (self.type=ab || ab==-1) draw_sprite_part(spr,0,0,top,w,fh,x+dx-w,ky+dy-fh)
        if (type="spawn") with (spawner) if (biome=ab || ab==-1) draw_sprite_part(spr,0,0,top,w,fh,x+dx-hw,y+dy-fh+16)
        if (type="checkpoint") with (checkpoint) if (biome=ab || ab==-1) draw_sprite_part(spr,0,0,top,w,fh,x+dx-hw,y+dy-fh+16)
        if (type="checkpoint_off") with (checkpoint) if (biome=ab || ab==-1 && !passed) draw_sprite_part(spr,0,0,top,w,fh,x+dx-hw,y+dy-fh+16)
        if (type="checkpoint_on") with (checkpoint) if (biome=ab || ab==-1 && passed) draw_sprite_part(spr,0,0,top,w,fh,x+dx-hw,y+dy-fh+16)
        if (type="flag") with (flaggy) if (visible) draw_sprite_part(spr,0,0,top,w,fh,x+dx-hw,y+dy-fh/2)
        */
        // -S- here again, we moved this shit outside of assets
        ifounditshutyobitchassmouth=0
        with (anchor){ 
            if ((biome=ab) && name=type) {
                if !global.hassprite {
                    global.assetsprite=sprite_add(spr,0,1,0,0,0)
                    global.hassprite=1
                }
                ifounditshutyobitchassmouth=1
                global.asset[i,11]=sprite_get_width(global.assetsprite)
                global.asset[i,12]=sprite_get_height(global.assetsprite)
                w=global.asset[i,11]
                h=global.asset[i,12]
                hw=floor(w/2)
                fh=round(h/global.asset[i,4])
                if other.noanimasset {
                    with (instance_create(x+dw-hw,y+dy-fh,assethelper)) {
                            sprite_index=global.assetsprite
                        }
                        instance_destroy()
                        
                } else {
                    other.createmyasshole=1 
                    other.createx=x 
                    other.createy=y
                    //dude why
                    with (other) {
                        if createmyasshole {
                            createmyasshole=0 
                            bruhmoment=noone   
                            bruhmoment=instance_create(createx,createy,assethelperanim)
                            bruhmoment.myass2=anim2  
                            bruhmoment.myass1=anim bruhmoment.spr=global.assetsprite
                            bruhmoment.sprite_index=global.assetsprite
                            bruhmoment.top=top 
                            bruhmoment.w=w 
                            bruhmoment.fh=fh 
                            bruhmoment.dx=dx 
                            bruhmoment.hw=hw 
                            bruhmoment.dy=dy
                        }
                    }
                } 
                instance_destroy() 
                biomefoundforasset=1 
            }
        }
        if !ifounditshutyobitchassmouth
        with (anchor){ 
            if ((ab=69||ab=-1) && name=type && biomefoundforasset=0 ) {
                if !global.hassprite {
                    global.assetsprite=sprite_add(spr,0,1,0,0,0)
                    global.hassprite=1
                }
                global.asset[i,11]=sprite_get_width(global.assetsprite)
                global.asset[i,12]=sprite_get_height(global.assetsprite)
                w=global.asset[i,11]
                h=global.asset[i,12]
                hw=floor(w/2)
                fh=round(h/global.asset[i,4])
                if other.noanimasset {
                    with (instance_create(x+dw-hw,y+dy-fh,assethelper)) {
                        sprite_index=global.assetsprite
                    }
                    instance_destroy()
                } else {
                    other.createmyasshole=1 
                    other.createx=x 
                    other.createy=y 
                    with (other) {
                        if createmyasshole {
                            createmyasshole=0 
                            bruhmoment=noone   
                            bruhmoment=instance_create(createx,createy,assethelperanim)
                            bruhmoment.myass2=anim2  
                            bruhmoment.myass1=anim bruhmoment.spr=global.assetsprite
                            bruhmoment.sprite_index=global.assetsprite
                            bruhmoment.top=top 
                            bruhmoment.w=w 
                            bruhmoment.fh=fh 
                            bruhmoment.dx=dx 
                            bruhmoment.hw=hw 
                            bruhmoment.dy=dy
                        }
                    }
                } 
                        instance_destroy()
            }
        }

       
         if (blend) draw_set_blend_mode(0)
    }
}
