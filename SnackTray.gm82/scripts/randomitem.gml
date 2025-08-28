var table,i;

i=0
repeat (40) {table[i]="" i+=1}
repeat (15) {table[i]="coins" i+=1}
repeat (10) {table[i]="poison" i+=1}

repeat (3) {table[i]="item" i+=1}
repeat (3) {table[i]="itemfeather" i+=1}
repeat (3) {table[i]="thunderitem" i+=1}
repeat (3) {table[i]="wateritem" i+=1}
repeat (1) {table[i]="iceitem" i+=1}
repeat (1) {table[i]="cloveritem" i+=1}

repeat (7) {table[i]="mini" i+=1}
repeat (5) {table[i]="life" i+=1}
repeat (5) {table[i]="star" i+=1}
repeat (3) {table[i]="shield" i+=1}
repeat (1) {table[i]=choose("shield","shard") i+=1}

return table[floor(min(myrand(100),99))]
