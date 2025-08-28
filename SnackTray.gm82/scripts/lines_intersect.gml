/// lines_intersect(x1,y1,x2,y2,x3,y3,x4,y4)
//
//  Returns a vector multiplier (t) for an intersection on the
//  first line. A value of (0 < t <= 1) indicates an intersection
//  within the line segment, a value of 0 indicates no intersection,
//  other values indicate an intersection beyond the endpoints.
//
//      x1,y1,x2,y2     1st line segment
//      x3,y3,x4,y4     2nd line segment
//      segment         If true, confine the test to the line segments.
//
//  By substituting the return value (t) into the parametric form
//  of the first line, the point of intersection can be determined.
//  eg. x = x1 + t * (x2 - x1)
//      y = y1 + t * (y2 - y1)
//
/// GMLscripts.com/license
{
    var ua, ub, ud, ux, uy, vx, vy, wx, wy;
    ua = 0;
    ux = argument[2] - argument[0];
    uy = argument[3] - argument[1];
    vx = argument[6] - argument[4];
    vy = argument[7] - argument[5];
    wx = argument[0] - argument[4];
    wy = argument[1] - argument[5];
    ud = vy * ux - vx * uy;
    if (ud != 0)
    {
        ua = (vx * wy - vy * wx) / ud;
        ub = (ux * wy - uy * wx) / ud;
        if (ua < 0 || ua > 1 || ub < 0 || ub > 1) ua = 0;
    }
    return ua;
}
