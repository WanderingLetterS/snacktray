#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
short=false
dir=0
obj=platfall
type=string(type)
switch (type) {
    case "plat3": obj=plat3 break
    case "platsineh": obj=platsineh break
    case "platwrap_up": obj=platwrap dir=-1 break
    case "platwrap_down": obj=platwrap dir=1 break
    case "platfall": obj=platfall break
    case "pulley": obj=pulley break
    case "pulley_sub": obj=pulley_sub break
    case "cloudform": obj=cloudform break
    case "donut": obj=platdonut break
    default: obj=platsinev
}
i=instance_create(x,y,obj)

if (dir) i.vsp=dir

if (type!="plat3") {
    i.type="platform"
    if length = "1" {
        i.length="1"
        i.mask_index=spr_maskplatsmall
    }
    if (type="donut") i.mask_index=spr_16
}

i.top=y-unreal(pulleyheight)*16

instance_destroy()
