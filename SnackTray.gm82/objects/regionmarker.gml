#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type="day"
typebg="water"
typemus="water"
biome=0
ky=240
water=240
bpm=110
bpb=8
lightlevel=0
horizon=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(lefthand-16,0,finalwall)
instance_create(lefthand-40,0,buffer)
instance_create(x,0,finalwall)
instance_create(x+40,0,buffer)
if (water=ky) water=verybignumber

biome=getbiomeid(type)
