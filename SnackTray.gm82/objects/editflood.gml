#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
drawregion.alarm[0]=2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lemonhappy()) {
    if (x>0) if (!position_meeting(x-1,y,objcontainer))&& (!position_meeting(x-1,y,semicontainer)) && (!position_meeting(x-1,y,backcontainer)) instance_create(x-1,y,editflood)
    if (x<lemongrab.w[drawregion.region]-1)  if (!position_meeting(x+1,y,objcontainer))&& (!position_meeting(x+1,y,semicontainer)) && (!position_meeting(x+1,y,backcontainer))  instance_create(x+1,y,editflood)
    if (y>0) if (!position_meeting(x,y-1,objcontainer))&& (!position_meeting(x,y-1,semicontainer)) && (!position_meeting(x,y-1,backcontainer)) instance_create(x,y-1,editflood)
    if (y<lemongrab.h[drawregion.region]-1) if (!position_meeting(x,y+1,objcontainer))&& (!position_meeting(x,y+1,semicontainer)) && (!position_meeting(x,y+1,backcontainer)) instance_create(x,y+1,editflood)





    j=hotbar.obj[hotbar.cur]
    if (lemongrab.objlist[hotbar.obj[hotbar.cur],0]=groundsemi||
    lemongrab.objlist[hotbar.obj[hotbar.cur],0]=slopel1s||
    lemongrab.objlist[hotbar.obj[hotbar.cur],0]=slopel2s||
    lemongrab.objlist[hotbar.obj[hotbar.cur],0]=sloper1s||
    lemongrab.objlist[hotbar.obj[hotbar.cur],0]=sloper2s){

        i=instance_create(x,y,lemongrab.semis[region])
        i.region=region
        i.obj=lemongrab.objlist[hotbar.obj[hotbar.cur],0]
         instance_destroy()

    } else if (lemongrab.objlist[hotbar.obj[hotbar.cur],0]=groundback/*||
    lemongrab.objlist[hotbar.obj[hotbar.cur],0]=slopel1s||
    lemongrab.objlist[hotbar.obj[hotbar.cur],0]=slopel2s||
    lemongrab.objlist[hotbar.obj[hotbar.cur],0]=sloper1s||
    lemongrab.objlist[hotbar.obj[hotbar.cur],0]=sloper2s*/){
    //back-ground painting

        i=instance_create(x,y,lemongrab.backs[region])
        i.region=region
        i.obj=lemongrab.objlist[hotbar.obj[hotbar.cur],0]
         instance_destroy()

    } else {
        i=instance_create(x,y,drawregion.deity)
        i.obj=lemongrab.objlist[j,0]
        i.spr=lemongrab.objlist[j,1]
        i.off=lemongrab.objlist[j,2]
        if (hotbar.picked[hotbar.cur]) for (k=0;k<8;k+=1) i.data[k]=hotbar.data[hotbar.cur,k]
        else for (k=0;k<8;k+=1) i.data[k]=lemongrab.objlist[j,k+101]
        if (lemongrab.objlist[j,5]="align") unpack_align(i)
        instance_destroy()
    }
    instance_destroy()
}
