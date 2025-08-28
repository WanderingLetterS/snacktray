#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
savemovie()
alarm[0]=30
alarm[1]=60
img=0
imggo=0
fgo=0

mus_play("extra",1)

l=global.mplay

maxpoints=1
minpoints=verybignumber
p=ds_priority_create()
for (i=0;i<l;i+=1) {
    global.pthist[global.stagecount,i]=global.points[i]
    ds_priority_add(p,i,global.points[i])
    maxpoints=max(maxpoints,global.points[i])
    minpoints=min(minpoints,global.points[i])
}

position=0 oldpoints=-1 tied=0 keke=0
for (i=0;i<l;i+=1) {
    current=ds_priority_find_max(p)
    points=ds_priority_find_priority(p,current)
    spritep[current]=0
    if (points=maxpoints) spritep[current]=2
    if (points!=oldpoints) position+=1

    place[current]=position
    if (position=1 && keke) tied=1
    if (!keke) top=current
    keke=1

    ds_priority_delete_max(p)
    oldpoints=points
}

ds_priority_destroy(p)

if (tied) for (i=0;i<l;i+=1) if (spritep[i]=2) spritep[i]=0

graph=(global.stagecount>=2)

if (graph) {
    m=d3d_model_create()
    m2=d3d_model_create()
    for (i=0;i<global.stagecount-1;i+=1) {
        maxpt=1 maxpt2=1
        for (j=0;j<l;j+=1) {
            maxpt=max(maxpt,global.pthist[i+1,j])
            maxpt2=max(maxpt2,global.pthist[i+2,j])
        }
        w=159/(global.stagecount-1)
        xx=i*w+0.5
        d3d_model_primitive_begin(m,pr_trianglelist)
        d3d_model_primitive_begin(m2,pr_trianglelist)
        for (j=0;j<l;j+=1) {
            c=playercol(global.input[j],j)
            yy=3+40*(1-global.pthist[i+1,j]/maxpt)
            yy2=3+40*(1-global.pthist[i+2,j]/maxpt2)

            d3d_model_vertex_color(m,xx,yy-1,0,c,1)
            d3d_model_vertex_color(m,xx,yy+1,0,c,1)
            d3d_model_vertex_color(m,xx+w,yy2-1,0,c,1)
            d3d_model_vertex_color(m,xx+w,yy2-1,0,c,1)
            d3d_model_vertex_color(m,xx,yy+1,0,c,1)
            d3d_model_vertex_color(m,xx+w,yy2+1,0,c,1)
            if (i>0) {
                d3d_model_vertex_color(m2,xx,0,0,$808080,1)
                d3d_model_vertex_color(m2,xx,47,0,$808080,1)
                d3d_model_vertex_color(m2,xx+1,0,0,$808080,1)
                d3d_model_vertex_color(m2,xx+1,0,0,$808080,1)
                d3d_model_vertex_color(m2,xx,47,0,$808080,1)
                d3d_model_vertex_color(m2,xx+1,47,0,$808080,1)
            }
        }
        d3d_model_primitive_end(m)
        d3d_model_primitive_end(m2)
    }
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fgo=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (imggo) imggo=-1
else imggo=1
alarm[1]=180
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (advance()) if (fgo) {
    if (global.playback) segafadeto(replays)
    else segafadeto(titlescreen)
}

if (fgo) f=min(1,(f*19+1.2)/20)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (graph) {
    d3d_model_destroy(m)
    d3d_model_destroy(m2)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.mplay=2) {
    drawpodium(xstart-30,ystart+(-24+6*place[0])*f,1,0,place[0],floor(global.points[0]*f))
    drawpodium(xstart+30,ystart+(-24+6*place[1])*f,-1,1,place[1],floor(global.points[1]*f))
}
if (global.mplay=3) {
    drawpodium(xstart-60,ystart+(-24+6*place[0])*f,1,0,place[0],floor(global.points[0]*f))
    drawpodium(xstart   ,ystart+(-24+6*place[1])*f,1,1,place[1],floor(global.points[1]*f))
    drawpodium(xstart+60,ystart+(-24+6*place[2])*f,-1,2,place[2],floor(global.points[2]*f))
}
if (global.mplay=4) {
    drawpodium(xstart-90,ystart+(-24+6*place[0])*f,1,0,place[0],floor(global.points[0]*f))
    drawpodium(xstart-30,ystart+(-24+6*place[1])*f,1,1,place[1],floor(global.points[1]*f))
    drawpodium(xstart+30,ystart+(-24+6*place[2])*f,-1,2,place[2],floor(global.points[2]*f))
    drawpodium(xstart+90,ystart+(-24+6*place[3])*f,-1,3,place[3],floor(global.points[3]*f))
}

global.halign=1
draw_systext(xstart,72-36*graph,lang("score final title"))
if (tied) draw_systext(xstart,100,lang("score ties"))
else draw_systext(xstart,100,playerskinstr(top,"name"+string(top))+"#"+lang("score wins"),playercol(global.input[top],top))
global.halign=0

if (graph) {
    draw_sprite_ext(spr_graph,0,xstart-80,48,1,1,0,playercol(global.input[0],0),1)
    d3d_model_draw(m2,xstart-80,48,0,-1)
    draw_set_blend_mode(bm_add)
    d3d_model_draw(m,xstart-80,48,0,-1)
    draw_set_blend_mode(0)
    if (f<1) {
        draw_set_color(0)
        draw_rectangle(xstart-80+159*f,49,xstart+80,95,0)
        draw_set_color($ffffff)
    }
    draw_sprite(spr_graph,1,xstart-80,48)
}

draw_sprite(spr_border,0,0,0)
