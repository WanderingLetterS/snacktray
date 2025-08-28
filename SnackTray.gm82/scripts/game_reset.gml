///game_reset(game start)
//resets the game variables to initial state
//called on match quit
var i,j;

global.check=""
global.rand=0
global.lifes=5
global.savelifes=5
global.exception=""
global.playback=0
global.record=1
global.spd=60
global.stages=0
global.visualstagecount=0
global.quickplaying=0
if (string(global.gamemode)!="timeattack") {
    global.gamemode="classic" //boll deluxe versions prior to 2.1.1 after setting global.gamemode to "" and then watching as the game somehow fails to set it to classic later:
} else {
    settings("ratchet",settings("ta_ratchet"))
    settings("randblock",settings("ta_randblock"))

    settings("ta_ratchet",0)
    settings("ta_randblock",0)
}
global.mplay=1
global.respawn=0
global.hidereplayui=0
global.cheater=0
global.sspr=""
global.tpose=0
global.time=300
global.levelname=""
global.leveldesc=""
global.nextlevel=""
global.skinnedpath=""
global.stagecount=0
global.actually_recording_goddamnit=0
global.wastasing=0
global.enteredachardoor=0
global.tokens=0
global.emeralds=0
global.special=0
global.musicskin=0
global.music=""
global.wanna=0
global.bundled=0
settings("ta_death",0)
global.my_ta=(9 * 60 * 60) + (59 * 60) + (99 / 1.66666666)
global.nohud=0
global.reset_on_state_load=1
global.the_cooler_infinite_lives=0
if global.discordoverride<2 global.discordoverride=0

ds_map_clear(global.spentblocks)
ds_map_clear(global.tokenspend)

settings("kiddeath",0)
settings("kidresetbuf",0)
skindat("musmem","")

for (i=0;i<9;i+=1) settings("contest"+string(i),settings("contestbkp"+string(i)))
j=skindat("maxspecial")
for (i=0;i<j;i+=1) global.moranplayed[i]=0

discardmovie()
for (i=0;i<4;i+=1) {
    global.playerskin[i]=0
    global.size[i]=0
    global.startsize[i]=0
    global.coins[i]=0
    global.rings[i]=0
    global.scor[i]=0
    global.star[i]=0
    global.shielded[i]=0
    global.startshielded[i]=0
    global.energy[i]=0
    global.points[i]=0
    global.pthist[i]=0
    for (j=0;j<7;j+=1) global.scores[j,i]=0
    global.option[i]=-1
    global.myoption[i]=-1
}

if (!global.lemontest) applylevelpack(global.lskins[1,0])
input_discard()

if (global.worldskin!=0 && !global.lemontest) {
    global.worldskin=0
    global.worldskin2=0
}

updatemusic()
