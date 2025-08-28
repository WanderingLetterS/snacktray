///draw_blasttext(x,y,str,col,a)
var str,col,alpha;
var dx,dy;
var l,i,j,c,s;
var line,lw,lh;
var arr,tag,tagstr,cmd;
var dcol,dalp,dsca;

dx=floor(argument[0])
dy=floor(argument[1])
str=string(argument[2])
col=$ffffff if (argument_count>=4) col=argument[3]
alpha=1 if (argument_count>=5) alpha=argument[4]
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

    c=string_pos(ch,global.blastmap)-1
    draw_sprite_part_ext(spr_bowsersmb3,0,c*8,0,8,16,dx,dy+9*s-9*s,s,s,col,alpha)
    dx+=8*s
    arr[j]=c j+=1 cmd[j,0]=0
    lw[line]+=8*s
    maxx=max(maxx,lw[line])
}
