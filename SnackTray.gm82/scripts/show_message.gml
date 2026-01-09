/// BEcause show message is annoying
if string(global.lastshowmessage)=argument[0] global.showmessagetwicetwice+=1
else global.showmessagetwicetwice=0
if global.showmessagetwicetwice>5 exit //if i've seen the same shit 5 times, LEAVE

global.lastshowmessage=argument[0] 
return show_message(argument[0])
