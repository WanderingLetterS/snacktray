var yp;
calc=argument[1]
yp=0
if collision(0,15) {
    while yp<=15 && !collision(0,0)
    {
         y+=1
         yp+=1
    } if yp!=0 y-=1
}
return 1
