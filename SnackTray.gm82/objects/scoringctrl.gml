#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
view_yview[0]=0
view_yview[1]=0
view_yview[2]=0
view_yview[3]=0
alarm[2]=90
cango=0
xsc=-1
l=global.mplay

if (global.gamemode="classic") {
    global.scores[4,0]+=global.coins[0]
    str[0]="" str2[0]=""
    for (j=0;j<9;j+=1) if (j!=7 && j!=3) {won[j]=-1 str[0]+=lang("score "+string(j))+":#" str2[0]+=scorestr(j,0,6-!!j)+"#"}
} else {
    menumusic()

    //WHO WON?
    for (j=0;j<9;j+=1) {
        won[j]=-1
        pts[j]=0
        minscore[j]=global.scores[j,0]
        maxscore[j]=global.scores[j,0]
        for (i=1;i<l;i+=1) {
            minscore[j]=min(minscore[j],global.scores[j,i])
            maxscore[j]=max(maxscore[j],global.scores[j,i])
        }
    }
    for (j=0;j<9;j+=1) if (settings("contest"+string(j))) for (i=0;i<l;i+=1) {
        if (j=8) {
            if (global.scores[j,i]=minscore[j])
                if (won[j]!=-1) won[j]=-2
                else won[j]=i
        } else {
            if (global.scores[j,i]=maxscore[j])
                if (won[j]!=-1) won[j]=-2
                else won[j]=i
        }
    }

    //WHO'S NEXT?  
    for (j=0;j<9;j+=1) for (i=0;i<l;i+=1) if (won[j]=i) {
        pts[i]+=1
    }
    
    //YOU DECIDE!!!
    p=ds_priority_create()
    for (i=0;i<l;i+=1) ds_priority_add(p,i,pts[i])
    position=0 oldpoints=-1
    for (i=0;i<l;i+=1) {
        global.add[i]=pts[i]
        current=ds_priority_find_max(p)
        points=ds_priority_find_priority(p,current)
        if (points!=oldpoints) position+=1
        place[current]=position
        global.points[i]+=pts[i]
        ds_priority_delete_max(p)
        oldpoints=points
        str[i]="" str2[i]=""
        for (j=0;j<9;j+=1) if (settings("contest"+string(j))) {str[i]+=lang("score "+string(j))+":#" str2[i]+=scorestr(j,i,6-!!j)+"#"}
    }  
    ds_priority_destroy(p)
}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cango=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (advance()) if (cango && !lok && !instance_exists(segafadein)) {
    lok=1
    if (global.gamemode="classic") segafadeto(titlescreen)
    else if (global.nextlevel="") segafadeto(results)
    else segafadeto(finalscore)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.gamemode="classic") drawpodium(xstart+80,ystart-64,-1,0,2,"")
else drawpodium(xstart+80,ystart-8*pts[view_current],-1,view_current,floor(pts[view_current]),"")

k=0
for (i=0;i<9;i+=1) {
    if (global.gamemode="classic") {
        if (i!=7 && i!=3) {
            draw_sprite(spr_resulticons,i+1,xstart-88,120+8*k)
            k+=1
        }
    } else if (settings("contest"+string(i))) {
        draw_sprite(spr_resulticons,i+1,xstart-88,120+8*k)
        if (won[i]=view_current) draw_sprite(spr_resulticons,0,xstart+47,120+8*k)
        k+=1
    }
}

global.halign=2
draw_systext(xstart+48,96,wordwrap(playerskinstr(view_current,"name"+string(view_current)),24),playercol(global.input[view_current],view_current))
draw_systext(xstart+40,120,str2[view_current])
global.halign=1
if (global.gamemode="classic") draw_systext(xstart,56,lang("score final title"))
else draw_systext(xstart,56,lang("score title")+"##"+global.levelname)
global.halign=0
draw_systext(xstart-72,120,str[view_current])

draw_sprite(spr_border,0,0,0)
