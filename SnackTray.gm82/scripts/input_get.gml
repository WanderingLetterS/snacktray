///input_get(method)
//reads the input method and changes the local collection of button variables
var input,tmp,j,oops;

input=argument[0]
oops=0

if ((instance_exists(message) && object_index!=message) || instance_exists(console) || global.ignorejoy) exit

up=   0
down= 0
left= 0
right=0
akey= 0
bkey= 0
ckey= 0
skey= 0
xkey=0
ykey=0
zkey=0
rkey=0

if (input=median(JOY,input,JOY+8) || (input=-1 && global.joynum)) {
    tmp=1
    if (input=-1) tmp=global.joynum
    j=0
    repeat (tmp) {
        if (input=-1) unpackjoyconfig(j)
        else if (!joyset) unpackjoyconfig(input-JOY)
        up   = up || joymapget(joyid,0)
        down = down || joymapget(joyid,1)
        left = left || joymapget(joyid,2)
        right= right || joymapget(joyid,3)
        akey = akey || joymapget(joyid,4)
        bkey = bkey || joymapget(joyid,5)
        ckey = ckey || joymapget(joyid,6)
        skey = skey || joymapget(joyid,7)
        xkey=xkey || joymapget(joyid,8)
        ykey=ykey || joymapget(joyid,9)
        zkey=zkey || joymapget(joyid,10)
        rkey=rkey || joymapget(joyid,11)
        if (akey || bkey || skey) {global.clicc=joyid+JOY oops=1}
        j+=1
    }
}
if (input=-1 || input=0 || input=1) {
    input=max(0,input)
    up   =up    || global.keydirect[0,input]
    down =down  || global.keydirect[1,input]
    left =left  || global.keydirect[2,input]
    right=right || global.keydirect[3,input]
    akey =akey  || global.keydirect[4,input]
    bkey =bkey  || global.keydirect[5,input]
    ckey =ckey  || global.keydirect[6,input]
    skey =skey  || global.keydirect[7,input]
    xkey=xkey || global.keydirect[8,input]
    ykey=ykey || global.keydirect[9,input]
    zkey=zkey || global.keydirect[10,input]
    rkey=rkey || global.keydirect[11,input]

    if ((akey || bkey || skey) && !oops) global.clicc=input
}

if (global.fuzzy && object_index=player) {
    for (j=0;j<11;j+=1) for (i=0;i<4;i+=1) store[j,i]=store[j,i+1]
    store[0,i]=up
    store[1,i]=down
    store[2,i]=left
    store[3,i]=right
    store[4,i]=akey
    store[5,i]=bkey
    store[6,i]=ckey
    store[7,i]=skey
    store[8,i]=xkey
    store[9,i]=ykey
    store[10,i]=zkey

    up=store[0,0]
    down=store[1,0]
    left=store[2,0]
    right=store[3,0]
    akey=store[4,0]
    bkey=store[5,0]
    ckey=store[6,0]
    skey=store[7,0]
    xkey=store[8,0]
    ykey=store[9,0]
    zkey=store[10,0]
}

if (skindat("left") && instance_exists(gamemanager)) {tmp=left left=right right=tmp}

if (global.inputwait) input_clear()
