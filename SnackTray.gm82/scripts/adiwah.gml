///adiwah(slot,name,list)
//animation data is weird as heck

var slot,name,i,j,list,tokens,c,tokens2,c2,maxsizes;

slot=argument[0]
name=argument[1]
list=argument[2]

if (list="") exit

c=0
do {
    p=string_pos(",",list)
    if (p=0) {if (list!="") tokens[c]=list c+=1}
    else {
        tokens[c]=string_copy(list,1,p-1) c+=1
        list=string_delete(list,1,p)
    }
} until (p=0)

maxsizes=playerskindat(slot,"maxsizes"+string(slot))

for (i=0;i<c;i+=1) {
    k=16+128*i //1d array :P



    spr=tokens[i]
    global.animdat[slot,k]=spr

    //read frame count list
    t=string(playerskindat(slot,name+" "+spr+" frames"))
    j=0 do {
        p=string_pos(",",t)
        if (p) {
            global.animdat[slot,k+1+j]=unreal(string_copy(t,1,p-1),1)
            t=string_delete(t,1,p)
        } else global.animdat[slot,k+1+j]=unreal(t,1)
        j+=1
    } until (!p) repeat (maxsizes+1-j) {global.animdat[slot,k+1+j]=global.animdat[slot,k+j] j+=1}

    t=unreal(playerskindat(slot,name+" "+spr+" speed"),1) if (t=0) t=1 global.animdat[slot,k+maxsizes+DAT_SPEED]=t
    global.animdat[slot,k+maxsizes+8]=max(1,unreal(playerskindat(slot,name+" "+spr+" loop"),1))
    if !unreal(playerskindat(slot,name+" "+spr+" loop")) global.animdat[slot,k+maxsizes+DAT_LOOP]=1

    global.animdat[slot,k+maxsizes+DAT_OFFX]=unreal(playerskindat(slot,name+" "+spr+" offset x"), 0)
    global.animdat[slot,k+maxsizes+DAT_OFFY]=unreal(playerskindat(slot,name+" "+spr+" offset y"), 0)

    global.animdat[slot,k+maxsizes+DAT_BOXWIDTH]=unreal(playerskindat(slot,name+" "+spr+" boxwidth"), 0)

    global.animdat[slot,k+maxsizes+DAT_BOXHEIGHT]=unreal(playerskindat(slot,name+" "+spr+" boxheight"), 0)


    list=string(playerskindat(slot,name+" "+spr+" frametimes"))

    c2=0
    do {
        p=string_pos(",",list)
        if (p=0) {if (list!="") tokens2[c2]=list c2+=1}
        else {
            tokens2[c2]=string_copy(list,1,p-1) c2+=1
            list=string_delete(list,1,p)
        }
    } until (p=0)

    if (list="0") {
        for (j=0;j<global.animdat[slot,k+1];j+=1) {
            global.animdat[slot,k+maxsizes+DAT_FRAMETIMES+j]=1
        }
    } else {
        for (j=0;j<global.animdat[slot,k+1];j+=1) {
            global.animdat[slot,k+maxsizes+DAT_FRAMETIMES+j]=max(1,unreal(tokens2[j],1))
        }
    }
}

global.animdat[slot,0]=c

global.boxwidth[slot,0]=max(1,unreal(playerskindat(slot,name+" box width"),48))
global.boxheight[slot,0]=max(1,unreal(playerskindat(slot,name+" box height"),48))
global.skincenterx[slot,0]=unreal(playerskindat(slot,name+" center x"),24)
global.skincentery[slot,0]=unreal(playerskindat(slot,name+" center y"),28)

var loopey; loopey=1
repeat (maxsizes) {
    global.boxwidth[slot,loopey]=global.boxwidth[slot,0]
    global.boxheight[slot,loopey]=global.boxheight[slot,0]
    global.skincenterx[slot,loopey]=global.skincenterx[slot,0]
    global.skincentery[slot,loopey]=global.skincentery[slot,0]
    loopey+=1
}





if funnytruefalse(playerskindat(slot,name+" multiple box sizes")){

    singlesheetsplitville=string(playerskindat(slot,name+" box width"))
    singlesheetsplits=string_count(",",singlesheetsplitville)+1
    i=0
    repeat(singlesheetsplits){
        j=string_pos(",",singlesheetsplitville)
        if j==0 j=string_length(singlesheetsplitville)+1
        global.boxwidth[slot,i]=unreal(string_copy(singlesheetsplitville,0,j-1),-1)
        singlesheetsplitville=string_copy(singlesheetsplitville,j+1,(string_length(singlesheetsplitville)-j))
        i+=1
    }

    singlesheetsplitville=string(playerskindat(slot,name+" box height"))
    singlesheetsplits=string_count(",",singlesheetsplitville)+1
    i=0
    repeat(singlesheetsplits){
        j=string_pos(",",singlesheetsplitville)
        if j==0 j=string_length(singlesheetsplitville)+1
        global.boxheight[slot,i]=unreal(string_copy(singlesheetsplitville,0,j-1),-1)
        singlesheetsplitville=string_copy(singlesheetsplitville,j+1,(string_length(singlesheetsplitville)-j))
        i+=1
    }

    singlesheetsplitville=string(playerskindat(slot,name+" center x"))
    singlesheetsplits=string_count(",",singlesheetsplitville)+1
    i=0
    repeat(singlesheetsplits){
        j=string_pos(",",singlesheetsplitville)
        if j==0 j=string_length(singlesheetsplitville)+1
        global.skincenterx[slot,i]=unreal(string_copy(singlesheetsplitville,0,j-1),-1)
        singlesheetsplitville=string_copy(singlesheetsplitville,j+1,(string_length(singlesheetsplitville)-j))
        i+=1
    }

    singlesheetsplitville=string(playerskindat(slot,name+" center y"))
    singlesheetsplits=string_count(",",singlesheetsplitville)+1
    i=0
    repeat(singlesheetsplits){
        j=string_pos(",",singlesheetsplitville)
        if j==0 j=string_length(singlesheetsplitville)+1
        global.skincentery[slot,i]=unreal(string_copy(singlesheetsplitville,0,j-1),-1)
        singlesheetsplitville=string_copy(singlesheetsplitville,j+1,(string_length(singlesheetsplitville)-j))
        i+=1
    }

}

global.animdat[slot,5]=median(0,unreal(playerskindat(slot,name+" animation speed"),1.0),10)
