///readmoviefile(filename)
//reads a movie png and updates the replay buffer with the replay data
var f,fs,pos;

clearbuffer()
f=fileopen(argument[0],0)
fs=filesize(f)
fileread(f,fs)
fileclose(f)
setpos(fs-4)
pos=readuint()

discardmovie()

if (pos>fs || pos=0 || pos>1000000) return 0

copybuffer2(global.keylog,pos,fs-pos-4,0)

return 1
