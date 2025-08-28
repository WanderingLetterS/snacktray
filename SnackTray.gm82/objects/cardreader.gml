#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
frame=0
image_xscale=2
image_yscale=2
open=0
fc=0
flash=0
cardamount=1
locktype="card"
name="" pack=""
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!cardamount && locktype != "tokengreen") {
    //event_user(2) //Apparently card readers that require 0 cards usually just don't open instead of opening when you have 0 cards so this would actually break levels. Hate this game
    exit;
}

if (locktype=="card") { //Take the card reader challenge! Do 10 pushups every time the code that puts cards into the card reader says "other"
    
    with (other) other.hascards=max(other.hascards,count_owned(cardfollow))
    
    with (other){
        other.cardstoinsert=count_owned(cardfollow)
        if other.cardstoinsert>other.cardamount other.cardstoinsert=other.cardamount
        
        if (other.cardstoinsert) {
            with (other) if (cardstoinsert) {
                repeat (cardstoinsert) {
                    o=other.cfollower
                    while (o.cfollower) o=o.cfollower
                    if (o) with (o) {cfollow.cfollower=noone instance_destroy() instance_create(x,y,smoke)}
                }
                
                cardamount-=cardstoinsert
                if cardamount=0 event_user(2)
            }
        } 
    }
} else {
    var amt;
    if (locktype == "token" && gamemanager.tokens) {amt=min(cardamount,gamemanager.tokens) repeat (amt) {gamemanager.tokens-=1 cardamount-=1}}
    else if (locktype == "tokenblue" && global.tokens) {amt=min(cardamount,global.tokens) repeat (amt) {if !global.tokens break; global.tokens-=1 cardamount-=1 spendtoken()}}
    else if (locktype == "tokengreen" && settings("token " + name + " " + chr(187) + pack)) {settings("token " + name + " " + chr(187) + pack,2) cardamount=0}
    
    if cardamount = 0 event_user(2)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cardamount=unreal(cardamount,0)

pack = global.lskins[global.levelskin+1,0]
if (pack == global.lbase) pack = ""

if (locktype=="tokengreen" && settings("token " + name + " " + chr(187) + pack) == 2) {instance_destroy() exit;}
if (locktype=="tokenblue" && cardamount) {cardamount-=spenttoken() if cardamount<=0 {instance_destroy() exit;}}

colltime=instance_create(x-16,y-16,collider) with colltime {image_xscale=2 image_yscale=2}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_create(x+4,y-4,smoke)) {direction=135 speed=2 friction=0.1}
with (instance_create(x+12,y-4,smoke)) {direction=45 speed=2 friction=0.1}
with (instance_create(x+4,y+4,smoke)) {direction=225 speed=2 friction=0.1}
with (instance_create(x+12,y+4,smoke)) {direction=315 speed=2 friction=0.1}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Alternate activation
with (instance_create(x,y-8,smoke)) {direction=135 speed=2 friction=0.1}
            with (instance_create(x+16,y-8,smoke)) {direction=45 speed=2 friction=0.1}
            with (instance_create(x,y+8,smoke)) {direction=225 speed=2 friction=0.1}
            with (instance_create(x+16,y+8,smoke)) {direction=315 speed=2 friction=0.1}
            instance_create(x+8,y,kickpart)
            with (colltime) instance_destroy()
            instance_create(x,y,readerdestroyup)
            instance_create(x,y,readerdestroydown)
            instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("cardreaderdown")
ssw_objects("cardreaderup")

if cardamount<=0 && locktype!="tokengreen" exit
x-=8
y-=9

if locktype=="card" {
    ssw_items("cardforshow")
    col=$ffffff
    global.halign=1
    draw_skintext(x+11,y-4,"x"+string(cardamount),col,1)
    global.halign=0
} else {
    if (locktype=="tokenblue") type=1
    else if (locktype=="tokengreen") type=2
    else type=0

    col=$ffffff
    if type==2 && !settings("token " + name + " " + chr(187) + pack) col=$808080

    global.halign=1
    x-=1
    if type!=2 {
        ssw_items("tokenforshow")
        draw_skintext(x+13,y-4,"x"+string(cardamount),col,1)
    }
    else {
        x+=9
        ssw_items("tokenforshow")
        if (abs(player.x-xstart)<=48 && abs(player.y-ystart)<=48) {
            draw_skintext(x,y-19,name,col,1)
        }
        x-=9
    }
    x+=1
    global.halign=0
}
x+=8
y+=9
