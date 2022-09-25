///scrAddColorfulLayer(color,scaleFactor)
if(!global.spriteGlow) {
    exit;
}

var color,scaleF;

color = argument0;
scaleF = argument1;

draw_set_blend_mode(bm_add);
draw_sprite_ext(sprRoundLayer ,image_index ,x ,y ,scaleF,scaleF,image_angle ,color ,0.6);
draw_set_blend_mode(bm_normal);
