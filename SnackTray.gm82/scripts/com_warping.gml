if (sprongin) {
    if (timeend || finish) exit;
    instance_activate_object(myheaven)
    sprongin+=1
    if (!skindat("nofade") && (sprongin=80 || sprongin=180)) {
        i=instance_create(0,0,pipefader)
        i.p2=p2
    }
    if (sprongin=100) {
        x=myheaven.x+8 y=myheaven.y+48
        if (global.mplay>1) {flash=1 fk=0}
        vspeed=-5 hspeed=hsp gravity=0.1
    }
    if (sprongin=101) {
        player_camera(1)
        set_sprite("fly")
        stagemusic(id,p2)
        alarm[2]=-1
    }
    if (sprongin=115) {piped=0 vsp=vspeed gravity=0 speed=0 jump=1 fall=1 tired=0 fly=0 sprongin=0}
    if (sprongin=200) {
        x=myheaven.target.x y=myheaven.target.y-32
        if (global.mplay>1) {flash=1 fk=0}
        hsp=0 vsp=0 visible=1 fall=0 piped=0
    }
    if (sprongin=201) {
        player_camera(1)
        stagemusic(id,p2)
        gamemanager.alarm[7]=1
        sprongin=0
    }
}

if (pipe) {
    getregion(x)
    instance_activate_object(pipeid)
    instance_activate_object(pipeid.t)
    ppos+=1

    if (ppos<30) {
        if (who_put_SHIT_in_my_PIP) {
            //slide towards center of vertical pipes
            x=inch(x,pipeid.xgo,2)
            if (squishyness) {
                if ((bbox_right-bbox_left)*pxsc>squishyness) pxsc*=0.95
            }
        } else {

        }

        //prevent player from sliding out of view in a piped sequence
        if (x+hspeed>gamemanager.righthand[p2]-7 || x+hspeed<gamemanager.origin[p2]+7) {
            hspeed=0 x=median(gamemanager.origin[p2]+7,x,gamemanager.righthand[p2]-7)
        }
    }

    com_hitboxupdate()

    if (ppos=30) {speed=0 visible=0 who_put_SHIT_in_my_PIP=0}
    if (timeend || finish) exit;
    if (ppos=40) {
        if (!skindat("nofade") && !warppipe) {
            if (pipeid.t.region!=pipeid.region || point_distance(pipeid.x,pipeid.y,pipeid.t.x,pipeid.t.y)>512) {
                i=instance_create(0,0,pipefader)
                i.p2=p2
            } else {
                slidefromx=view_xview[p2] slidefromy=view_yview[p2]
                x=pipeid.t.x y=pipeid.t.y
                if (pipeid.t.object_index=pipeblock) y-=14
                if (pipeid.t.object_index=downpipe) y+=30
                if (pipeid.t.object_index=sidepipe) {x-=8 y+=18}
                if (pipeid.t.object_index=theothersidepipe) {x+=24 y+=18}
                if (pipeid.t.object_index=warpbox) {x+=8 y+=8}
                if (pipeid.t.object_index=door || pipeid.t.object_index=chardoor) {x+=8 y+=2}
                if (pipeid.t.object_index=worldmap_tile) {x+=8 y+=8 visible=1}
                player_camera(1) respawncamslide=1
                safevx=view_xview[p2] safevy=view_yview[p2]
                view_xview[p2]=slidefromx view_yview[p2]=slidefromy
            }
        }
        if (pipeid.t.cann) fastpipe=1
    }
    if (ppos=60 && warppipe) {
        var z;
        repeat(global.mplay) {
            global.size[z]=(gamemanager.players[z]).size
            global.shielded[z]=(gamemanager.players[z]).shielded
        }
        global.nextlevel=pipeid.nextlevel
        game_stageend()
    }
    if (warppipe) exit;
    if (ppos=60) {
        pxsc=1 pysc=1
        if ((bbox_bottom-bbox_top)>20 && (pipeid.t.object_index=sidepipe || pipeid.t.object_index=theothersidepipe)) && squishyness pysc=20/(bbox_bottom-bbox_top)
        if ((bbox_right-bbox_left)>20 && (pipeid.t.object_index=pipeblock || pipeid.t.object_index=downpipe)) && squishyness pxsc=20/(bbox_right-bbox_left)
    }
    if (pipe=4 || pipe=5) {
        if (ppos=60) {x=pipeid.t.x+8 y=pipeid.t.y+2 visible=0 ysc=1 xsc=esign(xsc,1) pipeid.t.open=1 pipeid.noswitch=1 pipeid.t.alarm[0]=40 lookup=0 charm_run("stop") charm_run("exitpipe")}
        if (ppos=61) {player_camera(1) stagemusic(id,p2)}
        if (ppos=90) {set_sprite("doorexit") visible=1 }
        if (ppos=120) {piped=0 pipe=0 hsp=0 vsp=0}
    } else {
        if (ppos=60) {
            charm_run("exitpipe")
            x=(pipeid.t).x y=(pipeid.t).y safex=x safey=y water=0 visible=0 spin=0 rise=0 pound=0 crouch=0 xsc=1 boost=0 jump=0 hsp=0 vsp=0
            if (global.mplay>1) {flash=1 fk=0}
            if (pipeid.t.object_index=pipeblock) y+=16
            else if (pipeid.t.object_index=sidepipe) {x+=16 y+=16}
            else if (pipeid.t.object_index=theothersidepipe) y+=16
            else if (pipeid.t.object_index=worldmap_tile) {piped=0 pipe=0 x+=8 y+=8 visible=1}

        }
        if (ppos=61) {
            player_camera(1)
            if (carry) {updatecarry() with (carryid.carry) getregion(x)}
            stagemusic(id,p2)
            if (pipeid.t.object_index=warpbox) {piped=0 pipeid.spit=1 with pipeid.t event_user(1) pipeid.t.spit=1 pipe=0 visible=1 jump=1 jumpspd=1 fall=0 frspd=0.2 depth=0 visible=1}
            else if (pipeid.t.object_index=droptarget) {piped=0 pipe=0 visible=1 alarm[6]=-1 jump=1 jumpspd=1 fall=6 oldsize=size frspd=0.2 depth=0}
        }
        if (ppos>=60) with (piranha) if (abs(x-other.x)<16) {alarm[0]=200 open=0 y=ystart+24 active=0}
        if (ppos=80 && fastpipe) {
            frspd=0.25 visible=1 playsfx(name+"release") screenshake(x,4)
            if (pipeid.t.object_index=sidepipe) {hspeed=-3 set_sprite("ball") xsc=-1}
            if (pipeid.t.object_index=theothersidepipe) {hspeed=3 set_sprite("ball") xsc=1}
            if (pipeid.t.object_index=downpipe) {vspeed=8 set_sprite("ball")}
            if (pipeid.t.object_index=pipeblock) {vspeed=-8 set_sprite("ball")}
            camspd=-4
        }
        if (ppos=83 && fastpipe) {
            sound("enemycannon")
            if (pipeid.t.object_index=pipeblock) {
                with (instance_create(x-8,y+4,smoke)) {friction=0.1 hspeed=-2 vspeed=-1}
                with (instance_create(x+8,y+4,smoke)) {friction=0.1 hspeed=2 vspeed=-1}
            }
            if (pipeid.t.object_index=downpipe) {
                with (instance_create(x-8,y-4,smoke)) {friction=0.1 hspeed=-2 vspeed=1}
                with (instance_create(x+8,y-4,smoke)) {friction=0.1 hspeed=2 vspeed=1}
            }
            if (pipeid.t.object_index=sidepipe) {
                with (instance_create(x-4,y-8,smoke)) {friction=0.1 hspeed=-1 vspeed=-2}
                with (instance_create(x-4,y+8,smoke)) {friction=0.1 hspeed=-1 vspeed=2}
            }
            if (pipeid.t.object_index=theothersidepipe) {
                with (instance_create(x+4,y-8,smoke)) {friction=0.1 hspeed=1 vspeed=-2}
                with (instance_create(x+4,y+8,smoke)) {friction=0.1 hspeed=1 vspeed=2}
            }
        }
        if (ppos=85 && fastpipe) {
            if (pipeid.t.object_index=downpipe) {speed=0 vsp=8 downpiped=1 piped=0 pipe=0 jump=1 fall=0 depth=0}
            if (pipeid.t.object_index=pipeblock) {speed=0 vsp=-8 piped=0 pipe=0 jump=1 fall=0 depth=0}
        }
        if (ppos=89 && fastpipe) {
            speed=0 pipe=0 piped=0 push=0 hsp=0 vsp=0 jump=1 depth=0 y=(pipeid.t).y+18
            if (pipeid.t.object_index=sidepipe) hsp=-3
            if (pipeid.t.object_index=theothersidepipe) hsp=3
            hyperspeed=sign(hsp)*3
        }
        if (ppos=100) {
            visible=1 frspd=0.15 sound("itempipeexit")
            if (pipeid.t.object_index=pipeblock) {vspeed=-1 if !fastpipe set_sprite("pipingup")}
            if (pipeid.t.object_index=sidepipe) {hspeed=-1 if !fastpipe set_sprite("sidepiping") xsc=-1}
            if (pipeid.t.object_index=theothersidepipe) {hspeed=1 if !fastpipe set_sprite("sidepiping") xsc=1}
            if (pipeid.t.object_index=downpipe) {vspeed=1 if !fastpipe set_sprite("piping")}
        }
        if (ppos=128) {
            vsp=vspeed hsp=hspeed speed=0 piped=0 push=0 depth=0 jump=0 pipe=0
            if (pipeid.t.object_index=pipeblock) {y=(pipeid.t).y-14 pollenated=0}
            if (pipeid.t.object_index=downpipe) {jump=1 y=(pipeid.t).y+30}
            if (pipeid.t.object_index=sidepipe) {hsp=-1 vsp=0 y=(pipeid.t).y+18} //these two spawn the player like 2 pixels above the floor so its almost guaranteed they'll fall and end pollen
            if (pipeid.t.object_index=theothersidepipe) {hsp=1 vsp=0 y=(pipeid.t).y+18}   
        }
    }
} 
if (!pipe) {
    ppos=0
    pxsc=min(1,pxsc/0.95)
    pysc=min(1,pysc/0.95)
}
