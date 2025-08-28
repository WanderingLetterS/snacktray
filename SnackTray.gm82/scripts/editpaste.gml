var i,str,dr,i,j,c;

dr=drawregion.id

if (editcursor.shift) {
    str=clipboard_get_text()
    if (string_pos("lemon|",str)==1) {
        str=string_delete(str,1,6)
        p=string_pos("|",str) l=unreal(string_copy(str,1,p-1),0) str=string_delete(str,1,p)
        p=string_pos("|",str) dr.copyx=unreal(string_copy(str,1,p-1),0) str=string_delete(str,1,p)
        p=string_pos("|",str) dr.copyy=unreal(string_copy(str,1,p-1),0) str=string_delete(str,1,p)
        p=string_pos("|",str) dr.copyw=unreal(string_copy(str,1,p-1),0) str=string_delete(str,1,p)
        p=string_pos("|",str) dr.copyh=unreal(string_copy(str,1,p-1),0) str=string_delete(str,1,p)
        dr.cbuffer[0,0]=l
        for (i=1;i<=l;i+=1) for (j=0;j<15;j+=1) {
            p=string_pos("|",str)
            c=string_copy(str,1,p-1)
            if (j<5 || j=13 || j=14) c=unreal(c,0)
            dr.cbuffer[i,j]=c
            str=string_delete(str,1,p)
        }
    }
}

with (drawregion) {
    if (cbuffer[0]=0) exit
    with (deity) {event_user(0) selected=0 depth=1}

    for (i=1;i<=cbuffer[0];i+=1) if (lemonhappy()) {
        o=instance_create(cbuffer[i, 0]+curx-copyx,cbuffer[i, 1]+cury-copyy,deity)
        o.obj =cbuffer[i, 2]
        o.spr =cbuffer[i, 3]
        o.off =cbuffer[i, 4]
        o.data[0]=cbuffer[i, 5]
        o.data[1]=cbuffer[i, 6]
        o.data[2]=cbuffer[i, 7]
        o.data[3]=cbuffer[i, 8]
        o.data[4]=cbuffer[i, 9]
        o.data[5]=cbuffer[i,10]
        o.data[6]=cbuffer[i,11]
        o.data[7]=cbuffer[i,12]
        o.off2x=cbuffer[i,13]
        o.off2y=cbuffer[i,14]
        o.selected=1
        o.depth=0
    }

    update=1
    UPDATE_THE_DEITIES=1
    event_user(7)
}

editcursor.tool=1
