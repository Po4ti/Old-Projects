///scrCalcFriction(distance,speed)
{
        var s,d;
        d = argument0;
        s = argument1;
        if (d < 0) {
            return -1;
        }
        else if (d == 0) {
            return 0;
        }
        else {
            return (s*s)/(s+2*d);
        }
}


