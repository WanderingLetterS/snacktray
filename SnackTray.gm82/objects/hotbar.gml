#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cur=1
obj=0
obj[1]=editobjfind(groundblock)
lemonhotbarfamily() curfam[cur]=1
obj[2]=editobjfind(itembox)
cur+=1 lemonhotbarfamily() curfam[cur]=1
obj[3]=editobjfind(brick)
cur+=1 lemonhotbarfamily()curfam[cur]=1
obj[4]=editobjfind(coin)
cur+=1 lemonhotbarfamily()curfam[cur]=1
obj[5]=editobjfind(goomba)
cur+=1 lemonhotbarfamily()curfam[cur]=1
obj[6]=editobjfind(koopa)
cur+=1 lemonhotbarfamily()curfam[cur]=1
obj[7]=editobjfind(spring)
cur+=1 lemonhotbarfamily()curfam[cur]=1
obj[8]=editobjfind(pipeblock)
cur+=1 lemonhotbarfamily()curfam[cur]=1
obj[9]=editobjfind(treeblock)
cur+=1 lemonhotbarfamily()curfam[cur]=1
cur=1

alpha=1
alpha2=0
alpha3=0
str=""
str2=""

//fun mode waving stuff
amp=4
freq=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_wview[0]/2-16
y=view_hview[0]-200
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!drawregion.flooding) {
    curp=cur
    famcurp=curfam[cur]
    if (!editcursor.ctrl) {
        if keyboard_check(vk_shift){
            savecur=cur cur=modulo(cur+rightbut-leftbut,1,10)
            if savecur!=cur {
                if !(settings("nolemonsound")) sound("systemselect")
            } else{
                savecur=curfam[cur]
                curfam[cur]=modulo(curfam[cur]+editcursor.scrw+downbut-upbut,1,famsize[cur])

                if savecur!=curfam[cur] {
                    obj[cur]=famobj[cur,curfam[cur]]
                    if !(settings("nolemonsound")) sound("systemselect")
                }
            }

        }else
        {
            savecur=cur cur=modulo(cur+editcursor.scrw+rightbut-leftbut,1,10)
            if savecur!=cur {
                if !(settings("nolemonsound")) sound("systemselect")
            } else{
                savecur=curfam[cur]
                curfam[cur]=modulo(curfam[cur]+downbut-upbut,1,famsize[cur])

                if savecur!=curfam[cur] {
                    obj[cur]=famobj[cur,curfam[cur]]
                    if !(settings("nolemonsound")) sound("systemselect")
                }
            }
        }
    }
    for (i=0;i<10;i+=1) {
        if (keyboard_check_pressed(ord("0")+i)) {
            if (pickeddata || i) {
                cur=i+(!i*10)
            }
            if !(settings("nolemonsound")) sound("systemselect")
        }
    }
    if (cur!=curp || famcurp!=curfam[cur]) {
        str=lemonobjname(lemongrab.objlist[obj[cur],0])
        alpha2=3

        str2=wordwrap(lemonobjdesc(lemongrab.objlist[obj[cur],0]),32)
        alpha3=10
    }
}
//while lemonobjname(lemongrab.objlist[obj[cur],0])="0" cur=modulo(cur+editcursor.scrw,1,10) //do NOT go into an infinite loop and crash the game if selecting 0

if (within(mouse_x,mouse_y,x-180,y-20,360,60)) alpha=max(0.25,alpha-0.05)
else alpha=min(1,alpha+0.05)

alpha2=max(0,alpha2-0.05)
alpha3=max(0,alpha3-0.05)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=1
for (i=0;i<9;i+=1) {
    xx=x-159+40*i
    so = t + (i*6);

    if (cur == i+1) {

        yraise[i]=approach_val(yraise[i],-8,1)

        why=0

    } else {
        yraise[i]=approach_val(yraise[i],0,1)
        why = sin(so*pi*freq/room_speed)*amp;
    }

    if !settings("funmode")
    yy=(y+why)+yraise[i]
    else
    yy=y+yraise[i]

    if (editcursor.tool=2 && cur=i+1) draw_sprite_ext(spr_editorbutton,1+!editcanflood(lemongrab.objlist[obj[cur],0]),xx,yy,1,1,0,$ffffff,alpha)
    else draw_sprite_ext(spr_editorbuttonshadow,0,xx,yy,1,1,0,c_black,0.5) draw_sprite_ext(spr_editorbutton,(cur=i+1),xx,yy,1,1,0,$ffffff,alpha)

    if (cur=i+1) draw_sprite_ext(spr_editsel,0,xx,yy,1,1,0,$ffffff,alpha)

    if (obj[i+1]) draw_sprite_ext(spr_editpal,lemongrab.objlist[obj[i+1],25],xx,yy,1,1,0,c_black,0.5) draw_sprite_ext(spr_editpal,lemongrab.objlist[obj[i+1],25],xx-1,yy-1,1,1,0,$ffffff,alpha)
    if cur=i+1 if famsize[i+1]>1{

        { //Draw previous.
            draw_sprite_ext(spr_editorbutton,0,xx+3,yy-32,0.75,0.75,0,$ffffff,alpha*0.5)


                                                                                      //v it's an extra -1 because it needs to get normalized for the mod
            draw_sprite_ext(spr_editpal,lemongrab.objlist[famobj[i+1,modulo(curfam[i+1]-1,1,famsize[i+1])],25],xx+3,yy+1-32,0.75,0.75,0,c_black,0.25) 
            draw_sprite_ext(spr_editpal,lemongrab.objlist[famobj[i+1,modulo(curfam[i+1]-1,1,famsize[i+1])],25],xx-1+3,yy-32,0.75,0.75,0,$ffffff,alpha*0.5)
        }
        
        { //Draw next
            draw_sprite_ext(spr_editorbutton,0,xx+3,yy+32+6,0.75,0.75,0,$ffffff,alpha*0.5)
            
            draw_sprite_ext(spr_editpal,lemongrab.objlist[famobj[i+1,modulo(curfam[i+1]+1,1,famsize[i+1])],25],xx+3,yy+1+32+4,0.75,0.75,0,c_black,0.25) 
            draw_sprite_ext(spr_editpal,lemongrab.objlist[famobj[i+1,modulo(curfam[i+1]+1,1,famsize[i+1])],25],xx-1+3,yy+32+4,0.75,0.75,0,$ffffff,alpha*0.5)
        }
    }
    

    if (picked[i+1,curfam[i+1]]) draw_sprite_ext(spr_editsel,1,xx,yy,1,1,0,$ffffff,alpha)
}

global.tscale=2
global.halign=1
global.valign=2
draw_systext(x+16,y-18-32,wordwrap(str,45),$ffffff,alpha2)
global.valign=0
draw_systext(x+16,97,wordwrap(str2,45),$ffffff,alpha3)
global.tscale=1
global.halign=0
