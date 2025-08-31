var i,l,j,count;

with (palbutton) instance_destroy()
with (palbuttontile) instance_destroy()

with (editmanager) {
    tab=argument[0]
    tabnames[0]="Tiles Layer 0"
    tabshortcut[0]="C"
    tabnames[1]="Tiles Layer 1"
    tabshortcut[1]="X"
    tabnames[2]="Tiles Layer 2"
    tabshortcut[2]="Z"
    tabnames[3]="Objects"
    tabshortcut[3]="V"
    tabnames[4]="Technical"
    tabshortcut[4]="B"
}


//Layer 0
if (argument[0]=0 || argument[0]=1 || argument[0]=2 ) {
    l[ 0]=-1            l[ 1]=-1     l[ 2]=-1     l[ 3]=-1     l[ 4]=-1    l[ 5]=-1    l[ 6]=-1   l[ 7]=-1  l[ 8]=-1   l[ 9]=-1      l[10]=-1  l[11]=-1   l[12]=-1     l[13]=-1    l[14]=-1  l[15]=-1
    l[16]=-1            l[17]=-1     l[18]=-1     l[19]=-1     l[20]=-1    l[21]=-1    l[22]=-1   l[23]=-1  l[24]=-1   l[25]=-1      l[26]=-1  l[27]=-1   l[28]=-1     l[29]=-1    l[30]=-1  l[31]=-1
    l[32]=-1            l[33]=-1     l[34]=-1     l[35]=-1     l[36]=-1    l[37]=-1    l[38]=-1   l[39]=-1  l[40]=-1   l[41]=-1      l[42]=-1  l[43]=-1   l[44]=-1     l[45]=-1    l[46]=-1  l[47]=-1
    count=0
    for (i=0;i<=global.wm_lineamount;i+=1) {
        for (j=0;j<global.wm_line[i,3];j+=1) {
            tile[count]=global.wm_line[i,4+j]
            switch argument[0]{
                case 0: l[count]=worldmap_tile   break;
                case 1: l[count]=worldmap_tiled1 break;
                case 2: l[count]=worldmap_tiled2 break;
            }
            count+=1
        } //saving the tile names from the temp list
    }
    //Automating the objects I'm grabbin
    for (i=0;i<48;i+=1) {
        if (l[i]!=-1) with (instance_create(i,0,palbuttontile)) {self.i=i obj=editobjfind(l[i])
        
            //Findma  
            
            for (count=0;count<=global.wm_lineamount;count+=1) {
                for (j=0;j<global.wm_line[count,3];j+=1) {
                    if (global.wm_line[count,4+j]=other.tile[i]) {
                        self.frame=0
                        self.frn=global.wm_line[count,0]
                        self.frs=global.wm_line[count,2]
                        self.frl=global.wm_line[count,1]
                        self.off_x=j*frn
                        self.line=count
                        self.tile=other.tile[i]
                        self.width=global.wm_lineexdata[count,0]
                        self.height=global.wm_lineexdata[count,1]
                        break;
                    }
                }
            }
            
            //FIND MA VALUES IN YOUR PALBUTTON HAHAAAAAAAAAAAAAAAAAAAAAAAAA

        }
    }


}
//Objects
if (argument[0]=3) {
    l[ 0]=anchor       l[ 1]=barrier           l[ 2]=-1   l[ 3]=-1     l[ 4]=-1     l[ 5]=-1 l[ 6]=-1  l[ 7]=-1         l[8]=-1       l[ 9]=-1         l[10]=-1  l[11]=-1     l[12]=-1     l[13]=-1    l[14]=-1 l[15]=-1
    l[16]=tyler        l[17]=objectstyler      l[18]=-1  l[19]=-1     l[20]=-1    l[21]=-1    l[22]=-1 l[23]=-1      l[24]=-1    l[25]=-1 l[26]=-1    l[27]=-1    l[28]=-1     l[29]=-1 l[30]=-1  l[31]=-1
    l[32]=terraintyler l[33]=-1                l[34]=-1         l[35]=-1     l[36]=-1    l[37]=-1 l[38]=-1   l[39]=-1  l[40]=g-1  l[41]=-1      l[42]=-1   l[43]=-1   l[44]=-1     l[45]=-1     l[46]=-1  l[47]=-1
    for (i=0;i<48;i+=1) {
        if (l[i]!=-1) with (instance_create(0,0,palbutton)) {self.i=i obj=editobjfind(l[i])}
    }

}
//Technical
if (argument[0]=4) {
    l[ 0]=code l[ 1]=-1 l[ 2]=-1     l[ 3]=-1 l[ 4]=-1     l[ 5]=-1   l[ 6]=-1    l[ 7]=-1 l[ 8]=-1 l[ 9]=-1 l[10]=-1 l[11]=-1 l[12]=-1 l[13]=-1 l[14]=-1 l[15]=-1
    l[16]=-1 l[17]=-1 l[18]=-1 l[19]=-1 l[20]=-1   l[21]=-1 l[22]=-1  l[23]=-1 l[24]=-1 l[25]=-1 l[26]=-1 l[27]=-1 l[28]=-1 l[29]=-1 l[30]=-1 l[31]=-1
    l[32]=-1 l[33]=-1 l[34]=-1    l[35]=-1 l[36]=-1 l[37]=-1   l[38]=-1    l[39]=-1 l[40]=-1 l[41]=-1 l[42]=-1 l[43]=-1 l[44]=-1 l[45]=-1 l[46]=-1 l[47]=-1
    for (i=0;i<48;i+=1) {
        if (l[i]!=-1) with (instance_create(0,0,palbutton)) {self.i=i obj=editobjfind(l[i])}
    }

}
/*for (i=0;i<48;i+=1) {
    if (l[i]!=-1) with (instance_create(0,0,palbutton)) {self.i=i obj=editobjfind(l[i])}
}*/
