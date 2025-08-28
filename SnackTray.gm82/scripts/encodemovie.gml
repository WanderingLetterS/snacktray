///encodemovie()
//adds current input state to the movie buffer

if (global.record && !global.cheater && !global.bundled) {
    writebyte(left+right*2+up*4+down*8+akey*16+bkey*32+ckey*64+skey*128,global.keylog)
    writebyte(xkey+ykey*2+zkey*4+rkey*8,global.keylog)
    global.pos+=1
}
