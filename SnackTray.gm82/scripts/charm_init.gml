///charm_init()
//updates the skin variables (and charm)
var ss;

ss=string(p2)

name=global.charname[global.option[p2]]
if (object_index=player) {
    object_event_clear(player,ev_other,ev_user0+p2)
    object_event_add(player,ev_other,ev_user0+p2,global.charcode[global.option[p2]])
    object_event_clear(damager,ev_other,ev_user0+p2)
    object_event_add(damager,ev_other,ev_user0+p2,global.damagercode[global.option[p2]])
    object_event_clear(projectile,ev_other,ev_user0+p2)
    object_event_add(projectile,ev_other,ev_user0+p2,global.projectilecode[global.option[p2]])
    object_event_clear(charmdeath,ev_other,ev_user0+p2)
    object_event_add(charmdeath,ev_other,ev_user0+p2,global.deathcode[global.option[p2]])
    mydamager=instance_create(x,y,damager) {
        mydamager.p2=p2
        mydamager.owner=id
    }
    mask_index=global.playermask[p2]
    mask_set(12,12)
}
if object_index=changectrl && global.gamemode!="battle" && global.gamemode!="coop" && global.gamemode!="sscreencoop" {
stopiniting=1
object_event_clear(changectrl,ev_other,ev_user0+p2)
    object_event_add(changectrl,ev_other,ev_user0+p2,global.changecode[global.option[p2]])
}

sheets[0]=skindat("tex_"+name+"0"+ss)
if (global.singlesheet[p2]) {
    i=1
    repeat (5) {
        sheets[i]=sheets[0]
        i+=1
    }
} else {
    sheets[1]=skindat("tex_"+name+string(global.reroutedsizes[p2,1])+ss)
    sheets[2]=skindat("tex_"+name+string(global.reroutedsizes[p2,2])+ss)
    sheets[3]=skindat("tex_"+name+string(global.reroutedsizes[p2,3])+ss)
    sheets[4]=skindat("tex_"+name+string(global.reroutedsizes[p2,4])+ss)
    sheets[5]=skindat("tex_"+name+string(global.reroutedsizes[p2,5])+ss)
    sheets[6]=skindat("tex_"+name+string(global.reroutedsizes[p2,6])+ss)
    sheets[7]=skindat("tex_"+name+string(global.reroutedsizes[p2,7])+ss)
    sheets[8]=skindat("tex_"+name+string(global.reroutedsizes[p2,8])+ss)
    sheets[9]=skindat("tex_"+name+string(global.reroutedsizes[p2,9])+ss)
}
sheetshields=skindat("tex_"+name+"shields"+ss)

shieldanimspeed=playerskindat(p2,"spdshield"+ss)
if shieldanimspeed<=0 shieldanimspeed=1
offshield=playerskindat(p2,"offshield"+ss)
addbde=playerskindat(p2,"addbde"+ss)
cushud=playerskindat(p2,"cushud"+ss)
firelength=playerskindat(p2,"firelen"+ss)
viclength=playerskindat(p2,"viclen"+ss)
carryoffx=playerskindat(p2,"carryx"+ss)
carryoffy=playerskindat(p2,"carryy"+ss)
jumpball=playerskindat(p2,"jumpball"+ss)
bowlag=playerskindat(p2,"bowlag"+ss)
if string(sheets[5])=="0" minisheet=false
else minisheet=playerskindat(p2,"minisheet"+ss)
shortsmallform=playerskindat(p2,"shortsmallform"+ss)
maxwait=playerskindat(p2,"maxwait"+ss)
squishyness=playerskindat(p2,"squish"+ss)
afterimageblend=playerskindat(p2,"afterimageblend"+ss)
poleoffx=playerskindat(p2,"poleoffx"+ss)
skin_offsety=playerskindat(p2,"skin_offsety"+ss)
useypos=playerskindat(p2,"useypos"+ss)
smallshield=playerskindat(p2,"smlshield"+ss)
snack_layout=playerskindat(p2,"snacklayout"+ss)
default_questionmush=playerskindat(p2,"default_questionmush"+ss)
custom_items=playerskindat(p2,"custom_items"+ss)
custom_mushrooms_idle=playerskindat(p2,"custom_mushrooms_idle"+ss)


usepalette=playerskindat(p2,"offersprays"+ss)
MAXIMUMSIZESARGH=playerskindat(p2,"maxsizes"+ss)
totpal=playerskindat(p2,"totpal"+ss)

snacklayout=playerskindat(p2,"snacklayout"+ss)


var loopey;
loopey=0
repeat (MAXIMUMSIZESARGH+1) {
    sprw[loopey]=global.boxwidth[p2,loopey]
    sprh[loopey]=global.boxheight[p2,loopey]
    sprcx[loopey]=global.skincenterx[p2,loopey]
    sprcy[loopey]=global.skincentery[p2,loopey]
    loopey+=1
}

animf=global.animdat[p2,5]
pxsc=1
mxsc=1
pysc=1
mysc=1
