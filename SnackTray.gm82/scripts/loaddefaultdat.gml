///loaddefaultdat(slot)
//Loads some pre-set skin data before the real ones to hopefully stop some player.txt leaking. Sorry in advance for this terrible code.
var slot,ss,index,what,dir,str,p,name;
slot=argument[0]
ss=string(slot)
name=argument[1]


   playerskindat(slot,"addbde"+ss,false)
   playerskindat(slot,"cushud"+ss,false)
   playerskindat(slot,"3ddeath"+ss,false)
   playerskindat(slot,"glideanim"+ss,true)
   playerskindat(slot,"pitchdash"+ss,true)
   playerskindat(slot,"kidsplat"+ss,true)
   playerskindat(slot,"jumpball"+ss,false)
   playerskindat(slot,"bowlag"+ss,false)
   playerskindat(slot,"minisheet"+ss,false)
   playerskindat(slot,"useypos"+ss,true)

   playerskindat(slot,"snacklayout"+ss,false)


    playerskindat(slot,name+" single sheet","NO.")

   playerskindat(slot,"bolltex"+ss,-1)

   playerskindat(slot,name+" 3ddeath",0)
   playerskindat(slot,name+" minisheet",0)
   playerskindat(slot,name+" glideanim",0)
   playerskindat(slot,name+" pitchdash",0)
   playerskindat(slot,name+" kidsplat",0)
   playerskindat(slot,name+" bowlag",0)
   playerskindat(slot,name+" small shield offset",4)
   playerskindat(slot,name+" roster size",-1)


   playerskindat(slot,"bollcoltop"+ss,$ff00ff)
   playerskindat(slot,"bollcolmid"+ss,$880088)
   playerskindat(slot,"bollcolbot"+ss,$000000)

   playerskindat(slot,"firelen"+ss,0)
   playerskindat(slot,"viclen"+ss,0)
   playerskindat(slot,"vicfr"+ss,1)
   playerskindat(slot,"poleoffx"+ss,0)
   playerskindat(slot,"maxwait"+ss,0)
   playerskindat(slot,"squish"+ss,0)
   playerskindat(slot,"skin_offsety"+ss,128)
   playerskindat(slot,"moth"+ss,24)
   playerskindat(slot,"shortsmallform"+ss,0)

   playerskindat(slot,"offshield"+ss,0)
   playerskindat(slot,"spdshield"+ss,0)
   playerskindat(slot,"smlshield"+ss,4)


   playerskindat(slot,"afterimageblend"+ss,$ffffff)

   playerskindat(slot,"carryx"+ss,0)
   playerskindat(slot,"carryy"+ss,0)

    playerskinstr(slot,"wspecial"+ss,"You got a Chaos Emerald!")
    playerskinstr(slot,"aspecial"+ss,"You got all Chaos Emeralds!")
    playerskinstr(slot,"princess"+ss,"our Princess")
    playerskinstr(slot,"savetext1"+ss,"Peace is Paved")
    playerskinstr(slot,"savetext2"+ss,"With Kingdom Saved")
    playerskinstr(slot,"savetext3"+ss,"Hurrah to You")
    playerskinstr(slot,"savetext4"+ss,"A Textless Hero, Too")
    playerskinstr(slot,"savetext5"+ss,"This Ends Your Trip")
    playerskinstr(slot,"savetext6"+ss,"Of a Long Friendship")
    playerskinstr(slot,"credits"+ss,"")


    //Teh adiwah situation is unfixable, the skins must contain all possible data they can have for their animations.
    //That's it. Honestly, probably for the better anyway.
