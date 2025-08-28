///ssw_effects(name)
//This handles sprite switching for the visual effects

var xx,yy;

switch (argument[0]) {
    case "poof": {draw_sprite_part_ext(sheet,0,218+frame*25,10,24,24,round(x-12*image_xscale),round(y-12*image_yscale),image_xscale,image_yscale,c_white,1) break}
    case "macguffin": {if global.greenmode draw_sprite_part(sheet,0,97+17,27,16,16,round(x-8),round(y-8)) else draw_sprite_part(sheet,0,97+17*color,27,16,16,round(x-8),round(y-8)) break}
    case "firebroball":
    case "fireball": {draw_sprite_part_ext(global.enemysheet,0,10+global.framefire*17,67,16,16,round(x-7*xsc),round(y-7),xsc,1,$ffffff,1) break}
    case "firexplosion": {
        if (object_index=gianaexplosion) draw_sprite_part(sheet,0,21+floor(frame)*17,52,16,16,round(x-7),round(y-7))
        else draw_sprite_part(global.enemysheet,0,10+floor(frame)*17,84,16,16,round(x-7),round(y-7))
    break}
    case "gianafireball": {draw_sprite_part_ext(sheet,0,21+frame*17,33,16,16,round(x-7*xsc),round(y-7),xsc,1,$ffffff,1) break}
    case "gianafire": {draw_sprite_part_ext(sheet,0,80+33*frame,90,32,32,round(x-16*xsc),round(y-16),xsc,1,$ffffff,1) break}

    case "roboshard": {draw_sprite_part(sheet,0,100+sign(hspeed)*13,193+13*sign(vspeed),12,12,round(x-5),round(y-5)) break}
    case "robochain": {xx=median(8,8+abs(x-owner.x),64) draw_sprite_part_ext(sheet,0,190-xx,205+16*(owner.size=2),xx,15,round(owner.x),round(owner.y-8),xsc,1,$ffffff,1) break}
    case "dethplotion": {draw_sprite_part(sheet,0,10+frame*25,97,24,24,round(x-12),round(y-12)) break}

    case "superparticle": {if (global.bgscroll mod 5<3) draw_sprite_part(skindat("tex_superparticles"+string(owner.p2)),0,floor((global.bgscroll*0.125) mod 4)*50+9,9,49,49,round(x-25),round(y-25)) break}
    case "superparticlefront": {if (global.bgscroll mod 5<3) draw_sprite_part(skindat("tex_superparticles"+string(owner.p2)),0,floor((global.bgscroll*0.125) mod 4)*50+9,59,49,49,round(x-25),round(y-25)) break}
    //pollen moved to ssw_objects

    case "knuxshatter": {
        if (vspeed=0) draw_sprite_part_ext(sheet,0,9,318+17*frame,32,16,round(x-24*xsc),round(y-8),xsc,1,$ffffff,1)
        else draw_sprite_part(sheet,0,42+17*frame,336,16,32,round(x-8),round(y-8))
    break}
    case "bullet": {
        draw_sprite_part_ext(sheet,0,21+9*frame,33,8,8,round(x-4*xsc),round(y-4),xsc,1,$ffffff,1)
    break}

    case "cookie": {
        xx=x-8 yy=y-8
        repeat (length) {
            draw_background_part(global.masterobjects[biome],432,304,16,16,round(xx),round(yy))
            xx+=lengthdir_x(-8,angle) yy+=lengthdir_y(-8,angle)
        }
        draw_background_part_ext(global.masterobjects[biome],368+16*global.framefire,304,16,16,round(prevx2-8),round(prevy2-8),1,1,$ffffff,0.25)
        draw_background_part_ext(global.masterobjects[biome],368+16*global.framefire,304,16,16,round(prevx-8),round(prevy-8),1,1,$ffffff,0.5)
        draw_background_part(global.masterobjects[biome],368+16*global.framefire,304,16,16,round(x-8),round(y-8))

    break}
    case "firebar": {
        xx=x-8 yy=y-8
        repeat (length) {
            draw_background_part(global.masterobjects[biome],368+16*global.framefire,288,16,16,round(xx),round(yy))
            xx+=lengthdir_x(8,angle) yy+=lengthdir_y(8,angle)
        }
    break}
    case "spikyball": {
            draw_background_part(global.masterobjects[biome],368+(16*frame),320,16,16,round(x-8),round(y-8))
    break}

    case "otherfireball": {
            draw_background_part(global.masterobjects[biome],368+(16*frame),288,16,16,round(x-8),round(y-8))
    break}
    case "firemissilesmall": {
        if !(ver) {
            if (xsc)
            draw_background_part_ext(global.masterobjects[biome],304+(16*frame),320,16,16,round(x),round(y)-4,xsc,ysc,$ffffff,1)
            else
            draw_background_part_ext(global.masterobjects[biome],304+(16*frame),320,16,16,round(x)+16,round(y)-4,xsc,ysc,$ffffff,1)
        }
        else {
            if (ysc)
            draw_background_part_ext(global.masterobjects[biome],240+(16*frame),320,16,16,round(x)-4,round(y)-16,xsc,ysc,$ffffff,1)
            else
            draw_background_part_ext(global.masterobjects[biome],240+(16*frame),320,16,16,round(x)-4,round(y),xsc,ysc,$ffffff,1)
        }
    break}
    case "firemissileexplosion": {
        draw_background_part_ext(global.masterobjects[biome],272+floor(frame)*16,304,16,16,round(x-8),round(y-8),xsc,ysc,$ffffff,1)
    break}
    case "hammer": {draw_sprite_part_ext(global.enemysheet[biome],0,10+17*global.frame88,10,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "boomerang": {draw_sprite_part_ext(global.enemysheet2[biome],0,10+17*global.framefire,10,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "anotherfirebaliguess": {draw_sprite_part_ext(global.enemysheet2[biome],0,10+17*global.framefire,29,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "crabfireball": {draw_sprite_part_ext(global.enemysheet2[biome],0,10+17*(global.frame88 mod 4),48,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "newtronfireball": {draw_sprite_part_ext(global.enemysheet2[biome],0,10+17*(global.frame88 mod 4),67,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "bombfireball": {draw_sprite_part_ext(global.enemysheet2[biome],0,10+17*(global.frame88 mod 4),86,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "hammerbowser": {if dowser draw_sprite_part_ext(global.dowsersheet[biome],0,10+17*global.frame88,10,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) else  draw_sprite_part_ext(global.bosssheet[biome],0,10+17*global.frame88,10,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "firemissile": {if dowser draw_sprite_part_ext(global.dowsersheet[biome],0,10+32*frame,29,31,16,round(x-16*xsc),round(y-8),xsc,1,$ffffff,1) else draw_sprite_part_ext(global.bosssheet[biome],0,10+32*frame,29,31,16,round(x-16*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "spikeball": {draw_sprite_part_ext(global.enemysheet2[biome],0,80+25*global.framefire,10,24,24,round(x-13*xsc),round(y-13),xsc,1,$ffffff,1) break}
    case "spikeballpart": {draw_sprite_part_ext(global.enemysheet2[biome],0,80+11*global.framefire,35,10,10,round(x-6*xsc),round(y-6),xsc,1,$ffffff,1) break}
    case "banzaibill": {draw_sprite_part_ext(global.enemysheet2[biome],0,429,8,64,64,round(x),round(y),xsc,1,$ffffff,1) break}
    case "bullseyebanzai": {draw_sprite_part_ext(global.enemysheet2[biome],0,494,8,64,64,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1) break}
    case "muncher": {draw_sprite_part_ext(global.enemysheet2[biome],0,429+16*global.frame,73,16,16,round(x),round(y),xsc,1,$ffffff,1) break}
    //why yo muncher so fucking big ???
    case "bigassmuncher": {draw_sprite_part_ext(global.enemysheet2[biome],0,429+32*global.frame,90,32,32,round(x),round(y),xsc,1,$ffffff,1) break}


    case "retainer": {draw_sprite_part(sheet,0,8+floor(frame mod 4)*66,8+65*floor(frame div 4),64,64,x-32,y-44) break}
    case "toad": {draw_sprite_part_ext(sheet,0,8+floor(frame)*33,138,32,32,floor(x-16*xsc),floor(y-20),xsc,1,$ffffff,1) break}
}
