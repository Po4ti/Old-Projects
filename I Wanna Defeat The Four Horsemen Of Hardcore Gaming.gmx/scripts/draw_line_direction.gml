///draw_line_direction(x,y,direction)
var rr,xx,yy;
rr = sqrt(sqr(view_wview[view_current])+sqr(view_hview[view_current]));
xx = argument0 + lengthdir_x(rr,argument2);
yy = argument1 + lengthdir_y(rr,argument2);
draw_line(argument0,argument1,xx,yy);
