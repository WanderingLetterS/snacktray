//detects steam or joy2key translating gamepads into keyboard
var snap,check,i;

if (!global.steamprompt) {
    //snapshot keyboard state
    check=0
    with (rostercursor) if (p2=0) {
        snap[0]=up
        snap[1]=down
        snap[2]=left
        snap[3]=right
        if (up || down || left || right) check=1
    }

    //compare keyboard with each gamepad
    if (check) {
        check=0
        for (i=JOY;i<JOY+11;i+=1) with (rostercursor) if (p2=i) if (snap[0]=up && snap[1]=down && snap[2]=left && snap[3]=right)
            check=1

        //if there"s a similarity
        if (check) {
            steamcounter+=1
            if (steamcounter>=180) {
                global.steamprompt=1
                ping(lang("error steam desktop controller"))
            }
        } else {
            //if there are keys down but they arent the same then its not the case
            steamcounter-=1
            if (steamcounter<-128) global.steamprompt=1
        }
    }
}
