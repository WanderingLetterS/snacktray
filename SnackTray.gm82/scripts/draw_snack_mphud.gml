///drawdefaultmphud(p2,position)
var p, p2, spr,size,totpal;
    p=gamemanager.players[argument[0]]
    spr=p.sheets[drawize]
    p2=p.p2
    size=p.size
    totpal=p.totpal
    // apply ma shader
    scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,totpal+1)
    draw_sprite_part(spr,0,59,22,21,21,6+8+p_offset*(argument[1]),global.screenheight-36) //grin emoji




    //p.energy holder
    switch (p.maxe){
        case 1: draw_sprite_part(spr,0,8,22,4,10,27+8+p_offset*(argument[1]),global.screenheight-35) draw_sprite_part(spr,0,54,22,4,10,31+8+p_offset*(argument[1]),global.screenheight-35) break; //special cases for 1 and 2
        case 2: draw_sprite_part(spr,0,8,22,8,10,27+8+p_offset*(argument[1]),global.screenheight-35) draw_sprite_part(spr,0,50,22,8,10,35+8+p_offset*(argument[1]),global.screenheight-35) break;
        default:
        draw_sprite_part(spr,0,8,22,16,10,27+8+p_offset*(argument[1]),global.screenheight-35) //the starter segment is guaranteed
        tester=(p.maxe-2)
        offx=0
        while (tester>0){
            if tester==1{draw_sprite_part(spr,0,50,22,8,10,43+offx+8+p_offset*(argument[1]),global.screenheight-35)}
            else if tester==2{draw_sprite_part(spr,0,42,22,16,10,43+offx+8+p_offset*(argument[1]),global.screenheight-35)}
            else draw_sprite_part(spr,0,25,22,16,10,43+offx+8+p_offset*(argument[1]),global.screenheight-35)
            offx+=16
            tester-=2
        }
        break;
    }
    //The actual fucking p.energy itself

    switch (p.maxe){
        case 1: if p.energy draw_sprite_part(spr,0,8,33,min(4,4-min(4,(0.5-p.energy)*8)),10,27+8+p_offset*(argument[1]),global.screenheight-35) if p.energy>0.5 draw_sprite_part(spr,0,54,33,4-((0.5-(p.energy-0.5))*4),10,31+8+p_offset*(argument[1]),global.screenheight-35) break; //special cases for 1 and 2
        case 2: if p.energy draw_sprite_part(spr,0,8,33,min(8,8-min(8,(1-p.energy)*8)),10,27+8+p_offset*(argument[1]),global.screenheight-35) if p.energy>1 draw_sprite_part(spr,0,50,33,8-((1-(p.energy-1))*8),10,35+8+p_offset*(argument[1]),global.screenheight-35) break;
        default:
        if p.energy{
            draw_sprite_part(spr,0,8,33,16-min(16,(2-min(2,p.energy))*8),10,27+8+p_offset*(argument[1]),global.screenheight-35) //the starter segment is guaranteed
                tester=(p.maxe-2)
                offx=0
                enercheck=(p.energy-2) //remaining p.energy
            while (enercheck>0){
                if tester==1{draw_sprite_part(spr,0,50,33,8-min(8,(1-enercheck)*8),10,43+offx+8+p_offset*(argument[1]),global.screenheight-35)}
                else if tester==2{draw_sprite_part(spr,0,42,33,16-min(16,(tester-enercheck)*8),10,43+offx+8+p_offset*(argument[1]),global.screenheight-35)}
                else if (enercheck>=2) draw_sprite_part(spr,0,25,33,16,10,43+offx+8+p_offset*(argument[1]),global.screenheight-35)

                else draw_sprite_part(spr,0,25,33,16-min(16,(2-(enercheck mod 2))*8),10,43+offx+8+p_offset*(argument[1]),global.screenheight-35)
                offx+=16
                tester-=2
                enercheck-=2
            }
        }
        break;
    }

    shader_reset()
    shader_reset()
