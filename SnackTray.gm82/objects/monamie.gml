#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
alarm[1]=48
vspeed=-3
friction=0.1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
with (owner) monitem=1
p2=-1 //BUGFIX: player 1 would never get item credit or score from some item sources due to them not using p2 (which defaulted to 0)
fresh=1

if contents="10coin" {
    gib10coin(owner)
}
else if contents="mush" {
    give_item(owner,"mushroom")
}
else if contents="fire" {
    give_item(owner,"fflower")
}
else if contents="thunder" {
    give_item(owner,"tflower")
}
else if contents="water" {
    give_item(owner,"wflower")
}
else if contents="ice" {
    give_item(owner,"iflower")
}
else if contents="clover" {
    give_item(owner,"cflower")
}
else if contents="?mush" {
    give_item(owner,"?mushroom")
}
else if contents="mini" {
    give_item(owner,"mini")
}
else if contents="star" {
    fuel=660
    getimer=8
    give_item(owner,"star")
}
else if contents="1up" {
    give_item(owner,"1up")
}
else if contents="poison" {
    give_item(owner,"poison")
}
else if contents="feather" {
    give_item(owner,"bfeather")
}
else if contents="shield" {
    give_item(owner,"shield")
}
else if contents="superring" {
    gibsuperring(owner)
}
else if contents="time" {
    if global.gamemode == "timeattack" {
        sound("smallbumper")
    } else if instance_exists(gamemanager) {
        gamemanager.time+=30
        gamemanager.tick=gamemanager.time*60
        sound("itemclock")
    }
}
else if contents!=""{  give_item(owner,contents)} //yknow theoretically this failsafe makes the shield, poison, 1up, and mini lines irrelevant

with (owner) monitem=0


instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_monitor(contents)
