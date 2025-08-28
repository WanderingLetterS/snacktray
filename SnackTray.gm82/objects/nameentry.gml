#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/



placement = 5
stopcount = 0
players[0].tick = global.my_ta
players[0].name = global.charname[global.option[0]]
name = players[0].name //im too lazy to type the full thing and im too lazy to change the other full things

l = global.lskins[global.levelskin+1,0]
if (l == global.lbase) l = ""

pname=get_string("Enter a name! (3 Characters)",pname)

ta_load()
cheater = global.cheater + global.lowgrav + global.highgrav + global.fuzzy + global.debug + (players[0].tick<180)
tas=""
if global.wastasing tas="tas_"

if (!cheater && string(pname)!="" && string(pname)!="0" && !(settings("Hi_im_dev") && (name == "ashura" || name == "super")) /*don't add unlockable dev times to the regular leaderboard*/) {

    for (i=4;i>=0;i-=1) {
        t=ta_set("ta_time_"+tas+string(i)+global.currentlevel+l)
        
        if ((players[0].tick < t) && !stopcount) {
            placement-=1
        } else {
            stopcount=1
        }
    }
    global.pipeplacement=placement
    for (j=4;j>=placement;j-=1) {
        ta_set("ta_time_"+tas+string(j+1)+global.currentlevel+l,ta_set("ta_time_"+string(j)+global.currentlevel+l)) //time
        ta_set("ta_char_"+tas+string(j+1)+global.currentlevel+l,ta_set("ta_char_"+string(j)+global.currentlevel+l)) //player name
        ta_set("ta_dev_"+tas+string(j+1)+global.currentlevel+l,ta_set("ta_dev_"+string(j)+global.currentlevel+l)) //Add the dev icon at the right of the time!
        ta_set("ta_pname_"+tas+string(j+1)+global.currentlevel+l,ta_set("ta_pname_"+string(j)+global.currentlevel+l)) //You.
    }
        
    ta_set("ta_time_"+tas+string(placement)+global.currentlevel+l,players[0].tick) //time
    ta_set("ta_char_"+tas+string(placement)+global.currentlevel+l,players[0].name) //player name
    ta_set("ta_dev_"+tas+string(placement)+global.currentlevel+l,settings("Hi_im_dev")) //Add the dev icon at the right of the character!
    ta_set("ta_pname_"+tas+string(placement)+global.currentlevel+l,string_copy(pname,1,3)) //You.

}

//okay now do that again but for solo character leaderboards

placement = 5
stopcount = 0

    
if (!cheater && string(pname)!="" && string(pname)!="0") {

    for (i=4;i>=0;i-=1) {
        t=ta_set("ta_time_"+tas+string(i)+global.currentlevel+l+name)
        
        if ((players[0].tick < t) && !stopcount) {
            placement-=1
        } else {
            stopcount=1
        }
    }
    global.pipeplacement2=placement //xd
    for (j=4;j>=placement;j-=1) {
        ta_set("ta_time_"+tas+string(j+1)+global.currentlevel+l+name,ta_set("ta_time_"+string(j)+global.currentlevel+l+name)) //time
        ta_set("ta_char_"+tas+string(j+1)+global.currentlevel+l+name,ta_set("ta_char_"+string(j)+global.currentlevel+l+name)) //player name
        ta_set("ta_dev_"+tas+string(j+1)+global.currentlevel+l+name,ta_set("ta_dev_"+string(j)+global.currentlevel+l+name)) //Add the dev icon at the right of the time!
        ta_set("ta_pname_"+tas+string(j+1)+global.currentlevel+l+name,ta_set("ta_pname_"+string(j)+global.currentlevel+l+name)) //You.
    }
        
    ta_set("ta_time_"+tas+string(placement)+global.currentlevel+l+name,players[0].tick) //time
    ta_set("ta_char_"+tas+string(placement)+global.currentlevel+l+name,name) //player name
    ta_set("ta_dev_"+tas+string(placement)+global.currentlevel+l+name,settings("Hi_im_dev")) //Add the dev icon at the right of the character!
    ta_set("ta_pname_"+tas+string(placement)+global.currentlevel+l+name,string_copy(pname,1,3)) //You.

}

ta_save()

room_goto_safe(ta_results)
instance_destroy()
