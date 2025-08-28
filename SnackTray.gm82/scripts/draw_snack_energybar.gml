///drawenergybar(x,y,player)

var p, i;
p=argument2

if (p.maxe>=1) for (i=1;i<=p.maxe;i+=1) {
    draw_sprite_part(spr_energy,median(0,(energy-(i-1))*2,2),0+(i mod 2 == 0)*7,0,7,8,argument0-7+7*i,argument1)
}
