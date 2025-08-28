///drawdefaultmphud(hudpos_id)
var p, spr;
    p=gamemanager.players[p2+4]
    spr=p.sheets[drawize]

    scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[(p2+4)*100],global.pal_1[p2+4]+1,global.pal_2[p2+4]+1,global.pal_3[p2+4]+1,global.pal_4[p2+4]+1,6)
    draw_sprite_part(spr,0,74,27,18,18,8+p_offset*p2,184) //grin emoji's backdrop
    draw_sprite_part(spr,0,74,8,18,18,8+p_offset*p2,184) //grin emoji

    switch (p.maxe){
        case 1: draw_sprite_part(spr,0,8,22,4,10,27+p_offset*p2,182) draw_sprite_part(spr,0,54,22,4,10,31+p_offset*p2,182) break; //special cases for 1 and 2
        case 2: draw_sprite_part(spr,0,8,22,8,10,27+p_offset*p2,182) draw_sprite_part(spr,0,50,22,8,10,35+p_offset*p2,182) break;
        default:
        draw_sprite_part(spr,0,8,22,16,10,27+p_offset*p2,182) //the starter segment is guaranteed
        tester=(p.maxe-2)
        offx=0
        while (tester>0){
            if tester==1{draw_sprite_part(spr,0,50,22,8,10,43+offx+p_offset*p2,182)}
            else if tester==2{draw_sprite_part(spr,0,42,22,16,10,43+offx+p_offset*p2,182)}
            else draw_sprite_part(spr,0,25,22,16,10,43+offx+p_offset*p2,182)
            offx+=16
            tester-=2
        }
        break;
    }
    //The actual fucking energy itself

    switch (p.maxe){
        case 1: if p.energy draw_sprite_part(spr,0,8,33,min(4,4-min(4,(0.5-p.energy)*8)),10,27+p_offset*p2,182) if energy>0.5 draw_sprite_part(spr,0,54,33,4-((0.5-(p.energy-0.5))*4),10,31+p_offset*p2,182) break; //special cases for 1 and 2
        case 2: if p.energy draw_sprite_part(spr,0,8,33,min(8,8-min(8,(1-p.energy)*8)),10,27+p_offset*p2,182) if energy>1 draw_sprite_part(spr,0,50,33,8-((1-(p.energy-1))*8),10,35+p_offset*p2,182) break;
        default:
        if energy{
            draw_sprite_part(spr,0,8,33,16-min(16,(2-min(2,p.energy))*8),10,27+p_offset*p2,182) //the starter segment is guaranteed
                tester=(p.maxe-2)
                offx=0
                enercheck=(p.energy-2) //remaining energy
            while (enercheck>0){
                if tester==1{draw_sprite_part(spr,0,50,33,8-min(8,(1-enercheck)*8),10,43+offx+p_offset*p2,182)}
                else if tester==2{draw_sprite_part(spr,0,42,33,16-min(16,(tester-enercheck)*8),10,43+offx+p_offset*p2,182)}
                else if (enercheck>=2) draw_sprite_part(spr,0,25,33,16,10,43+offx+p_offset*p2,182)

                else draw_sprite_part(spr,0,25,33,16-min(16,(2-(enercheck mod 2))*8),10,43+offx+p_offset*p2,182)
                offx+=16
                tester-=2
                enercheck-=2
            }
        }
        break;
    }
    shader_reset()
