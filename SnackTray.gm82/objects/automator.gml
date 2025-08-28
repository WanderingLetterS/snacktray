#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bonus=max(bonus-1,0)

for (i=0;i<4;i+=1) {
    p=gamemanager.players[i]
    if (timer[i]) {
        timer[i]-=1
        if (!timer[i]) {
            p.auto=1

            for (j=1;j<c;j+=1) {
                if (list[j]="up") p.up=1
                if (list[j]="down") p.down=1
                if (list[j]="left") p.left=1
                if (list[j]="right") p.right=1
                if (list[j]="a") p.akey=1
                if (list[j]="b") p.bkey=1
                if (list[j]="stop") {with (p) player_stop()}
                if (list[j]="end") p.auto=0
                if (list[j]="clear") {p.left=0 p.right=0 p.up=0 p.down=0 p.akey=0 p.bkey=0}
            }

            timer2[i]=length
        }
    }
    if (timer2[i]) {
        timer2[i]-=1
        if (!timer2[i]) {
            p=gamemanager.players[i]
            for (j=1;j<c;j+=1) {
                if (list[j]="up") p.up=0
                if (list[j]="down") p.down=0
                if (list[j]="left") p.left=0
                if (list[j]="right") p.right=0
                if (list[j]="a") p.akey=0
                if (list[j]="b") p.bkey=0
            }
        }
    }

    if (timer[i]=0 && timer2[i]=0) if (!place_meeting(x,y,p)) timer[i]=-1
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.piped) exit
if (timer[other.p2]=-1) timer[other.p2]=wait+bonus

p=other.id
//if (!p.auto) {p.left=0 p.right=0 p.up=0 p.down=0 p.akey=0 p.bkey=0 p.auto=1}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=0
do {
    p=string_pos(" ",args)
    if (p=0) list[c]=args
    else {
        list[c]=string_copy(args,1,p-1)
        args=string_delete(args,1,p)
    }
    c+=1
} until (p=0)

wait=1
if (c>2) wait=max(1,unreal(list[c-2],1))
if (c>3) length=unreal(list[c-1],0)

bonus=8
