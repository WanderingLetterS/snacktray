///lemongetinfo(filename):map
//loads a file just to get the info ds map
var fn,t,f,fs,p,i,zeros,b,c,map;

fn=argument[0]
if string_pos(".lemon.png",fn) global.lemon_compat=1

clearbuffer()

t=createbuffer()
f=fileopen(fn,0)
fs=filesize(f)
fileread(f,fs,t)
fileclose(f)
if global.lemon_compat {
setpos(fs-4,t)
p=readuint(t)

if (p>fs) {error(lang("error lemon corrupt")+fn) return -1}

size=(fs-p-4)
setpos(p,t)
} else {
    size=fs
    setpos(0,t)
}

//custom rle v3
i=0 zeros=0
do {
    b=external_call(global._BufG,t)
    if (b=255) {
        c=external_call(global._BufG,t)
        b=external_call(global._BufG,t)
        repeat (c+1) external_call(global._BufA,b,0)
        i+=2
    } else {
        external_call(global._BufA,b,0)
        if (b=0) zeros+=1
    }
    i+=1
} until (i=size || zeros=2)

freebuffer(t)
setpos(0)

str=readstring()
if (str!="lemon" && str!="[lemon]") return -1
map=ds_map_create()
if (!ds_map_read_safe(map,readstring())) {ds_map_destroy(map) return -1}

global.lemon_compat=0

return map
