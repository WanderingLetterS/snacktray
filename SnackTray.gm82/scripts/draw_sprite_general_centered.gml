///draw_sprite_general_centered(sprite,subimg,left,top,width,height,x,y,xscale,yscale,rot,color,alpha,centerx,centery)
var sprite,subimg,left,top,width,height,_x,_y,xscale,yscale,rot,color,alpha,centerx,centery;
sprite=argument[0]
subimg=argument[1]
left=argument[2]
top=argument[3]
width=argument[4]
height=argument[5]
_x=argument[6]
_y=argument[7]
xscale=argument[8]
yscale=argument[9]
rot=argument[10]
color=argument[11]
alpha=argument[12]
centerx=argument[13]
centery=argument[14]


draw_sprite_general(sprite,
subimg,left,top,width,hegiht,
round(_x)+lengthdir_x((margin-centerx)*(xsc)*xsc,rot)+lengthdir_x((margin-centery)*(ysc),rot-90),
round(_y)+lengthdir_y((margin-centerx)*(xsc)*ysc,rot)+lengthdir_y((margin-centery)*(ysc),rot-90),
xscale,yscale,rot,color,color,color,color,alpha)
