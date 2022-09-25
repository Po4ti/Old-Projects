///scrRoundHPBar(curHP,maxHP,x,y,radius,radius+width,num,sa,dir,1,sprite,subimg)
var v, vm, xx, yy, r, rr, dlvl, sa, ma, dir, tex, subimg, va;

v = argument0;
vm = argument1;
xx = argument2;
yy = argument3;
r = argument4;
rr = argument5;
dlvl = argument6;
sa = argument7;
ma = argument8;
dir = argument9;
tex = sprite_get_texture(argument10,argument11);
va = v*ma/vm;

draw_set_color(c_white);
draw_primitive_begin_texture(pr_trianglestrip,tex);

for(i = 0; i<= dlvl; i += 1){
    draw_vertex_texture(xx+lengthdir_x(r,sa+dir*(va*i/dlvl)),yy+lengthdir_y(r,sa+dir*(va*i/dlvl)),0,0);
    draw_vertex_texture(xx+lengthdir_x(rr,sa+dir*(va*i/dlvl)),yy+lengthdir_y(rr,sa+dir*(va*i/dlvl)),1,1);
}

draw_primitive_end();


