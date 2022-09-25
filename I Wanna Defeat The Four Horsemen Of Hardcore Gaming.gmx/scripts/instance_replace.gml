///instance_replace(new)
var new,inst;
new = argument0;

inst = instance_create(x,y,new);
inst.image_angle=image_angle;
inst.direction=direction;
inst.image_blend=image_blend;

instance_destroy();
