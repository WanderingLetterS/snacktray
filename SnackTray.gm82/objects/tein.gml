#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=100
getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
k=flag.ystart
     if (y<k+16 ) {value=8 global.scor[p2]+=5000}
else if (y<k+64 ) {value=6 global.scor[p2]+=2000}
else if (y<k+80 ) {value=4 global.scor[p2]+= 800}
else if (y<k+120) {value=2 global.scor[p2]+= 400}
else              {value=0 global.scor[p2]+= 100}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_weffects("score")
