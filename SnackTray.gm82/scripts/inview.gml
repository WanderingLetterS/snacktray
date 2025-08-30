///inview()
//returns true if inside any of the player views

var i,out;



out=1
for (i=0;i<global.mplay;i+=1)if (x=median(view_xview[i]-64,x,view_xview[i]+view_wview[i]+64) && y=median(view_yview[i]-64,y,view_yview[i]+view_hview[i]+64)) out=0
return !out
