#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
u=1
instance_create(x,y,uslopeground)
instance_create(x+16,y,uslopeground)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c8=position_meeting(x+8,y-16,groundblock)||guaranteedc8
if c8 superc8=(position_meeting(x+8,y-48,groundblock))
