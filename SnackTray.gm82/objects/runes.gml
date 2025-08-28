#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("runes")) {
    for (i=0;i<8;i+=1) {
        ss=string(i)
        a[i]=settings("runes a"+ss)
        b[i]=settings("runes b"+ss)
        c[i]=settings("runes c"+ss)
        d[i]=settings("runes d"+ss)
        e[i]=settings("runes e"+ss)
        f[i]=settings("runes f"+ss)
        g[i]=settings("runes g"+ss)
        h[i]=settings("runes h"+ss)
    }
} else {
    for (i=0;i<8;i+=1) {
        a[i]=random(1)+1
        b[i]=random(1)+1
        c[i]=random(360)
        d[i]=12/(random(20)+5)
        e[i]=7/(random(20)+5)
        if !(global.greenmode)
        f[i]=make_color_hsv(irandom(255),255,32)
        else f[i]=make_color_hsv(irandom_range(80,150),255,32)
        g[i]=(random(2)-1)*0.002
        h[i]=(random(2)-1)*0.002
    }
}



time=0
alpha=1
fade=0

surfname="runes"+string(id)
surfname2="runes2"+string(id)

tex=sprite_get_texture(tex_runes,random(9))
s=-1
s2=-1
waitbitch=1
alarm[0]=2

//if (room=game) instance_destroy()
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sureface_free(surfname)
sureface_free(surfname2)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
waitbitch=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fade) {
    alpha=max(0,alpha-0.01)
    if (alpha=0) {
        instance_destroy()
        visible=0
        exit
    }
}

time+=1
if (time mod 2) {
    s=sureface(surfname,global.screenwidth,global.screenheight)
    if (!sureface_set_target(surfname)) exit

    draw_primitive_begin_texture(pr_trianglelist,tex)

    for (i=0;i<8;i+=1) {
        x1=lengthdir_x(a[i]+g[i]*time,c[i])
        y1=lengthdir_y(b[i]+h[i]*time,c[i])

        x2=x1+lengthdir_x(d[i],c[i])
        y2=y1+lengthdir_y(e[i],c[i])

        x3=x2+lengthdir_x(d[i],c[i]-90)
        y3=y2+lengthdir_y(e[i],c[i]-90)

        x4=x1+lengthdir_x(d[i],c[i]-90)
        y4=y1+lengthdir_y(e[i],c[i]-90)

        draw_vertex_texture_color(0,0,x1,y1,f[i],1)
        draw_vertex_texture_color(global.screenwidth,0,x2,y2,f[i],1)
        draw_vertex_texture_color(0,global.screenheight,x4,y4,f[i],1)
        draw_vertex_texture_color(0,global.screenheight,x4,y4,f[i],1)
        draw_vertex_texture_color(global.screenwidth,0,x2,y2,f[i],1)
        draw_vertex_texture_color(global.screenwidth,global.screenheight,x3,y3,f[i],1)
    }

    draw_clear_alpha(0,1)
    texture_set_repeat(1)
    draw_set_blend_mode(bm_add)
    texture_set_interpolation(1)
    draw_primitive_end()
    texture_set_interpolation(0)
    draw_set_blend_mode(0)
    surface_reset_target()

    s2=sureface(surfname2,global.screenwidth,global.screenheight)
    if (!sureface_set_target(surfname2)) exit
    draw_surface_ext(s,0,0,1,1,0,$101010,1)
    surface_reset_target()
    if (!sureface_set_target(surfname)) exit
    draw_clear_alpha(0,1)
    draw_set_blend_mode(bm_add)
    repeat (16) draw_surface(s2,0,0)
    draw_set_blend_mode(0)
    surface_reset_target()
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!waitbitch) {if (instance_exists(runespawner)) {fade=1 depth-=1} else instance_destroy()}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sureface_free(surfname);
sureface_free(surfname2);
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sureface_exists(surfname)) draw_surface_ext(s,view_xview[0],view_yview[0],1,1,0,$ffffff,(other.v)*alpha)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fade) if (sureface_exists(surfname)) draw_surface_ext(s,view_xview[0],view_yview[0],1,1,0,$ffffff,(1-other.v)*alpha)
#define Other_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!fade && room=mainmenu) {
    if (settings("runes")) {
        doo=show_contextmenu("Reshuffle Runes",-1)
        if (doo=0) { //fixes bug where runes would still reset even if you didnt reshuffle
            if (show_question("Reshuffling will remove your favourite runes.#Are you sure you want to reshuffle them?")) { //warns you before actually reshuffling to be safe too lol
                settings("runes",0)
            } else {
                doo=-1
            }
        }
    } else {
        doo=show_contextmenu("Reshuffle Runes|Save Favorite Runes",-1)
        if (doo=1) {
            settings("runes",1)
            for (i=0;i<8;i+=1) {
                ss=string(i)
                settings("runes a"+ss,a[i])
                settings("runes b"+ss,b[i])
                settings("runes c"+ss,c[i])
                settings("runes d"+ss,d[i])
                settings("runes e"+ss,e[i])
                settings("runes f"+ss,f[i])
                settings("runes g"+ss,g[i])
                settings("runes h"+ss,h[i])
            }
        }
    }

    if (doo=0) {instance_create(0,0,runes) fade=1 depth-=1}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sureface_exists(surfname)) draw_surface_ext(s,view_xview[0],view_yview[0],1,1,0,$ffffff,alpha)
