///scrGetAngle(instance)
if instance_exists(argument0){
    return point_direction(x,y,argument0.x,argument0.y);
}
else {
    return 270;
}

