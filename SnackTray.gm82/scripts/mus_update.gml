///mus_update()
//updates music fade and dll state
var bals,balm;

with (globalmanager) {
    if (musfade) {
        musvol=max(0,musvol-0.02)
        if (musvol>0.0025) mus_volume(musvol)
        else {mus_stop() mus_volume(1) musfade=0}
    }

    low=(settings("dequanto")==3)

    if (low!=global.vaporpass[0]) {
        bals=min(1,settings("musbalance")*2)
        balm=min(1,(1-settings("musbalance"))*2)
        if (low) {
            global.vaporpass[1]=FMODGroupAddEffect(1,19)
            //FMODEffectSetParamValue(global.vaporpass[1],0,5000)
            global.vaporpass[2]=FMODGroupAddEffect(2,19)
            //FMODEffectSetParamValue(global.vaporpass[2],0,5000)
        } else {
            FMODEffectFree(global.vaporpass[1])
            FMODEffectFree(global.vaporpass[2])
        }
        global.vaporpass[0]=low
        volumehandler()
    }

    FMODUpdate()
}
