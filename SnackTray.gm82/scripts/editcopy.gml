var dr,i,sx,sy,w,h,l,z;

dr=drawregion.id;

if (dr.selected_array[0] == 0) exit;
w=0 h=0

dr.cbuffer[0]=0
sx=verybignumber
sy=verybignumber

with(dr) {
    myarray_i=1
    savema=selected_array[0]
    repeat (savema) {
        with (selected_array[myarray_i]) {
            sx=min(sx,x)
            sy=min(sy,y)
            w=max(w,x)
            h=max(h,y)
            i=dr.cbuffer[0]+1
            dr.cbuffer[0]=i
            dr.cbuffer[i,0]=x
            dr.cbuffer[i,1]=y
            dr.cbuffer[i,2]=obj
            dr.cbuffer[i,3]=spr
            dr.cbuffer[i,4]=off
            z=0
            repeat (12) {dr.cbuffer[i,5+z]=data[z] z+=1}
            dr.cbuffer[i,17]=off2x
            dr.cbuffer[i,18]=off2y
            selected=0 event_user(0)
            if (argument[0]) instance_destroy() // cut
        }
        myarray_i+=1
        selected_array[0]-=1
    }

    selected_array[0]=0
    UPDATE_THE_DEITIES=1 event_user(7)
}


dr.copyx=sx
dr.copyy=sy
dr.copyw=w-sx+1
dr.copyh=h-sy+1

if (argument[0]) with (dr) event_user(7)

if (editcursor.shift) {
    l=dr.cbuffer[0]
    str="lemon|"+string(l)+"|"+string(sx)+"|"+string(sy)+"|"+string(w)+"|"+string(h)+"|"
    for (i=1;i<=l;i+=1) {
        for (j=0;j<19;j+=1) str+=string(dr.cbuffer[i,j])+"|"
    }
    clipboard_set_text(str)
    hotbar.str="Copied to clipboard"
    hotbar.alpha2=4
}
