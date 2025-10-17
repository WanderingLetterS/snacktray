///loaddefault()
//loads default settings and saves them

settings("version",version)
settings("volbalance",0.5)
settings("musbalance",0.5)
settings("keyboard1",string(vk_up)+"|"+string(vk_down)+"|"+string(vk_left)+"|"+string(vk_right)+"|"+string(ord("X"))+"|"+string(ord("Z"))+"|"+string(ord("C"))+"|"+string(vk_enter)+"|"+string(ord("A"))+"|"+string(ord("S"))+"|"+string(ord("D"))+"|"+string(ord("V"))+"|")
settings("keyboard2",string(ord("I"))+"|"+string(ord("K"))+"|"+string(ord("J"))+"|"+string(ord("L"))+"|"+string(ord("W"))+"|"+string(ord("Q"))+"|"+string(ord("E"))+"|"+string(vk_backspace)+"|"+string(ord("1"))+"|"+string(ord("2"))+"|"+string(ord("3"))+"|"+string(ord("R"))+"|")
settings("zoom",3)
settings("zoomlemon",1)
settings("playstages",8)
settings("language","")
settings("wskinpin","")
settings("mskinpin","")
settings("lskinpin","")
settings("dequanto",0)
settings('discord',0)
settings("autopause",1)
settings("menumusic","")
settings("lemonmusic","")
settings("edit autosave",1)
settings("detail",0)
settings("camshimmie",0)




for (i=0;i<9;i+=1) {
    settings("contest"+string(i),1)
    settings("contestbkp"+string(i),1)
}
