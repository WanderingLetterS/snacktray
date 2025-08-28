///chosesnd(slot)
//plays selection voice for that slot

if (global.option[argument[0]]=-1) sound("systemactualrandom")
else return playsfx(global.charname[global.option[argument[0]]]+"select")
