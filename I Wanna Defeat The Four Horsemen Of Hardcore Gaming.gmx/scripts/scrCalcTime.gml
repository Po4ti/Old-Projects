///scrCalcTime(distance,speed)
{
        var s,d;
        d = argument0;
        s = argument1;
        if (s < 0) {
            return -1;
        }
        else if (s == 0) {
            return 0;
        }
        else {
            return (d/s);
        }
}


