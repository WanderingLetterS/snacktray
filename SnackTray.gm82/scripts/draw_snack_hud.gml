if cpu_partner exit
var i,t,p,spr,col,col2,n,n,s,ps,key,fsiner,maintain_ring;
p=id

d3d_transform_stack_push()
d3d_transform_add_translation(hoffx,hoffy,0)

//draw_sprite(hudspr,0,global.screenwidth/2-hudw,0)

spr=sheets[drawize]

//if dontdrawhudler=1 exit
//okay at what player does the split happen
p_offset=75

if global.moreplayersitis && p2==0{
    mpsplit=8
    global.mphudder[0]=0
    global.mphudder[1]=0
    global.mphudder[2]=0
    global.mphudder[3]=0
    global.mphudder[4]=0
    global.mphudder[5]=0
    global.mphudder[6]=0
    global.mphudder[7]=0
    repeat (7){
        if (mpsplit*p_offset) > (global.screenwidth-p_offset) {global.mphudder[mpsplit]=1 mpsplit-=1}

    }
mpsplit+=1
}


if !(global.nohud) && !(dontdrawhudler) && !global.mphudder[p2]{
    if global.moreplayersitis{
        if p2==0{
            i=0
            repeat (4){
                if global.mphudder[i+4]
                draw_snack_mphud(i+4,i+4-mpsplit)
            i+=1
            }

            i=0+(global.moreplayersitis*4)
            repeat (4){
                if global.cpu[i]
                draw_snack_mphud(i+4,i+4-mpsplit)
            i+=1
            }
        }
    } else {
        repeat (4){
            if global.cpu[i]
            draw_snack_mphud(i+4,i)
            i+=1
        }

    }

    if !(global.legacy_skin[p2]){
    // apply ma shader
    scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,totpal+1)
    draw_sprite_part(spr,0,59,22,21,21,6+p_offset*p2,global.screenheight-24) //grin emoji

    draw_sprite_part(spr,0,8,8,65,13,26+p_offset*p2,global.screenheight-24+9 ) //That's my name! :)

    if maxe>0{
    //energy holder
    switch (maxe){
        case 1: draw_sprite_part(spr,0,8,22,4,10,27+p_offset*p2,global.screenheight-24) draw_sprite_part(spr,0,54,22,4,10,31+p_offset*p2,global.screenheight-24) break; //special cases for 1 and 2
        case 2: draw_sprite_part(spr,0,8,22,8,10,27+p_offset*p2,global.screenheight-24) draw_sprite_part(spr,0,50,22,8,10,35+p_offset*p2,global.screenheight-24) break;
        default:
        draw_sprite_part(spr,0,8,22,16,10,27+p_offset*p2,global.screenheight-24) //the starter segment is guaranteed
        tester=(maxe-2)
        offx=0
        while (tester>0){
            if tester==1{draw_sprite_part(spr,0,50,22,8,10,43+offx+p_offset*p2,global.screenheight-24)}
            else if tester==2{draw_sprite_part(spr,0,42,22,16,10,43+offx+p_offset*p2,global.screenheight-24)}
            else draw_sprite_part(spr,0,25,22,16,10,43+offx+p_offset*p2,global.screenheight-24)
            offx+=16
            tester-=2
        }
        break;
    }
    //The actual fucking energy itself

    switch (maxe){
        case 1: if energy draw_sprite_part(spr,0,8,33,min(4,4-min(4,(0.5-energy)*8)),10,27+p_offset*p2,global.screenheight-24) if energy>0.5 draw_sprite_part(spr,0,54,33,4-((0.5-(energy-0.5))*4),10,31+p_offset*p2,global.screenheight-24) break; //special cases for 1 and 2
        case 2: if energy draw_sprite_part(spr,0,8,33,min(8,8-min(8,(1-energy)*8)),10,27+p_offset*p2,global.screenheight-24) if energy>1 draw_sprite_part(spr,0,50,33,8-((1-(energy-1))*8),10,35+p_offset*p2,global.screenheight-24) break;
        default:
        if energy{
            draw_sprite_part(spr,0,8,33,16-min(16,(2-min(2,energy))*8),10,27+p_offset*p2,global.screenheight-24) //the starter segment is guaranteed
                tester=(maxe-2)
                offx=0
                enercheck=(energy-2) //remaining energy
            while (enercheck>0){
                if tester==1{draw_sprite_part(spr,0,50,33,8-min(8,(1-enercheck)*8),10,43+offx+p_offset*p2,global.screenheight-24)}
                else if tester==2{draw_sprite_part(spr,0,42,33,16-min(16,(tester-enercheck)*8),10,43+offx+p_offset*p2,global.screenheight-24)}
                else if (enercheck>=2) draw_sprite_part(spr,0,25,33,16,10,43+offx+p_offset*p2,global.screenheight-24)

                else draw_sprite_part(spr,0,25,33,16-min(16,(2-(enercheck mod 2))*8),10,43+offx+p_offset*p2,global.screenheight-24)
                offx+=16
                tester-=2
                enercheck-=2
            }
        }
        break;
    }
    }

    shader_reset()



    draw_skintext(16,8,chr(36)+chr(42)+format(global.coins[view_current],2),$ffffff)
    maintain_ring=0
    if global.rings[view_current]=0
        with itemdrop if type="ringup" && p2=view_current {maintain_ring=1}
    if global.rings[view_current]==0
        col2=$ffffff
        if global.frame8 col2=$ff
    if ringxoffset!=-44 && global.rings[view_current]=0 && !maintain_ring{
        ringxoffset-=1
        col2=$ff
    }else if ringxoffset!=16 && (global.rings[view_current]>0 || maintain_ring) {
        ringxoffset+=1
        col2=$ffffff
    }
    if global.rings[view_current]!=0
        col2=$ffffff

    draw_skintext(ringxoffset,24,chr(16)+chr(42)+formatdark(global.rings[view_current],3),col2)

    // min is -44 max is 16
    // so in total it's 60
    // the vertical bar wants to offset by 24, so...
    // it's y position is offset by (((ringxoffset+44)/60)*24)

    }

    if global.gamemode!="timeattack" {
    //Red Rings
        //if !instance_exists(redring)
        for (i=0;i<5;i+=1) {
            draw_skintext(global.screenwidth-(400-336)+(i*8),24,chr(19+settings("rr" + string(i+1) + global.levelfname)),c_white)
        }
    }
}
d3d_transform_stack_pop()
/*
with p if star with other{
    d3d_set_fog(true, c_white, 0, 1)
    //emblem
    draw_sprite_part_ext(spr,0,78,10,18,18,14,199,1,1, c_white, (-(cos((tick / 6)))) * 0.6)
    //name tag
    draw_sprite_part_ext(spr, 0, 10,10,65,9,32,global.screenheight-24+(settings("cog inflives")*4),1,1, c_white, (-(cos((tick / 6)))) * 0.6)
    d3d_set_fog(false, c_black, 0, 0)
    if tick mod 8{
        i=instance_create(16+random_range(0,80),196+random_range(0,20),playerstars)
        i.setview=view_current
        i.myp2=p2
    }
}*/
