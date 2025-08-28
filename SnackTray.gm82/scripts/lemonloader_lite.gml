///lemonloader_lite(filename)
//loads minimal level data into lemongrab (info, biomes)

//moster's note: this is now almost completely unnecessary 

// kelloggs was here
var fn,fnf,l,t,f,fs,i,o,b,c,lv,size,map,r,deity,water,w,h,obj,ent,did,k,converted,str,test;

fn=argument[0]       
   
//show_message("lemonloader_lite @ init")

editnew(0)
clearbuffer()                  
l=lemongrab.length
converted=0

//show_message("lemonloader_lite @ finished var init")

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
    //show_message("lemonloader_lite @ created buffer")
    //show_message("lemonloader_lite @ fn: "+global.levelfname)
    //show_message("lemonloader_lite @ size: "+string(size))
} else {
    //load from test buffer
    t=global.lemonbuffer
    size=global.lemonsize
    setpos(0,t)
}

//custom run-length compression v3
//show_message("lemonloader_lite @ prepping rle")
i=0
do {
    //show_message("lemonloader_lite @ 59")
    b=readbyte(t)
    if (b=255) {
        //show_message("lemonloader_lite @ 62")
        c=readbyte(t)
        //show_message("lemonloader_lite @ 64")
        b=readbyte(t)
        //show_message("lemonloader_lite @ 66")
        repeat (c+1) writebyte(b,0)
        i+=2
    } else {
        //show_message("lemonloader_lite @ 70")
        writebyte(b,0)
    }
    i+=1
} until (i=size)
if (fn!="test") freebuffer(t)
setpos(0)
//show_message("lemonloader_lite @ rle done")

if (readstring()!="[lemon]") {
    ping(lang("error lemon version"))
    exit
}
//read and extract header
map=ds_map_create()
if (!ds_map_read_safe(map,readstring())) {show_message("can't find lemon header???") ds_map_destroy(map) exit}
//show_message("lemonloader_lite @ got dsmap")
ds_map_destroy(map)

//show_message("lemonloader_lite @ got info")

//read regions
if (readstring()!="[reg]") {show_message("can't find region marker") exit}
r=0
repeat (8) {
    if (readstring()!="[rg"+string(r+1)+"]") {show_message("can't find region "+string(r+1)) exit}
    repeat (3) readstring()

    if (lv="2" || lv="3" || lv="2.0.5" || lv="-S-"|| lv="2.0.75"||lv="2.1" || lv="2.1.1" || lv="2.1.2" || lv="2.1.3" || lv="2.1.4" || lv="2.1.5") readshort()
    if (lv="-S-" || lv="2.0.5"|| lv="2.0.75"||lv="2.1"|| lv="2.1.1" || lv="2.1.2" ||lv="2.1.3" ||lv="2.1.4" || lv="2.1.5") readshort()
    readshort()
    readshort()
    if (lv="2.1.1" || lv="2.1.2" || lv="2.1.3" || lv="2.1.4" || lv="2.1.5"){
    readshort()
    readshort()
    readshort()
    }

    repeat (144)readbyte()

    //read entities
    //show_message("lemonloader_lite @ prepping to get entities")
    if (readstring()!="[nty]") {show_message("can't find entity marker") exit}
    repeat (readbyte()) {
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
        }
        else {
            i=1 repeat l {if (obj=lemongrab.objlist[i,0]) break i+=1}
            ent=readbyte()
            repeat (readuint()) {
                //read one entity
                readbyte()
                readushort()
                
                
                if (ent)
                {
                  //repeat (8) {readstring()}
                  k=0 repeat (8) {data[k]=readstring() k+=1}
                                      
                    if (obj == tyler || obj == decortyler
                     || obj == objectstyler || obj == terraintyler) {
                        if (getbiomeid(data[7]) != -1)
                            tylerbiomes[getbiomeid(data[7])] = 1
                    }    
                }
            }
        }
    }
    r+=1
}

return fs
//show_message("lemonloader_lite @ done")
