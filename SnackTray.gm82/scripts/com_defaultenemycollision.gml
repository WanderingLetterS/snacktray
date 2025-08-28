/// returns 1 if an enemy is hit, 2 if they're stomped

if (coll) {
    if (!coll.damage_player_on_contact) {
        calcfall=fall
        if (fall=5 || fall=12) calcfall=0
        global.coll=id
        type=coll.object_index
            
        seqcount=max(1,seqcount)
        
        if (super) {
            if (water) seqcount=1
            enemyexplode(coll)
            return 1
        }
            
        if (coll.object_index=lakitu) if (coll.flee) return 7  //little shit.
        
        if (star  
        || (spin && type!=spinyegg && type!=beetle && type!=koopa && !object_is_ancestor(type,koopa) && type!=shell)
        || (pound>13 && type!=piranha && type!=spinyegg && type!=spiny)) {
            instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
            if (type=hammerbro) seqcount=max(5,seqcount)
            enemydie(coll)                
            return 3
        }
        
        if (spindash || inst || firedash) {if (diggity=32) exit enemyexplode(coll) return 1}
        
        if (type=piranha || coll.damage_player_on_contact) {
            hurtplayer("enemy")
            return 0
        }
        
        
         
    if (spin) {
    if (type=koopa|| object_is_ancestor(type,koopa)) { with enemyflip(coll) {y-=3 vspeed=-3 intangible_timer=30} return 4 }
            else if (type=beetle ) {enemystomp(coll) jump=1 jumpspd=0.5 vsp=-((abs(hsp)*1.25)+(abs(gm8exspd))) hsp/=1.5 return 2}
            else if (type=spinyegg) {hurtplayer("enemy") return 0 }
            else {enemydie(coll) return 3}
        }
    
     
        if (type=spiny) {
            if (!fall && vsp<0 && size!=5) {enemyexplode(coll) return 1}
            else {hurtplayer("enemy") return 0}
        }
        if (type=spinyegg) {
            if (punch && punch<=10) {enemydie(coll) return 1} else {hurtplayer("enemy") return 0}
        }               
                
        if (type=shell && !coll.time) {          
            if (coll.type="spiny" && (coll.vspeed-vsp)*coll.ysc<0) {
                hurtplayer("enemy") return 0
            } else if (!coll.kicked || (coll.stop && (coll.owner=id || coll.vspeed>=0))) {
                if (coll.stop && !coll.kicked) doscore_p(8000)
                else {seqcount=max(seqcount,2+scorelok1) doscore_p()}
                if (jump) {
                    if (vsp>0) {
                        vsp=-3-akey*1.5
                        canstopjump=akey
                        if (fall=12) fall=5
                        
                    }
                }
                kicksound(0)
                instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
                with (coll) {spd=max(3,abs(other.hsp)+1) hspeed=spd*esign(x-other.x,other.xsc) owner=other.id kicked=1 stop=0 phase=owner}
                return 6
                
            } else {
                if (coll.kicked && !coll.stop && sign(hsp)=sign(coll.hspeed) && abs(hsp)>abs(coll.hspeed)) {
                    kicksound(0)
                    instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
                    coll.spd=max(3,abs(hsp)+1)
                    coll.owner=id
                    coll.phase=id
                    return 6
                } else if (coll.kicked && (!coll.stop || (coll.owner!=id && coll.vspeed<0)) && (vsp<0 || !jump)) {hurtplayer("enemy") return 0}
                else {
                    with (coll) {hspeed=0 owner=noone phase=other.id stop=0 kicked=0 time=15}
                    vsp=-3-akey*1.5 canstopjump=akey sound("enemystomp") doscore_p() if (fall=12) fall=5 return 2
                }
            }                    
        }
        
        if (type=blooper) {
            if (jump && (!calcfall || !water) && vsp>0 && size!=5) {if (calcfall) {enemystomp(coll,5) return 2} else {enemyexplode(coll) return 1}}
            else if (size==5 && jump && (!calcfall || !water) && vsp>0) {
               vsp=-3-akey*1.5
               canstopjump=akey
               if (fall=12) fall=5
               playsfx(name+"jump",0,1.8)
               return 5
            }
            else {hurtplayer("enemy") return 0}
        }
        
        if (type=cheepred || type=cheepwhite) {
            if (jump && !calcfall && !size==5) {enemyexplode(coll) return 1}
            else if (!calcfall && size==5 && jump) {
                if (vsp>0) {
                vsp=-3-akey*1.5
                canstopjump=akey
                if (fall=12) fall=5
                playsfx(name+"jump",0,1.8)
                } else {hurtplayer("enemy") return 0}
            }
            else {hurtplayer("enemy") return 0}
        }
        
        if (jump) {
            if (type=koopa || type=beetle || type=rexbig || object_is_ancestor(type,koopa)) {
                if (vsp<0) {
                    if (calcfall || size==5) {hurtplayer("enemy") return 5 }
                    else {enemyexplode(coll) return 1}
                }
            } else {
                if (!calcfall && size!=5) {enemyexplode(coll) return 1}
                if (vsp<0) {hurtplayer("enemy") return 0}
            }
            
            if (type=goomba && seqcount=1 && !scorelok4) {seqcount=0 scorelok4=1}    
            if ((type=koopa || type=redkoopa) && seqcount=1) scorelok1=1    
            if (type=hopkoopa || type=redhover) seqcount=max(seqcount,1)
            if (type=hammerbro) seqcount=max(5,seqcount)
            if (fall=12) fall=5
    
            if (size==5) {
                if (vsp>0) {
                    vsp=-3-akey*1.5
                    canstopjump=akey
                    if (fall=12) fall=5
                    playsfx(name+"jump",0,1.8)
                    return 5
                }
                else {hurtplayer("enemy") return 0}
            }          
            else {enemystomp(coll) return 2 }   
        } else if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 vsp=-0.5 if size!=5 {enemystomp(coll) return 2} else {playsfx(name+"jump",0,1.8) return 5}}
        
        hurtplayer("enemy") return 0  
    } else if (!star && !flash) {hurtplayer("enemy") return 0}
}
