///scrDrawOutline(x,y,color)

var xx, yy, color;

xx = argument0;
yy = argument1;
color = argument2;
 

d3d_set_fog(1,color,0,0);
for(i = -xx; i <= xx; i ++)
    for(ii = -yy; ii <= yy; ii ++) {
        draw_sprite_ext(sprite_index,image_index,x+i,y + ii,image_xscale,image_yscale,image_angle,c_white,0.2)
}
d3d_set_fog(0,color,0,0);
 
