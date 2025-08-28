///input_keystates()
//button pressed and released detection based on previous state

abut=0 arel=0 if (akey && !alok) {abut=1 alok=1} if (!akey && alok) {arel=1 alok=0}
bbut=0 brel=0 if (bkey && !blok) {bbut=1 blok=1} if (!bkey && blok) {brel=1 blok=0}
cbut=0 crel=0 if (ckey && !clok) {cbut=1 clok=1} if (!ckey && clok) {crel=1 clok=0}
sbut=0 srel=0 if (skey && !slok) {sbut=1 slok=1} if (!skey && slok) {srel=1 slok=0}
xbut=0 xrel=0 if (xkey && !xlok) {xbut=1 xlok=1} if (!xkey && xlok) {xrel=1 xlok=0}
ybut=0 yrel=0 if (ykey && !ylok) {ybut=1 ylok=1} if (!ykey && ylok) {yrel=1 ylok=0}
zbut=0 zrel=0 if (zkey && !zlok) {zbut=1 zlok=1} if (!zkey && zlok) {zrel=1 zlok=0}
rbut=0 rrel=0 if (rkey && !rlok) {rbut=1 rlok=1} if (!rkey && rlok) {rrel=1 rlok=0}
