//scrDestroySelf();

var trail = instance_create(x,y,objTrail);
trail.sprite_index = sprite_index;
trail.image_index = image_index;
trail.image_speed = image_speed;
trail.speed = speed;
trail.direction = direction;
trail.image_angle = image_angle;
trail.image_xscale = image_xscale;
trail.image_yscale = image_yscale;
trail.depth = depth;

instance_destroy();

