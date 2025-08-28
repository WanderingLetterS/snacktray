global.animatePrincess=1

for (i = 1; i <= parameter_count(); i += 1) {
    if (parameter_string(i) == "-greenmode") {
        global.green_demon_mode=1
        instance_create(0,0,green_demon)
    }
}
