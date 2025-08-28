//skips frames in both singleplayer and multiplayer depending on certain conditions

if (!instance_exists(gamemanager)) exit

var notpause;
notpause=argument[0]

notpause=(notpause && !gamemanager.pause)
if (instance_exists(changectrl)) notpause=0

if settings("frameskip") {view_visible[0]=0 if (global.mplay=2) view_visible[1]=0}

//controlled frameskip
if (settings("frameskip") && notpause && global.mplay<3) {
new=1000000/max(1,hrt_time_delta())

if (room_speed>60) {
   calc=new
   if (calc>60) fs=calc/60
   else fs=0.9
   if (current_time>marke+500) {
       if (num=0) show=round(calc) else show=round(sum/num)
       sum=0 num=0
       marke=current_time
   } else {
       sum+=calc num+=1
   }
} else if (room_speed=60) {calc=(calc*9+new)/10 global.frameskipshow=round(calc) fs=min(10,60/calc-0.1)}
else {calc=new show=round(calc) fs=0.9}


if (settings("frameskip")=2){k+=new/60 k=max(k,0.7)} //skip more frames
else {k+=1} //skip one frame

global.fstime=k

if (k>=fs) {k=0 view_visible[0]=1 if (global.mplay=2) view_visible[1]=1}
}
else {if (global.mplay=1) view_visible[0]=1 if (global.mplay=2) {view_visible[0]=1 view_visible[1]=1}}
