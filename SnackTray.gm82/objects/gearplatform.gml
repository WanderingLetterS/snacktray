#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
initialy = y;
colbuffer = 3;

// chearii: bunch of useless additions
spinmode = 0; // 0 = idle, 1 = clockwise, 2 = counter-clockwise
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
coll = instance_place(x, y - 2, player);

if ((!spin) && (coll && coll.bbox_bottom < bbox_top) && (!(coll.jump)))
{
    // chearii: more accurate to how they are
    // in gimmick; they spin based on the
    // player's position when stood on
    myx = (x div 1);
    collx = (coll.x div 1);
    xdiff = (myx - collx);

    if (xdiff < 0)
        spinmode = 2;  // cw
    else
        spinmode = 1;  // ccw

    spin = 1;
    sound("itemgearplatform");
}

if (spin)
{
    colbuffer -= 1;
    fr += 0.25;
    if (fr >= 4)
    {
        spin = 0;
        spimode = 0;
        fr = 0;
    }

    if (!colbuffer)
    {
        y = -verybignumber;
    }
}
else
{
    spinmode = 0; // reset spinmode TWICE because AAAAHHHHHHHHH
    y = initialy;
    colbuffer = 3;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
drawframe = 0;

if ((spinmode == 2) && (spin)) // the spin check is simply to avoid a single-frame visual bug
{
    drawframe = min(max(0, floor(4 - fr)), 3);
}
else
{
    drawframe = floor(fr);
}
draw_background_part_ext(global.masterobjects[biome],560+(24*(drawframe)),232,24,24,x-12,y-12,1,1,c_white,image_alpha);
