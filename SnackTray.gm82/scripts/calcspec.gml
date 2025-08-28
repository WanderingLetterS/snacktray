///calcspec()
//calculates loadspec for biome loading


loadspec=0
for (i = 0; i < 8; i += 1) {
    if (getbiomeid(lemongrab.typeobj[i]) != -1 && !global.biomesloaded[getbiomeid(lemongrab.typeobj[i])]) {
        global.biomesloaded[getbiomeid(lemongrab.typeobj[i])]=1
        loadspec |= (1 << getbiomeid(lemongrab.typeobj[i]))
    }
    if (getbiomeid(lemongrab.typebg[i]) != -1 && !global.biomesloaded[getbiomeid(lemongrab.typebg[i])]) {
        global.biomesloaded[getbiomeid(lemongrab.typebg[i])]=1
        loadspec |= (1 << getbiomeid(lemongrab.typebg[i]))
    }
    if (getbiomeid(lemongrab.typemus[i]) != -1 && !global.biomesloaded[getbiomeid(lemongrab.typemus[i])]) {
        global.biomesloaded[getbiomeid(lemongrab.typemus[i])]=1
        loadspec |= (1 << getbiomeid(lemongrab.typemus[i]))
    }
}
for (i=0;i<global.biomes;i+=1) {
    if (tylerbiomes[i] && !global.biomesloaded[i])
        loadspec |= (1 << i)
}
