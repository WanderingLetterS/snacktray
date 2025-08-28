#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ys=0
f=0.5
sol=1
myslop=instance_create(x,y,nslopl2)
myslop.guaranteedc2=1
i=instance_create(x,y+16,groundblock)
i.dontrender=1
i=instance_create(x+16,y+16,groundblock)
i.dontrender=1
