///lemonloader(filename)
//loads the actual level data into lemongrab and objcontainers
var fn,fnf,l,t,f,fs,i,o,b,c,lv,size,map,r,deity,water,w,h,obj,ent,did,k,converted,str,test;

fn=argument[0]


drawregion.unchanged=1
editnew(0)
clearbuffer()
l=lemongrab.length
converted=0

if (global.lemon_compat && fn!="test") {
    fnf=filename_fixname(fn)
    global.levelfname=string_copy(fnf,1,string_pos(".lemon",string_lower(fnf))-1)

    //read footer anchor and find lemon header
    t=createbuffer()
    f=fileopen(fn,0)
    fs=filesize(f)
    fileread(f,fs,t)
    fileclose(f)
    setpos(fs-4,t)
    i=readuint(t)

    if (i>fs) {error(lang("error lemon corrupt")+fn) return -1}

    size=(fs-i-4)
    setpos(i,t)
} else if (fn!="test") {
    fnf=filename_fixname(fn)
    global.levelfname=string_copy(fnf,1,string_pos(".lemon",string_lower(fnf))-1)

    t=createbuffer()
    f=fileopen(fn,0)
    fs=filesize(f)
    fileread(f,fs,t)
    fileclose(f)
    size=fs
    setpos(0,t) //we dont need to do the weird thumbnail stuff here as .lemon files are purely the level as opposed to .lemon.png's png with a level tacked on at the end
} else {
    //load from test buffer
    t=global.lemonbuffer
    size=global.lemonsize
    setpos(0,t)
}
//custom run-length compression v3
i=0
do {
    b=external_call(global._BufG,t)
    if (b=255) {
        c=external_call(global._BufG,t)
        b=external_call(global._BufG,t)
        repeat (c+1) external_call(global._BufA,b,0)
        i+=2
    } else external_call(global._BufA,b,0)
    i+=1
} until (i=size)   
if (fn!="test") freebuffer(t)
setpos(0)
         
if (readstring()!="[lemon]") {
    ping(lang("error lemon version"))
    exit
}
//read and extract header
map=ds_map_create()
if (!ds_map_read_safe(map,readstring())) {show_message("can't find lemon header???") ds_map_destroy(map) exit}
lv=ds_map_find_value(map,"v")

lemongrab.compat = string(lv)
trulv=lv
if lv="SnackTray2" {trulv=lv lv="SnackTray"}

if (lv="1.9.1" || lv="1.9.2" || lv="1.9.3") { //Lol
    lemonloader193(map)
    exit
}

lemongrab.thumbx=ds_map_find_value(map,"thumbx")
lemongrab.thumby=ds_map_find_value(map,"thumby")
lemongrab.thumbregion=ds_map_find_value(map,"thumbregion")
lemongrab.spawnx=ds_map_find_value(map,"spawnx")
lemongrab.spawny=ds_map_find_value(map,"spawny")
lemongrab.spawnr=ds_map_find_value(map,"spawnr")
if (lv="2.1.5" ||lv="SnackTray") {
    lemongrab.tspawnx=ds_map_find_value(map,"tspawnx")
    lemongrab.tspawny=ds_map_find_value(map,"tspawny")
    lemongrab.tspawnr=ds_map_find_value(map,"tspawnr")
} else {
    lemongrab.tspawnx=ds_map_find_value(map,"spawnx")
    lemongrab.tspawny=ds_map_find_value(map,"spawny")
    lemongrab.tspawnr=0
}
lemongrab.levelname=string(ds_map_find_value(map,"name"))
lemongrab.leveldesc=string(ds_map_find_value(map,"desc"))  
lemongrab.time=max(30,ds_map_find_value(map,"time"))
if ((lv!="2.1.5"||lv="SnackTray") && lemongrab.time==600) lemongrab.time=12001
ds_map_destroy(map)

global.levelname=lemongrab.levelname
global.leveldesc=lemongrab.leveldesc          
global.time=lemongrab.time

with (regionbutton) empty=1

//read regions
if (readstring()!="[reg]") {show_message("can't find region marker") exit}
r=0
repeat (8) {
    if (readstring()!="[rg"+string(r+1)+"]") {show_message("can't find region "+string(r+1)) exit}
    deity=lemongrab.gods[r]
    water=lemongrab.waters[r]
    semi=lemongrab.semis[r]
    back=lemongrab.backs[r]
    lemongrab.typeobj[r]=convert193biome(readstring())
    lemongrab.typebg[r]=convert193biome(readstring())
    lemongrab.typemus[r]=convert193biome(readstring())
    if (getbiomeid(lemongrab.typeobj[r])=-1){
        error(lang("error lemon biome1")+lemongrab.typeobj[r]+lang("error lemon biome2"))
    }
    if (getbiomeid(lemongrab.typebg[r])=-1){
        error(lang("error lemon biome1")+lemongrab.typebg[r]+lang("error lemon biome2"))
    }
    if (getbiomeid(lemongrab.typemus[r])=-1){
        error(lang("error lemon biome1")+lemongrab.typemus[r]+lang("error lemon biome2"))
    }
    
    if (lv="2" || lv="3" || lv="2.0.5" || lv="-S-"|| lv="2.0.75"||lv="2.1" || lv="2.1.1" || lv="2.1.2" || lv="2.1.3" || lv="2.1.4" || lv="2.1.5"||lv="SnackTray") lemongrab.water[r]=readshort()
    else lemongrab.water[r]=0
    if (lv="-S-" || lv="2.0.5"|| lv="2.0.75"||lv="2.1"|| lv="2.1.1" || lv="2.1.2" ||lv="2.1.3" ||lv="2.1.4" || lv="2.1.5" ||lv="SnackTray") lemongrab.horizon[r]=readshort()
    else lemongrab.horizon[r]=0
    w=readshort()
    h=readshort()
    if (lv="2.1.1" || lv="2.1.2" || lv="2.1.3" || lv="2.1.4" || lv="2.1.5" ||lv="SnackTray"){
    bpm=readshort()
    bpb=readshort()
    lightlevel=readshort()
    } else {
    bpm=110
    bpb=8
    lightlevel=0
    }
    size=w*h
    lemongrab.w[r]=w
    lemongrab.h[r]=h
    lemongrab.bpm[r]=bpm
    lemongrab.bpb[r]=bpb
    lemongrab.lightlevel[r]=lightlevel
    
    i=0
    repeat (72) {
        lemongrab.cambitmap[r,i]=readbyte()
        lemongrab.cambitmap2[r,i]=readbyte()
        i+=1
    }
    if trulv="SnackTray2"
    repeat (72) {
        lemongrab.cambitmap[r,i]=readbyte()
        lemongrab.cambitmap2[r,i]=readbyte()
        i+=1
    }
    
    //read entities
    test=1
    if (readstring()!="[nty]") {show_message("can't find entity marker") exit}    
    repeat (readbyte()) {
        test=0
        str=readstring()
        obj=editname2obj(str)
        if (obj=-1) {
            //this object is unknown, so let's skip loading it
            ent=readbyte()
            repeat (readuint()) {
                readbyte()
                readushort()
                if (ent) repeat (8) readstring()
            }
            converted=1
            show_debug_message("lemon: can't find object called "+qt+str+qt)
        }
        else if obj==dotter obj=mushmini
        else if obj==undotter obj=mushroom
        else {
            i=1 repeat l {if (obj=lemongrab.objlist[i,0]) {spr=lemongrab.objlist[i,1] off=lemongrab.objlist[i,2] did=i break} i+=1}
            ent=readbyte()
            repeat (readuint()) {
                //read one entity
                b=readbyte()
                b=(b<<16)+readushort()

                if (obj==waterblock) {
                    w=1 h=1
                    if (ent) {
                        w=unreal(readstring(),1)
                        h=unreal(readstring(),1)
                        repeat (6) readstring()
                    }
                    for (u=0;u<w;u+=1) for (v=0;v<h;v+=1) {
                        o=instance_create(b>>12+u,b&$fff+v,water)
                        o.region=r
                    }
                } else if (obj==groundsemi||obj==slopel1s||obj==slopel2s||obj==sloper1s||obj==sloper2s) {
                     i=instance_create(b>>12,b&$fff,semi)
                     i.obj=obj
                } else if (obj==groundback/*||obj==slopel1b||obj==slopel2b||obj==sloper1b||obj==sloper2b*/) {
                     i=instance_create(b>>12,b&$fff,back)
                     i.obj=obj
                }else {
                    i=instance_create(b>>12,b&$fff,deity)
                    i.obj=obj
                    i.spr=spr
                    i.off=off
                    i.dataid=did
                    if (ent) {
                        k=0
                        if lv!="SnackTray" repeat (8) {i.data[k]=readstring() k+=1}
                        else repeat (12) {i.data[k]=readstring() k+=1}
                        if (lemongrab.objlist[did,5]="align") {
                            if (obj=fbarblock && (lv!="2.1.1" && lv!="2.1.2" && lv!="2.1.3" && lv!="2.1.4"&& lv!="2.1.5" && lv!="SnackTray"))
                            || ((obj=itembox||obj=phaser||obj=brick||obj=monitor) && lv!="2.0.75" && lv!="2.1" && lv!="2.1.1" && lv!="2.1.2" && lv!="2.1.3" && lv!="2.1.4"&& lv!="2.1.5" && lv!="SnackTray")
                            || ((obj=warpbox||obj=door) && lv!="2.1.5" && lv!="SnackTray") { //fix objects getting align much later
                                var al;
                                al=7 repeat (8) {i.data[al+1]=i.data[al] al-=1}
                                i.data[0]="0"
                            }

                            if (lv!="3"&&lv!="4"&&lv!="-S-"&&lv!="2.0.5"&&lv!="2.0.75"&&lv!="2.1"&&lv!="2.1.1"&&lv!="2.1.2"&&lv!="2.1.3"&&lv!="2.1.4"&& lv!="2.1.5" && lv!="SnackTray") {
                                //convert old align flag
                                if (i.data[0]="1") i.data[0]="-8,0"
                                else i.data[0]="0,0"
                            }
                            unpack_align(i)
                        }

                        if lv=="2.0" || lv=="2" || lv=="3" || lv=="2.0.5" || lv=="-S-"|| lv="2.0.75" || lv=="2.1"  with(i) {
                            if obj==anchor {
                                data[1]="0,0"
                                data[2]="0"
                            }
                        }
                        if lv=="2.1" with(i) {
                            if obj==terrainspring {
                                data[1]="0"
                            }
                        }
                        if lv!="2.1.5" && lv!="SnackTray" {
                            if (obj == token) {
                                i.data[0]="0,0"
                                i.data[1]="1"
                            }
                            if (obj==door) {
                                i.data[6]="key"
                            }
                            if (obj==warpbox) {
                                i.data[6]="key"
                            }
                            if (obj==cardreader) {
                                i.data[1]="card"
                            }
                            if (obj==itemlaunch) {
                                if (i.data[1]="tap") i.obj=crystaltap
                                if (i.data[1]="key") i.obj=keyitem
                                if (i.data[1]="undotter") i.data[1]="mushroom"
                                if (i.data[1]="dotter") i.data[1]="mini"
                            }
                        }
                        if (obj==mark) {
                            //Items
                            if (i.data[0]="undotter" || i.data[0]="mushroom") {i.obj=mushroom i.data[0]="0,0"}
                            if (i.data[0]="dotter")   {i.obj=mushmini i.data[0]="0,0" }
                            if (i.data[0]="flower")   {i.obj = flower i.data[0]="0,0" }
                            if (i.data[0]="star")     {i.obj =starman i.data[0]="0,0" }
                            if (i.data[0]="1up")      {i.obj=lifemush i.data[0]="0,0" }
                            //Misc
                            if (i.data[0]="delfruit") i.obj=delfruit
                            if (i.data[0]="pswitch") { i.obj=pswitch i.data[0]="0,0" }
                            if (i.data[0]="b") {with (i) instance_destroy()} //broken Claw object that isn't used anymore
                        }
                        
                        if (obj == tyler || obj == decortyler
                         || obj == objectstyler || obj == terraintyler) {
                            if (getbiomeid(data[7]) != -1)
                                tylerbiomes[getbiomeid(data[7])] = 1
                        }  
                        if obj==anchor {
                            if unreal(data[2],0) tylerbiomes[unreal(data[2],0)-1] = 1
                        }
                        
                    }
                    if i.obj != i.dataid {
                        var z;
                        z=1 repeat l {if (i.obj=lemongrab.objlist[z,0]) {i.spr=lemongrab.objlist[z,1] i.off=lemongrab.objlist[z,2] i.dataid=z break} z+=1}
                    }
                }
            }
        }
    }
    with (regionbutton) if (n=r) empty=test
    r+=1
}
with(drawregion) UPDATE_THE_DEITIES=1
if (converted && room==lemon) ping(lang("error lemon converted"))
