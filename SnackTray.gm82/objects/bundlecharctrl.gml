#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;

for (i=0;i<4;i+=1) with (instance_create(0,-verybignumber,rosterbox)) p2=i

for (i=1;i<=min(global.bskins[0,0],12);i+=1) {
    o=instance_create(x+52*(((i-1) mod 6 +0.5-min(6,global.bskins[0,0]-((i-1) div 6)*6)/2)),y+52*((i-1) div 6 +0.5-((global.bskins[0,0]+5) div 6)/2),rostercard)
    o.skin=global.bskins[i,0]
    o.icon=global.bskins[i,1]
    o.sub=0
    o.p2=global.bskins[i,2]
    o.bundle=1
}
