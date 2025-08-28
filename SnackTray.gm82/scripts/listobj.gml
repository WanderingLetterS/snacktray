var j;

length+=1
objlist[length,0]=argument[0]
objlist[length,1]=argument[2]
objlist[length,2]=argument[1]*8
objlist[length,25]=argument[3]+1
objlist[length,4]=argument[4] //family

objlist[length,21]=0

objlist[length,3]=0
for (j=0;j<8;j+=1) {
    objlist[length,j+5]=""
    objlist[length,j+101]=""
}
