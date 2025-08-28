///draw_systext(x,y,str,col,a,spc,cus_spr)
var str,col,alpha,linespc,cus_spr;
var dx,dy;
var l,i,j,c,s;
var line,lw,lh;
var arr,tag,tagstr,cmd;
var dcol,dalp,dsca,dlin;

if (global.sysfont=-1) exit

dx=floor(argument[0])
dy=floor(argument[1])
str=string(argument[2])
col=$ffffff if (argument_count>=4) col=argument[3]
alpha=1 if (argument_count>=5) alpha=argument[4]
linespc=8 if (argument_count>=6) linespc=argument[5]
cus_spr=global.sysfont if (argument_count>=7) cus_spr=argument[6]
l=string_length(str)

maxx=0
maxy=0
s=global.tscale

line=0
lw[999]=0
lh=8*s
cmd[0,0]=0

j=1 tag=0
for (i=1;i<=l;i+=1) {
    ch=string_char_at(str,i)

    //tag system
    if (tag) {
        if (ch="}") {
            tag=0
            //tag commands
            if (string_pos("c=",tagstr)=1) {cmd[j,0]=1 cmd[j,1]=deciphercolor(string_delete(tagstr,1,2))}
            if (string_pos("a=",tagstr)=1) {cmd[j,0]=2 cmd[j,1]=unreal(string_delete(tagstr,1,2))}
            if (string_pos("s=",tagstr)=1) {cmd[j,0]=3 cmd[j,1]=unreal(string_delete(tagstr,1,2))}
            if (string_pos("l=",tagstr)=1) {cmd[j,0]=4 cmd[j,1]=unreal(string_delete(tagstr,1,2))}
            arr[j]=13 j+=1
            continue
        } else {tagstr+=ch continue}
    }
    if (ch="$") if (string_char_at(str,i+1)="{") {tag=1 i+=1 tagstr="" continue}

    c=string_pos(ch,global.fontmap)
    arr[j]=c j+=1 cmd[j,0]=0

    if (c=13) continue
    if (c=35 || c=10) {if (i=l) break lh+=8*s line+=1 continue}
    lw[line]+=8*s
    maxx=max(maxx,lw[line])
}
maxy=lh

if (global.tcalc) exit

l=j-1
line=0
if (global.halign=1) dx-=floor(lw[line]/2)
if (global.halign=2) dx-=lw[line]
if (global.valign=1) dy-=floor(lh/2)
if (global.valign=2) dy-=lh

dcol=col
dalp=alpha
dsca=s
dlin=linespc
for (i=1;i<=l;i+=1) {
    c=arr[i]
    if (cmd[i,0]=1) dcol=color_mult(cmd[i,1],col)
    if (cmd[i,0]=2) dalp=alpha*cmd[i,1]
    if (cmd[i,0]=3) dsca=s*cmd[i,1]
    if (cmd[i,0]=4) dlin=cmd[i,1]
    if (c=13) continue
    if (c=35 || c=10) {dcol=col dalp=alpha dsca=s line+=1 dx=floor(argument[0]) if (global.halign=1) dx-=floor(lw[line]/2) if (global.halign=2) dx-=lw[line] dy+=dlin*s continue}
    if (c!=32) draw_sprite_part_ext(cus_spr,0,(c mod 16)*9,(c div 16)*9,9,9,dx,dy+(dlin+1)*s-(dlin+1)*dsca,s,dsca,dcol,dalp)
    dx+=8*s
}
