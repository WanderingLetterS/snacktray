#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=30
alarm[2]=90
fgo=0
cango=0
menumusic()
l=global.mplay

//mariokart points and shit
p=ds_priority_create()
for (i=0;i<l;i+=1) ds_priority_add(p,i,global.points[i])
for (i=0;i<l;i+=1) {
    list[i,0]=ds_priority_find_max(p)
    list[i,1]=ds_priority_find_priority(p,list[i,0])
    ds_priority_delete_max(p)
}
ds_priority_clear(p)

maxpoints=1
minpoints=verybignumber
for (i=0;i<l;i+=1) {
    ds_priority_add(p,i,global.points[i])
    maxpoints=max(maxpoints,global.points[i])
    minpoints=min(minpoints,global.points[i])
}

rate=max(1,maxpoints)
stgc=global.stagecount

position=0 oldpoints=-1
for (i=0;i<l;i+=1) {
    current=ds_priority_find_max(p)
    points=ds_priority_find_priority(p,current)
    if (points!=oldpoints) position+=1
    place[current]=position
    ds_priority_delete_max(p)
    oldpoints=points
    global.pthist[stgc,i]=global.points[i]
    spritep[i]=1
    if (global.add[i]!=0) add[i]="+"+string(global.add[i]) else add[i]=""
    if (global.points[i]=maxpoints) spritep[i]=2
    if (global.points[i]=minpoints) spritep[i]=0
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fgo=1
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.mplay=2) {
    coord[0]=xstart-30
    coord[1]=xstart+30
}
if (global.mplay=3) {
    coord[0]=xstart-60
    coord[1]=xstart
    coord[2]=xstart+60
}
if (global.mplay=4) {
    coord[0]=xstart-90
    coord[1]=xstart-30
    coord[2]=xstart+30
    coord[3]=xstart+90
}

cango=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (advance()) if (cango && !lok && !instance_exists(segafadein)) {
    lok=1
    if (global.nextlevel="") segafadeto(results)
    else if (global.stages=1) segafadeto(stagesel)
    else {
        var path,fn,file,kek;
        path=global.lskins[global.levelskin+1,0]

        if (path=global.lbase) fn=path
        else fn=moddir+path
        if !file_exists(fn+global.nextlevel+".lemon") && !file_exists(fn+global.nextlevel+".lemon.png") {
            if global.debug show_message(lang("error level gone1"))
            segafadeto(results)
        } else {
            discord_update_presence("","Loading a level ("+global.nextlevel+")","boll-icon","dice-icon")
            segafadeto(change)
        }
    }
}

if (fgo) f=min(1,(f*19+1.2)/20)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.mplay=2) {
    drawpodium(xstart-30,ystart-32*lerp(global.pthist[stgc-1,0],global.pthist[stgc,0],f)/rate,1,0,place[0],add[0])
    drawpodium(xstart+30,ystart-32*lerp(global.pthist[stgc-1,1],global.pthist[stgc,1],f)/rate,-1,1,place[1],add[1])
}
if (global.mplay=3) {
    drawpodium(xstart-60,ystart-32*lerp(global.pthist[stgc-1,0],global.pthist[stgc,0],f)/rate,1,0,place[0],add[0])
    drawpodium(xstart   ,ystart-32*lerp(global.pthist[stgc-1,1],global.pthist[stgc,1],f)/rate,1,1,place[1],add[1])
    drawpodium(xstart+60,ystart-32*lerp(global.pthist[stgc-1,2],global.pthist[stgc,2],f)/rate,-1,2,place[2],add[2])
}
if (global.mplay=4) {
    drawpodium(xstart-90,ystart-32*lerp(global.pthist[stgc-1,0],global.pthist[stgc,0],f)/rate,1,0,place[0],add[0])
    drawpodium(xstart-30,ystart-32*lerp(global.pthist[stgc-1,1],global.pthist[stgc,1],f)/rate,1,1,place[1],add[1])
    drawpodium(xstart+30,ystart-32*lerp(global.pthist[stgc-1,2],global.pthist[stgc,2],f)/rate,-1,2,place[2],add[2])
    drawpodium(xstart+90,ystart-32*lerp(global.pthist[stgc-1,3],global.pthist[stgc,3],f)/rate,-1,3,place[3],add[3])
}

global.halign=1
draw_systext(xstart,48,lang("score title"))

for (i=0;i<l;i+=1) {
    global.halign=2
    draw_systext(xstart+8,72+8*i,playerskinstr(list[i,0],"name"+string(list[i,0])),playercol(global.input[list[i,0]],list[i,0]))
    global.halign=0
    draw_systext(xstart+16,72+8*i,string(list[i,1])+"pt")
}

draw_sprite(spr_border,0,0,0)
