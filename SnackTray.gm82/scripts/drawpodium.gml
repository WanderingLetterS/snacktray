///drawpodium(x,y,xsc,p2,pts) Alot of the stuff here just goes entirely unused i just want it to work for now
//draws a podium stand for the result screens

x=argument[0]
y=round(argument[1])
xsc=argument[2]
p2=argument[3]
if argument_count<6{
placement=1
}else placement=argument[6]


if (global.gamemode!="battle") draw_sprite(spr_podium,placement,x,y)
if (global.gamemode="battle") {draw_sprite(spr_podium,-place[p2]+4,x,y) draw_sprite(spr_place,place[p2]-1,x,y+24)}

if !firstrun[p2] firstrun[p2]=instance_create(x,y,lemon_tile) // when im a convenient completely null object!
with firstrun[p2] {
    x=other.x
    y=other.y
    p2=other.p2

    xsc=other.xsc

    name=global.charname[global.option[p2]]

    if !initted {
        charm_init()
        sprite=""
        oldspr=""
        sid=0
        initted=1
    }

    charm_run("sprmanager")


    if (global.gamemode="battle") picky=other.place[p2]-1

                 sprite="pose" //TODO: CHANGE THESE TO CUSTOM POSES (battlewin, battlemid, battlelose)
    if (picky=1) sprite="wait"
    if (picky=2) sprite="knock"
    if (picky=3) sprite="dead"

    if (sid=0) { //edited from a section of adiwah
        var p,list,c,tokens;

        list=string(global.spritelist[global.option[p2]])
        c=0
        do {
            p=string_pos(",",list)
            if (p=0) {if (list!="") tokens[c]=list c+=1}
            else {
                tokens[c]=string_copy(list,1,p-1) c+=1
                list=string_delete(list,1,p)
            }
        } until (p=0)

        for (i=0;i<c;i+=1) {
            if tokens[i]==sprite sid=i
        }
    }

    size=global.size[p2]
    shielded=global.shielded[p2]
    alpha=1
    frspd=1
    ysc=1
    if usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,totpal+1)

    ssw_core(1)

    if (global.shielded[p2]) ssw_shield("shield_back")
    ssw_core(0)
    if (global.shielded[p2]) ssw_shield("shield")
    shader_reset();
}

global.halign=1
draw_systext(x,y-30,argument[5],playercol(global.input[p2]))
global.halign=0
