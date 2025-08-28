if (argument[0]<10) {
    if (skindat("pitchkick")) sound("enemykick",0,power(root12of2,max(0,argument[0]-2)*2))
    else sound("enemykick")
}
