if (eid!=-1) {
    frame+=frs
    if (frame>=frn) {frame=frame-frn if (frl<frn) frame+=frl}
    frame=modulo(precise(frame),0,frn)
}
