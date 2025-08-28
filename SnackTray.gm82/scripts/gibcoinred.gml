//give other a red coin

if (/*!hit &&*/ active && !argument[0].diggity) {

    gamemanager.redcount+=1
    active=0
    global.scor[argument[0].p2]+=scoresequence(gamemanager.redcount)
    with (instance_create(x,y-16,redcoinping)) redvalue=gamemanager.redcount
    if (argument[0].name!="kid") {give_item(argument[0],"coin")} //coin is my favourite type of shell
    if (argument[0].name="robo") argument[0].energy+=2

    stats("red coins collected",stats("red coins collected")+1)
    if (gamemanager.redcount=8) {
        gamemanager.redcount=0
        with (redcoin) {
            instance_create(x,y,smoke)
            y=-verybignumber
            active=0
        }
        stats("red coins completed",stats("red coins completed")+1)
        sound("itemcoinredall")
        pee2=p2 p2=-1
        with (argument[0]) {
            itemc+=1
            if (name="kid") {
                bow=1
             //BUGFIX: player 1 would never get item credit or score from some item sources due to them not using p2 (which defaulted to 0)
            } else if ((size=2 || super || size=3)&&shielded) {
                give_item(id,"1up")
            } else {
                if !size give_item(id,"mushroom") else {if size =1 if string(other.powerup)!="1" give_item(id,"fflower") else give_item(id,"bfeather") else {give_item(id,"shield")} }
           }
        }
        p2=pee2
    } else {
        sound("itemcoinred",0,power(root12of2,gamemanager.redcount-1))
    }
    if argument[1] instance_destroy()
    return 1
}
return 0
