#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type=""
t=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=0.25
y=ystart+round(sin(x+t/2)*2-3)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,glitter)
sound("itemcoinredall")
with (other) doscore_p(8000,1)
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


//Clover Flower
if type="Clover Flower"||type="CloverFlower"||type="clover flower"||type="cloverflower"||type="clover flower"||type="cflower"{
    instance_create(x,y,cflower)
}
//Clover Flower itembox maybe
if type="Clover Flower Itembox"{
    i=instance_create(x,y,itembox)
    i.content="cloveritem"
}
//Clover Flower monitor maybe
if type="Clover Flower Monitor"{
    i=instance_create(x,y,monitor)
    i.contents="clover"
}


//Water Flower
if type="Water Flower"||type="WaterFlower"||type="water flower"||type="waterflower"||type="water flower"||type="wflower"{
    instance_create(x,y,wflower)
}
//Water Flower itembox maybe
if type="Water Flower Itembox"{
    i=instance_create(x,y,itembox)
    i.content="wateritem"
}
//Water Flower monitor maybe
if type="Water Flower Monitor"{
    i=instance_create(x,y,monitor)
    i.contents="water"
}



//Thunder Flower
if type="Thunder Flower"||type="ThunderFlower"||type="thunder flower"||type="thunderflower"||type="thunder flower"||type="tflower"{
    instance_create(x,y,tflower)
}
//Thunder Flower itembox maybe
if type="Thunder Flower Itembox"{
    i=instance_create(x,y,itembox)
    i.content="thunderitem"
}
//Thunder Flower monitor maybe
if type="Thunder Flower Monitor"{
    i=instance_create(x,y,monitor)
    i.contents="thunder"
}


//Ice Flower
if type="Ice Flower"||type="IceFlower"||type="ice flower"||type="iceflower"||type="ice flower"||type="iflower"{
    instance_create(x,y,iflower)
}
//Ice Flower itembox maybe
if type="Ice Flower Itembox"{
    i=instance_create(x,y,itembox)
    i.content="iceitem"
}
//Ice Flower monitor maybe
if type="Ice Flower Monitor"{
    i=instance_create(x,y,monitor)
    i.contents="ice"
}

//minus world
if (type="miner") instance_create(x,y,miner)
//castle flags
if (type="flag") instance_create(x,y,flaggy)
//castle door marker for players to walk in
if (type="castledoor") instance_create(x,y,castledoor)
//a standalone secret camera block that isnt aligned to the grid
if (type="camspace") instance_create(x-8,y-8,camspace)
//a wall barrier that shows up in multiplayer modes (used in kid unlock)
if (type="2pwall" && global.mplay>1) instance_create(x-8,0,finalwall)
//minus world broken bowser object
if (type="minusbowser") instance_create(x,y,minusbowser)
//resets the players token counter
if (type="tokenreset") instance_create(x,y,tokenreset)
if (type="MISSING") instance_create(x,y,MISSING)
//wind test thing, you can delete it if you want
//if (type="wind") instance_create(x-8,y-8,wind)
//p switch item
//if (type="pswitch") instance_create(x-8,y-8,pswitch)
//cutscene automator
if (string_pos("auto",type)) with (instance_create(x,y,automator)) {args=other.type event_user(0)}
//guile easter egg positions
if (type="guile") instance_create(x,y+8,guile)
if (type="tran") {image_speed=0 image_index=2 visible=1 exit}
//if (type="b") instance_create(x,y,clawbase)
//if (type="belt") instance_create(x,y,conveyorbelt)

instance_destroy()
