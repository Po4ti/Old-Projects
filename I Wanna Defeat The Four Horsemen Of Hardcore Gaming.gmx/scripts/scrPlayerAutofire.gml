if(autoFireDelay <= 0) {
    if (instance_number(objBullet) < 4)
    {
        instance_create(x,y,objBullet);
        audio_play_sound(sndShoot,0,false);
    }
    autoFireDelay = 5;
}
else {
    autoFireDelay--;
}

autoFireDelay = clamp(autoFireDelay,0,100);
