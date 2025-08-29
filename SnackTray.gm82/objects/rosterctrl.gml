#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cursort=0
cog=0
f=1

global.quietyou=0
global.joynum=0

joy_detect()

instance_create(0,0,rostercursor)
with (instance_create(0,0,rostercursor)) p2=1

var n; n=instance_number(rostercursor)
with (rostercursor) {
    image_blend=playercol(p2)
    x=200+(p2-n/2)*16
    y=328
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cursort=(cursort+1) mod JOY+8
with (rostercursor) if (p2=other.cursort) depth=!depth
with (rosterbox) {sort=(p2=other.cursort)}

steamdetect()

if (cog) f=max(0,f-0.02)
else f=min(1,f+0.02)

if (room=roster) view_yview[0]=cosine(0,280,f)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///create the cards
p=ds_priority_create()
for (i=0;i<global.characters;i+=1)
    if (!global.charmod[i])
        ds_priority_add(p,i,global.rosterorder[i])

l=ds_priority_size(p)
for (i=0;i<l;i+=1) {
    c=ds_priority_delete_min(p)
    u=36*(i mod 8)
    v=36*(i div 8)
    var num1, num2;
    num1=146/2 num2=276+56 if room=ta_roster {num1=202/2+16 num2=56+56}
    o=instance_create(num1+u,num2+v,rostercard)
    o.name=global.charname[c]
    o.icon=global.charicon[c,0]
    o.lock=global.charlock[c]
    o.swap=global.rosterswap[c]
    o.page=0
    if o.swap!="" {i-=1 l-=1 o.page=-1}
    o.myswapto=o
}

disabledchars=0
for (i=0;i<global.characters;i+=1){
    if (global.charmod[i] && !settings(global.charname[i]+" disabled") && !settings(global.charname[i]+" broken"))
        ds_priority_add(p,i,global.rosterorder[i])
    else if (settings(global.charname[i]+" disabled") || settings(global.charname[i]+" broken")) disabledchars+=1
}

l=ds_priority_size(p)

maxpage=ceil((global.characters-(disabledchars+1))/16) //+1 is because global.charactesr is one higher than the last used slot
if maxpage<=1 maxpage=2 //You know, so people can actually acess mods?

for (i=0;i<l;i+=1) {
    c=ds_priority_delete_min(p)
    u=36*(i mod 8)
    v=36*((i div 8) mod 8)//I feel like this might be off somehow
    var num1, num2;
    num1=146/2 num2=276+56 if room=ta_roster {num1=202/2+16 num2=56+56}
    o=instance_create(num1+u,num2+v,rostercard)
    o.name=global.charname[c]
    o.icon=global.charicon[c,0]
    o.lock=global.charlock[c]
    o.page=(i div 32) +1
    o.is_mod=1
    o.swap=global.rosterswap[c]
    if o.swap!="" {i-=1 l-=1 o.page=-1}
    o.myswapto=o
}

ds_priority_destroy(p)

if (room=roster || room=ta_roster) with (rostercard) {

    p2=-1
    for (i=0;i<global.characters;i+=1) if (name=global.charname[i] ) p2=i

    if string(swap)!=""
    with rostercard if (name=string(other.swap)) { myswapto=other.id  myswapto.xstart=xstart myswapto.y=y other.myswapto=id  }

}

if (global.lastroom=stagesel || global.lastroom=ta_menu) {
    with (rosterbox) if (p2<global.mplay) {
        ready=1
        with (rostercursor) if (p2=global.input[other.p2]) mybox=other.id
        with (rostercard) if (p2=global.option[other.p2]) other.card=id
    }
}

if room=ta_roster && (global.discordoverride<2) {discord_update_presence("","In Menu","boll-icon","timeattack-icon")}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
saveopt()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///start game
with (rosterbox) {
    if (showbox) exit;
}



global.mplay=0
with (rosterbox) if (ready) {
    global.mplay+=1
    if (global.option[p2]!=-1) if (!skindat("bundleplayer"))
        applyplayerskin(global.pskins[1+global.playerskin[p2],global.option[p2]],p2,"more",global.option[p2])
}
if (global.mplay>0) {
    //Gamemode setting moved to rostergm due to that being its Job

    if (global.bundled) {
        game_start()
        segafadeto(change,"systemstart")
    } else if global.gamemode!="timeattack"{
        segafadeto(stagesel,"systemstart")
    } else {
        segafadeto(ta_menu,"systemstart")
    }
    with (rostercursor) instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room=ta_roster) {depth=10 draw_sprite(spr_border,0,0,0)}
else {
    texture_set_interpolation(1)
    draw_sprite(spr_matchoptionsbg,0,-32+floor(k),0)
    draw_sprite(spr_matchoptionsbg,2,0,0)
    draw_sprite(spr_matchoptionsbg,1,0,0)
    texture_set_interpolation(0)
    depth=10 draw_sprite(spr_border,0,view_xview,view_yview)
    k=(k + 0.2875) mod 32
}

var pfx;
//if (page=0) prx=lang("roster cast")
//else prx=lang("roster charmcast")
global.halign=1
num1=200
num2=248
if room=ta_roster {num1=248 num2=28}
//draw_systext(num1,num2,string(prx)+string(page+1)+"/"+string(maxpage))
global.halign=0
